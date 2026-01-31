% CO₂ Detection and Visualization Using Hyperspectral Satellite Data

% This script loads hyperspectral satellite data, identifies CO₂ absorption
% bands in the NIR and SWIR regions, estimates CO₂ concentration levels,
% and visualizes the results both as images and on a georeferenced map.
%
% The workflow includes:
% - Loading hyperspectral data and wavelength information
% - Identifying CO₂ absorption bands
% - Visualizing selected spectral bands
% - Estimating CO₂ concentration (ppm)
% - Geospatial visualization using MATLAB Mapping Toolbox

clear;
clc;

%% Step 1: Load the Hyperspectral Data
dataFile = 'f110712t01p00r18rdn_c_sc01_ort_img.mat';  
dataStruct = load(dataFile);

% Display available fields in the loaded .mat file
disp('Fields in the loaded .mat file:');
disp(fieldnames(dataStruct));


%% Step 2: Identify Hyperspectral Data and Wavelength Information

% Dynamically identify the hyperspectral data field
fieldNames = fieldnames(dataStruct);
bands = [];
wavelengths = [];

for i = 1:numel(fieldNames)
    fieldData = dataStruct.(fieldNames{i});
    if ndims(fieldData) == 3  
        bands = fieldData;
        disp(['Using hyperspectral data field: ', fieldNames{i}]);
    elseif isvector(fieldData) && isnumeric(fieldData)
        wavelengths = fieldData;
        disp(['Using wavelength field: ', fieldNames{i}]);
    end
end

if isempty(bands)
    error('No 3D hyperspectral data found in the .mat file.');
end

if isempty(wavelengths)
    error('No wavelength information found in the .mat file.');
end

[h, w, d] = size(bands);
disp(['Data dimensions: ', num2str(h), ' x ', num2str(w), ' x ', num2str(d)]);
disp(['Number of wavelengths: ', num2str(length(wavelengths))]);


%% Step 3: Identify CO₂ Absorption Bands

% CO₂ absorption wavelength ranges (in nanometers)
co2_nir_range = [1570, 1610];  % Near-Infrared (NIR) CO₂ absorption
co2_swir_range = [2000, 2060]; % Shortwave Infrared (SWIR) CO₂ absorption

% Find the indices of the bands within the CO₂ absorption ranges
co2_nir_indices = find(wavelengths >= co2_nir_range(1) & wavelengths <= co2_nir_range(2));
co2_swir_indices = find(wavelengths >= co2_swir_range(1) & wavelengths <= co2_swir_range(2));

if ~isempty(co2_nir_indices)
    disp(['NIR CO₂ band indices: ', sprintf('%d ', co2_nir_indices)]);
else
    disp('No NIR CO₂ bands found.');
end

% Display SWIR CO₂ indices
if ~isempty(co2_swir_indices)
    disp(['SWIR CO₂ band indices: ', sprintf('%d ', co2_swir_indices)]);
else
    disp('No SWIR CO₂ bands found.');
end


%% Step 4: Extract and Visualize CO₂ Bands

% Check if any CO₂ bands were found
if isempty(co2_nir_indices) && isempty(co2_swir_indices)
    error('No CO₂ bands found within the specified ranges.');
end

% Visualize the first NIR CO₂ band if available
if ~isempty(co2_nir_indices)
    co2_nir_band = bands(:, :, co2_nir_indices(1));
    figure;
    imagesc(co2_nir_band);
    colorbar;
    title(['NIR CO₂ Band at ', num2str(wavelengths(co2_nir_indices(1))), ' nm']);
end

% Visualize the first SWIR CO₂ band if available
if ~isempty(co2_swir_indices)
    co2_swir_band = bands(:, :, co2_swir_indices(1));
    figure;
    imagesc(co2_swir_band);
    colorbar;
    title(['SWIR CO₂ Band at ', num2str(wavelengths(co2_swir_indices(1))), ' nm']);
end


%% Step 5: Saving CO₂ Band Images

if exist('co2_nir_band', 'var')
    outputNirFile = 'co2_nir_band_image.mat';
    save(outputNirFile, 'co2_nir_band');
    disp(['NIR CO₂ band image saved to ', outputNirFile]);
end

if exist('co2_swir_band', 'var')
    outputSwirFile = 'co2_swir_band_image.mat';
    save(outputSwirFile, 'co2_swir_band');
    disp(['SWIR CO₂ band image saved to ', outputSwirFile]);
end

%% Step 6: Enhanced Visualization with Colormaps

figure;
imagesc(co2_nir_band);
colormap(jet);  % Apply 'jet' colormap
colorbar;
title('NIR CO₂ Band at 1572.381 nm');
xlabel('Pixel X');
ylabel('Pixel Y');

% Visualize SWIR CO₂ band with 'parula' colormap
figure;
imagesc(co2_swir_band);
colormap(parula);  
colorbar;
title('SWIR CO₂ Band at 2008.315 nm');
xlabel('Pixel X');
ylabel('Pixel Y');

%% Step 7: Estimate CO₂ Concentration (ppm)

% Example calibration parameters (you need real data to refine these)
scalingFactor = 0.1;  
offset = 350;         

% Convert NIR band to CO₂ concentration
co2_nir_ppm = co2_nir_band * scalingFactor + offset;

% Convert SWIR band to CO₂ concentration
co2_swir_ppm = co2_swir_band * scalingFactor + offset;

% Visualize CO₂ concentration (NIR)
figure;
imagesc(co2_nir_ppm);
colormap(turbo);
colorbar;
title('Estimated CO₂ Concentration (ppm) - NIR Band');
xlabel('Pixel X');
ylabel('Pixel Y');

% Visualize CO₂ concentration (SWIR)
figure;
imagesc(co2_swir_ppm);
colormap(turbo);
colorbar;
title('Estimated CO₂ Concentration (ppm) - SWIR Band');
xlabel('Pixel X');
ylabel('Pixel Y');


%% Step 8: Geospatial Visualization

% Define latitude and longitude limits
latlim = [-90, 90];
lonlim = [-90, 90];

% Generate latitude and longitude grids
[rows, cols] = size(co2_swir_ppm);
lat = linspace(latlim(1), latlim(2), rows);
lon = linspace(lonlim(1), lonlim(2), cols);
[Lat, Lon] = meshgrid(lon, lat);

% Replace NaNs with zeros
co2_swir_ppm(isnan(co2_swir_ppm)) = 0;

% Plot the georeferenced data
figure;
worldmap(latlim, lonlim);
geoshow(Lat, Lon, co2_swir_ppm, 'DisplayType', 'surface');
colormap(turbo);
colorbar;
caxis([300, 800]);  
title('Georeferenced CO₂ Concentration (ppm) - SWIR Band');

% Plot NIR CO₂ ppm on a world map
figure;
worldmap(latlim, lonlim);
geoshow(Lat, Lon, co2_nir_ppm, 'DisplayType', 'surface');
colormap(turbo);
colorbar;
title('Georeferenced CO₂ Concentration (ppm) - NIR Band');
