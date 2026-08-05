# SIF Calculation Scripts (`SIF_calculation_ipynb_scripts`)

### Overview
This directory contains the Jupyter Notebooks (`.ipynb`) and the corresponding Excel stress data files (`.xlsx`) used to systematically calculate the Stress Intensity Factor (SIF) from the molecular dynamics simulation outputs. 

The scripts in this folder correspond to the various test cases for the boundary effect analysis (ranging from mid-plane bulk cracks like `50_mid` up to `95_mid`, including edge crack formulations).

### Directory Contents

This folder includes:
* **Jupyter Notebooks (`.ipynb`):** Individual analysis notebooks for each test case (e.g., `sif_50_mid.ipynb`, `sif_95_mid.ipynb`, `new_sif_edge_crack.ipynb`). 
* **Stress Data Files (`.xlsx`):** The extracted atomistic stress data files required by the notebooks (e.g., `stress_data_50.xlsx`, `edge_stress_data.xlsx`, `virial_stress_data_middle_50.xlsx`).

### Calculation Workflow

Each Jupyter Notebook follows a standardized analytical workflow to process the atomistic data and compute the critical stress intensity factor:

1. **Stress Extraction:** Reads the virial stress data and calculates the normal stress ($\sigma_{yy}$) ahead of the crack tip at the molecular level.
2. **Stress Normalization:** Normalizes the stress distribution ahead of the crack tip for comparative analysis across different loading boundaries and geometries.
3. **LEFM Regression Analysis:** Computes the SIF by mapping the atomistic stress data to the theoretical Linear Elastic Fracture Mechanics (LEFM) stress field relation for a mode-I crack:
   
   $$\sigma_{yy} = \frac{K_I}{\sqrt{2 \pi r}}$$

   *(where $\sigma_{yy}$ is the normal stress ahead of the crack tip, $K_I$ is the mode-I stress intensity factor, and $r$ is the distance from the crack tip).*

4. **Linear Fitting:** The regression fit to extract $K_I$ is specifically performed using the data from the **2nd to the 11th atom** ahead of the crack tip, ensuring the calculation falls within the valid $K$-dominant zone.
5. **Goodness of Fit:** Evaluates and plots the $R^2$ (goodness of fit) for the regression to validate the LEFM assumption at the specified atomic distances.
