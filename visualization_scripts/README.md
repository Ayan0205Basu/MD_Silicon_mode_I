# Visualization Scripts (`Visualization_scripts`)

### Overview
This directory contains the plotting and graphing scripts used to visualize the fracture mechanics data extracted from the molecular statics (MS) and finite element (FE) simulations. 

This folder houses Jupyter Notebooks (`.ipynb`) and normalized datasets (`.xlsx`) utilized to generate the final comparative plots.

### Key Notebooks and Generated Graphs

Running the provided `.ipynb` files will generate the following specific plots:

* **`mesh convegence study.ipynb`:** 
  Generates a graph plotting normalized stress ($\sigma_{22}/\sigma_{22 (boundary)}$) against normalized length ($x/W$). It compares the Molecular Statics (MS) analysis with three Finite Element (FE) meshes of varying densities (267, 2799, and 23307 elements) to validate convergence.

* **`sif_boundary_stress combo.ipynb` & `combined_sif_all.ipynb`:** 
  Generates a dual-axis graph illustrating the boundary proximity effect. 
  * The primary y-axis plots the evaluated $K_{IC}$ (MPa $\sqrt{\mathrm{m}}$) against the $h$ values of crack position.
  * The secondary y-axis plots the critical boundary stress ($\sigma_{22 (boundary)}$ in GPa) before crack propagation.
  * The plot includes specific annotations highlighting the $R^2$ ($\%$) goodness-of-fit values corresponding to each $K_I$ measurement.

* **`50-60-75-90_stress field comparison.ipynb`:** 
  Generates a stress field comparison plot tracking normalized stress ($\sigma_{yy}/\sigma_{yy(boundary)}$) ahead of the crack tip[cite: 3]. It overlays the stress profiles for various crack depth configurations, ranging from the mid-plane ($h/2$) up to positions nearing the boundary (e.g., $h/10$, $h/20$).
![Normalized 22-stress component ($\sigma_{22}$) distribution ahead of the crack tip for varying crack depths](stress_field_12_cases.pdf)
* **`edge_with_fem.ipynb`:** 
  Generates a plot for the edge crack configuration analyzing normalized stress ($\sigma_{yy}/\sigma_{yy(boundary)}$) against normalized length ($r/W$)[cite: 4]. It compares the virial stress analysis with 604, 5492, and 45588 element FE analyses[cite: 4]. This script utilizes `mpl_toolkits.axes_grid1.inset_locator` to create a zoomed-in section, explicitly annotating the 1st through 11th atomic sites ahead of the crack tip.

### Requirements
Ensure the corresponding `.xlsx` data files (e.g., `nd_0.50.xlsx`, `nd_edge_604.xlsx`, `fem_50.xlsx`) are in the same directory prior to execution. The scripts depend on standard Python data science libraries: `matplotlib`, `pandas`, and `numpy`.
