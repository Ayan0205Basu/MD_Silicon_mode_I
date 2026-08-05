# MD_Silicon_mode_I
Computational framework for evaluating the mode-I critical stress intensity factor ($K_{IC}$) of crystalline silicon at the atomistic scale, including LEFM validation and loading boundary effect analysis.

### Overview
This repository contains the simulation models, data, and Python analysis scripts used to investigate the fracture mechanics of single-crystal silicon at the atomistic scale. The computational resources provided here focus on identifying the critical state for crack propagation initiation and subsequently calculating the critical stress intensity factor ($K_{IC}$).

### Key Contents & Features

1. **Simulation Setup:** LAMMPS input scripts and essential data files for establishing the diamond cubic lattice, embedding the initial crack, and executing the equilibration and uniaxial tensile loading simulations at 1 K. Note that the simulation is not conducted in a traditional triple periodic ensemble setup because in that case the boundary effect cannot be observed.
2. **Critical-SIF Calculation:** Python and Matplotlib scripts for extracting the near-tip stress fields from the virial stress data and performing the linear regression to compute $K_{IC}$ within the K-dominant linear elastic region.
3. **LEFM Validity Analysis:** Comparative analysis tools—including corresponding ABAQUS finite element model data—to validate the applicability of Linear Elastic Fracture Mechanics (LEFM) just before crack propagation. Note that the setup for the FEM simulation is not detailed here. For that, please refer to the following paper: https://doi.org/10.1115/1.4064545.
4. **Boundary Proximity Effects:** Codes to conduct a systematic parameter study evaluating how crack depth relative to the loading boundary influences the critical boundary stress and the evaluated $K_{IC}$.
5. **SIF Calculation Scripts (`SIF_calculation_ipynb_scripts/`):** A dedicated directory containing Jupyter Notebooks and corresponding dataset files used to perform regression analysis and extract the critical stress intensity factor using atomistic stress data ahead of the crack tip.
6. **Data Visualization (`Visualization_scripts/`):** A suite of Jupyter Notebooks dedicated to generating publication-quality comparative plots of the stress fields, mesh convergence, and the relationship between $K_{IC}$ and boundary stress.

---

### Data File Note: `mode_I_done`
All necessary input files for the MD simulation are included in this repository, except for the `silicon.data` file. Because this file exceeds GitHub's maximum file size limits, it is hosted externally on Google Drive.

**To replicate the simulation:**
1. Download `silicon.data` from [[Drive Link]](https://drive.google.com/drive/folders/1cuQQ_vNMlOXcb5fTfAz1ylQeJPjdhUiB?usp=drive_link).
2. Copy the downloaded file into the `mode_I_done` directory before running the simulation.

---

### Crack Depth and Loading Boundary Analysis (`test_cases_towards_boundary/`)

This directory contains the complete suite of Molecular Statics (MS) simulation files used to investigate the effect of crack depth relative to the loading boundary on the critical stress intensity factor ($K_{IC}$) for crystalline silicon. This corresponds to the analysis detailed in **Section 3.3** of the thesis.

#### Directory Structure
To systematically study the boundary effect, the simulations are divided into individual subfolders based on the crack's position relative to the specimen height ($h$):
* **`test_50` – `test_95`, `test_525`, `test_575`**: These folders contain models with varying crack depths, moving progressively from the bulk mid-plane ($h/2$) towards the loading boundary. 
* **`test_embedded` & `test_edge`**: Contains the benchmark embedded bulk crack and the comparative edge crack configurations.

#### Folder Contents
Each subfolder is completely self-contained and includes the following files required to run and analyze the simulation:
* **`test`**: The main LAMMPS input script defining the geometry, boundary conditions, and loading.
* **`Si`**: The Stillinger-Weber (SW) interatomic potential parameter file for Silicon.
* **`submit`**: The shell script (`.sh`) used to submit the simulation job to the HPC cluster.
* **`virial_stress_data`**: The output text file tracking the timestep, specimen length along the Y-axis, and the sum of virial stresses.
* **`log`**: The standard LAMMPS log file generated during execution.
* *(Note: Custom dump files for the upper and lower crack sections will be generated in this folder upon running the script).*

#### Simulation Parameters
The LAMMPS input scripts (`test`) across these folders share the following core mechanics and parameters:
* **Material & Lattice:** Crystalline Silicon, Diamond lattice (Lattice constant = 5.43 Å).
* **Interatomic Potential:** Stillinger-Weber (`pair_style sw`).
* **Boundary Conditions:** Shrink-wrapped in the X and Y directions, periodic in the Z direction (`s s p`) to approximate plane strain.
* **Ensemble:** NVE (Microcanonical ensemble).
* **Timestep & Duration:** 0.01 ps timestep run for 120,000 steps.
* **Loading:** Uniaxial tension applied by displacing the upper boundary at 0.015 Å/ps and the lower boundary at -0.015 Å/ps.
* **Crack Modeling:** The thin slit crack is modeled not by deleting atoms, but by turning off the atomic interactions between the designated upper and lower crack faces using the `neigh_modify exclude type 2 3` command.
