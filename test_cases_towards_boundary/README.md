
## Crack Depth and Loading Boundary Analysis (`test_cases_towards_boundary/`)

This directory contains the complete suite of Molecular Statics (MS) simulation files used to investigate the effect of crack depth relative to the loading boundary on the critical stress intensity factor ($K_{IC}$) for crystalline silicon. This corresponds to the analysis detailed in the paper:  https://doi.org/10.1115/1.4064545 .

### Directory Structure
To systematically study the boundary effect, the simulations are divided into individual subfolders based on the crack's position relative to the specimen height ($h$):
* **`test_50` – `test_95`, `test_525`, `test_575`**: These folders contain models with varying crack depths, moving progressively from the bulk mid-plane ($h/2$) towards the loading boundary. 
* **`test_embedded` & `test_edge`**: Contains the benchmark embedded bulk crack and the comparative edge crack configurations.

### Folder Contents
Each subfolder is completely self-contained and includes the following files required to run and analyze the simulation:
* **`test.in`**: The main LAMMPS input script defining the geometry, boundary conditions, and loading.
* **`Si.sw`**: The Stillinger-Weber (SW) interatomic potential parameter file for Silicon.
* **`submit`**: The shell script (`.sh`) used to submit the simulation job to the HPC cluster.
* **`virial_stress_data`**: The output text file tracking the timestep, specimen length along the Y-axis, and the sum of virial stresses.
* **`log`**: The standard LAMMPS log file generated during execution.
* *(Note: Custom dump files for the upper and lower crack sections will be generated in this folder upon running the script).*

### Simulation Parameters
The LAMMPS input scripts (`test`) across these folders share the following core mechanics and parameters:
* **Material & Lattice:** Crystalline Silicon, Diamond lattice (Lattice constant = 5.43 Å).
* **Interatomic Potential:** Stillinger-Weber (`pair_style sw`).
* **Boundary Conditions:** Shrink-wrapped in the X and Y directions, periodic in the Z direction (`s s p`) to approximate plane strain.
* **Ensemble:** NVE (Microcanonical ensemble).
* **Timestep & Duration:** 0.01 ps timestep run for 120,000 steps.
* **Loading:** Uniaxial tension applied by displacing the upper boundary at 0.015 Å/ps and the lower boundary at -0.015 Å/ps.
* **Crack Modeling:** The thin slit crack is modeled not by deleting atoms, but by turning off the atomic interactions between the designated upper and lower crack faces using the `neigh_modify exclude type 2 3` command.

