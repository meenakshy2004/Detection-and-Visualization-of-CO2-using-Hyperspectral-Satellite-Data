# Detection-and-Visualization-of-CO2-using-Hyperspectral-Satellite-Data
This project was developed for submission to the MATLAB Challenge 2024 under the title “Detection and Visualization of CO₂ Concentration Using Hyperspectral Satellite Data.”

## Project Context
This project was developed as part of the MATLAB Challenge 2024 and focuses on detecting and visualizing atmospheric carbon dioxide (CO₂) concentrations using hyperspectral satellite imagery.

## Project Overview 
Monitoring atmospheric CO₂ is critical for understanding climate change and supporting environmental decision-making. Hyperspectral remote sensing enables the identification and quantification of specific gases by capturing data across a large number of narrow spectral bands.
In this project, hyperspectral satellite data is processed in MATLAB to detect regions with elevated CO₂ concentrations. Spectral absorption characteristics of CO₂ are analyzed, and the results are visualized as spatial distribution maps, highlighting potential emission hotspots.

## Methodology
### 1. Data Collection
Sample hyperspectral datasets provided by MathWorks were used to validate the workflow. The implementation is compatible with real-world hyperspectral data from sensors such as AVIRIS, Landsat, Sentinel-2, or similar instruments.

### 2. Data Preparation
     1.Hyperspectral data was loaded and handled using MATLAB’s Hyperspectral Imaging Toolbox
     2.Radiance data was converted to reflectance for physical interpretability
     3.Noise reduction techniques, including Gaussian smoothing, were applied to enhance spectral quality
     4.Cleaned reflectance bands were prepared for further analysis

### 3. CO2 Detection Algorithm
   A Cluster-Tuned Matched Filter (CTMF)–based approach was implemented to estimate CO₂ concentrations.
   Key steps include:
##### 1. K- Means Clustering
1. Hyperspectral pixels were grouped using k-means clustering
2. Each cluster represents regions with similar spectral characteristics (e.g., vegetation, water bodies, atmosphere)
##### 2. Matched Filter Design
1. Cluster-specific matched filters were designed to emphasize CO₂ absorption features
2. The filter enhances CO₂ spectral signatures while suppressing background signals
##### 3. Filter Application
              1. The matched filters were applied to the clustered hyperspectral data
              2. Output maps highlight regions with anomalously high CO₂ concentrations
              
### 4. Data Analysis
       1. CO₂ levels were estimated using spectral band ratios and absorption depth analysis
       2. Relative concentration values were derived from reflectance variations across CO₂ absorption bands
       
### 5. Visualization
       1. CO₂ concentration results were visualized using MATLAB’s Mapping Toolbox
       2. Spatial distribution maps were generated to identify CO₂ hotspots over the study area

## Results
The final outputs include:
   1. Denoised hyperspectral reflectance images
   2. Clustered representations of the study area
   3. Spatial maps showing CO₂ concentration distribution
   4. Clear identification of regions with elevated CO₂ levels
These results demonstrate the effectiveness of hyperspectral analysis for atmospheric gas monitoring.

## Tools & Technologies
1.	MATLAB
2.	Hyperspectral Imaging Toolbox
3.	Mapping Toolbox
4.	K-Means Clustering
5.	Cluster-Tuned Matched Filtering (CTMF)

## Applications
1. Environmental monitoring
2. Climate change analysis
3. Atmospheric studies
4. Remote sensing–based gas detection

## Conclusion
This project demonstrates how hyperspectral satellite imagery, combined with advanced spectral analysis techniques in MATLAB, can be used to detect and visualize atmospheric CO₂ concentrations. The approach provides a scalable framework that can be extended to other atmospheric gases and environmental monitoring applications.

