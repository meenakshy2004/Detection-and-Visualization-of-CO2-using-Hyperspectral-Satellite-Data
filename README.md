# Detection-and-Visualization-of-CO2-using-Hyperspectral-Satellite-Data
This project was developed for submission to the MATLAB Challenge 2024 under the title “Detection and Visualization of CO₂ Concentration Using Hyperspectral Satellite Data.”

## Project Context
This project was developed as part of the MATLAB Challenge 2024 and focuses on detecting and visualizing atmospheric carbon dioxide (CO₂) concentrations using hyperspectral satellite imagery.

## Project Overview 
Monitoring atmospheric CO₂ is critical for understanding climate change and supporting environmental decision-making. Hyperspectral remote sensing enables the identification and quantification of specific gases by capturing data across a large number of narrow spectral bands.
In this project, hyperspectral satellite data is processed in MATLAB to detect regions with elevated CO₂ concentrations. Spectral absorption characteristics of CO₂ are analyzed, and the results are visualized as spatial distribution maps, highlighting potential emission hotspots.
Methodology

### 1. Data Collection
Sample hyperspectral datasets provided by MathWorks were used to validate the workflow. The implementation is compatible with real-world hyperspectral data from sensors such as AVIRIS, Landsat, Sentinel-2, or similar instruments.

### 2. Data Preparation
•	Hyperspectral data was loaded and handled using MATLAB’s Hyperspectral Imaging Toolbox
•	Radiance data was converted to reflectance for physical interpretability
•	Noise reduction techniques, including Gaussian smoothing, were applied to enhance spectral quality
•	Cleaned reflectance bands were prepared for further analysis

### 3. CO2 Detection Algorithm

A Cluster-Tuned Matched Filter (CTMF)–based approach was implemented to estimate CO₂ concentrations.
Key steps include:
   ##### a)	K- Means Clustering
              •	Hyperspectral pixels were grouped using k-means clustering
              •	Each cluster represents regions with similar spectral characteristics (e.g., vegetation, water bodies, atmosphere)
   ##### b) Matched Filter Design
              •	Cluster-specific matched filters were designed to emphasize CO₂ absorption features
              •	The filter enhances CO₂ spectral signatures while suppressing background signals
  ##### c) Filter Application
              •	The matched filters were applied to the clustered hyperspectral data
              •	Output maps highlight regions with anomalously high CO₂ concentrations
### 4. Data Analysis

       •	CO₂ levels were estimated using spectral band ratios and absorption depth analysis
       •	Relative concentration values were derived from reflectance variations across CO₂ absorption bands
### 5. Visualization
       •	CO₂ concentration results were visualized using MATLAB’s Mapping Toolbox
       •	Spatial distribution maps were generated to identify CO₂ hotspots over the study area

## Results
The final outputs include:
   •	Denoised hyperspectral reflectance images
   •	Clustered representations of the study area
   •	Spatial maps showing CO₂ concentration distribution
   •	Clear identification of regions with elevated CO₂ levels
These results demonstrate the effectiveness of hyperspectral analysis for atmospheric gas monitoring.

## Tools & Technologies
   •	MATLAB
   •	Hyperspectral Imaging Toolbox
   •	Mapping Toolbox
   •	K-Means Clustering
   •	Cluster-Tuned Matched Filtering (CTMF)

## Applications
   •	Environmental monitoring
   •	Climate change analysis
   •	Atmospheric studies
   •	Remote sensing–based gas detection

## Conclusion
This project demonstrates how hyperspectral satellite imagery, combined with advanced spectral analysis techniques in MATLAB, can be used to detect and visualize atmospheric CO₂ concentrations. The approach provides a scalable framework that can be extended to other atmospheric gases and environmental monitoring applications.

