# MD_Silicon_mode_I
Computational framework for evaluating the mode-I critical stress intensity factor ($K_{IC}$) of crystalline silicon at the atomistic scale, including LEFM validation and loading boundary effect analysis.

### Overview: 
This repository contains the simulation models, data, and Python analysis scripts used to investigate the fracture mechanics of single-crystal silicon at the atomistic scale. The computational resources provided here focus on identifying the critical state for crack propagation initiation and subsequently calculating the critical stress intensity factor ($K_{IC}$).

### Key Contents & Features

1. Simulation Setup: LAMMPS input scripts and essential data files for establishing the diamond cubic lattice, embedding the initial crack, and executing the equilibration and uniaxial tensile loading simulations at 1 K. Note that the simulation is not conducted in a traditional triple periodic ensemble setup because in that case the boundary effect cannot be observed.
2. Critical-SIF Calculation: Python and Matplotlib scripts for extracting the near-tip stress fields from the virial stress data and performing the linear regression to compute $K_{IC}$ within the K-dominant linear elastic region.
3. LEFM Validity Analysis: Comparative analysis tools—including corresponding ABAQUS finite element model data—to validate the applicability of Linear Elastic Fracture Mechanics (LEFM) just before crack propagation. Note that the setup for the FEM simulation is not detailed here. For that, please refer to the following paper - https://doi.org/10.1115/1.4064545.
4. Boundary Proximity Effects: Codes to conduct a systematic parameter study evaluating how crack depth relative to the loading boundary influences the critical boundary stress and the evaluated $K_{IC}$.


### Data File Note: mode_I_done
All necessary input files for the MD simulation are included in this repository, except for the silicon.data file. Because this file exceeds GitHub's maximum file size limits, it is hosted externally on Google Drive.

To replicate the simulation:

1. Download silicon.data from [[Drive Link]](https://drive.google.com/drive/folders/1cuQQ_vNMlOXcb5fTfAz1ylQeJPjdhUiB?usp=drive_link).
2. Copy the downloaded file into the mode_I_done directory before running the simulation.

