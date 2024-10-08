# Identifying the effectiveness of face mask  in a large population with a network-based fluid model 
![MATLAB R2023a](https://img.shields.io/badge/MATLAB-R2023a-green.svg?style=plastic)
![C++](https://img.shields.io/badge/C++-v11-blue.svg?style=plastic)
![Rhinoceros 5.0](https://img.shields.io/badge/Rhinoceros-7.0-green.svg?style=plastic) 
![Grasshopper v1.0](https://img.shields.io/badge/Grasshopper-v1.0-blue.svg?style=plastic)
![Python 3.6](https://img.shields.io/badge/python-3.6-green.svg?style=plastic)
![License CC BY-NC-SA](https://img.shields.io/badge/license-CC_BY--NC--SA--green.svg?style=plastic)

This repository is dedicated to providing readers with access to the data and code required to recreate the 
plots presented in our forthcoming paper, 
**"Identifying the Effectiveness of Face Masks in a Large Population with a Network-Based Fluid Model."**
 As the paper has not yet been published, a direct link is not available at this time.

<p align="center">
<img src=".\img\readme_fig.jpg" height = "200" alt="" align=center />
<br><br>
<b>Figure 1.</b> Summary of the three major steps in this research. Step 1: Face representation using PCA (Principal Component Analysis) and mask deployment. Step 2: Development of a flow network. Step 3: Application of an analytical flow model for leakage quantification. This approach enables the quantification of both peripheral ($Q{_g}$) and through-mask leakages ($Q{_m}$)
</p>

## Requirements

- MATLAB R2023a (or even older versions)
- Rhinoceros 5.0 == 5.0 (for deployment figures)
- Grasshopper == v1.0 (for deployment figures)
- python == 3.6
- pandas == 0.25.1

## Data

The detailed descriptions about the arguments are as following:

| Parameter name | Description of parameter |
| --- | --- |
| data_for_figure_5a.mat | 9 x6 to `informer`, `informerstack`, `informerlight(TBD)` |
| data_for_figure_5b.mat | 9 x6         | The dataset name                                             |
| data_for_figure_5c.mat | 9 x6    | The root path of the data file (defaults to `./data/ETT/`)    |
| data_path      | The data file name (defaults to `ETTh1.csv`)                  |
| features       | The forecasting task (defaults to `M`). This can be set to `M`,`S`,`MS` (M : multivariate predict multivariate, S : univariate predict univariate, MS : multivariate predict univariate) |



The feature (nose) data and PCA data for figure 11 (or supplementry material figure) can be downloaded here.
- [Google Drive](https://drive.google.com/drive/folders/1WQvdLrIppWfo6OH1EYPmjKBLQWqMEdKp?usp=sharing)
