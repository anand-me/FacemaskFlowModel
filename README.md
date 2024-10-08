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

The ETT dataset used in the paper can be downloaded in the repo [ETDataset](https://github.com/zhouhaoyi/ETDataset).
The required data files should be put into `data/ETT/` folder. A demo slice of the ETT data is illustrated in the following figure. Note that the input of each dataset is zero-mean normalized in this implementation.



The feature (nose) data and PCA data for figure 11 (or supplementry material figure) can be downloaded here.
- [Google Drive](https://drive.google.com/drive/folders/1WQvdLrIppWfo6OH1EYPmjKBLQWqMEdKp?usp=sharing)
