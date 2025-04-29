# README: Data Files for "Identifying the effectiveness of face mask in a large population with a network-based fluid model"

This document provides detailed descriptions of the data files accompanying our manuscript. All data files have been converted to text format for accessibility.

## Contents

1. Figure 5 Data (data_for_figure_5a.txt through data_for_figure_5f.txt)
2. Figure 6 Data (data_for_figure_6.txt)
3. Figure 10 Data (data_for_jet_vel_*.txt files)
4. Figure 8 Data: Effect of Nose Clip on Mask Performance

## Format

All data files are provided in space-delimited text format. Each row represents a data point, with values separated by spaces.

---

## 1. Figure 5 Data: Mask Flux Penetration

### Exhale Flux Penetration (Figure 5a-c)

These datasets show the percentage of exhaled air penetrating through mask fabric at different air resistance values.

| File Name               | Description                        |
|-------------------------|------------------------------------|
| data_for_figure_5a.txt  | ck = 100 (kg/m² × s)              |
| data_for_figure_5b.txt  | ck = 500 (kg/m² × s)              |
| data_for_figure_5c.txt  | ck = 1000 (kg/m² × s)             |

#### Data Structure (9 rows × 6 columns)
- **Column 1**: Face shape coefficient Alpha (-1.2, -0.9, -0.6, -0.3, 0, 0.3, 0.6, 0.9, 1.2)
- **Column 2**: Percentage of through-mask flux when cavity size is increased by 7.5%
- **Column 3**: Percentage of through-mask flux at base cavity size
- **Column 4**: Percentage of through-mask flux when cavity size is reduced by 7.5%
- **Column 5**: Percentage of through-mask flux when cavity placement is moved +5 mm
- **Column 6**: Percentage of through-mask flux when cavity placement is moved -5 mm

### Inhale Flux Penetration (Figure 5d-f)

These datasets show the percentage of inhaled air penetrating through mask fabric at different air resistance values.

| File Name               | Description                        |
|-------------------------|------------------------------------|
| data_for_figure_5d.txt  | ck = 100 (kg/m² × s)              |
| data_for_figure_5e.txt  | ck = 500 (kg/m² × s)              |
| data_for_figure_5f.txt  | ck = 1000 (kg/m² × s)             |

#### Data Structure (9 rows × 11 columns)
- **Column 1**: Face shape coefficient Alpha (-1.2, -0.9, -0.6, -0.3, 0, 0.3, 0.6, 0.9, 1.2)

For head loss coefficient kL = 0.2:
- **Column 2**: Through-mask flux % with cavity size +7.5%
- **Column 3**: Through-mask flux % with base cavity size
- **Column 4**: Through-mask flux % with cavity size -7.5%
- **Column 5**: Through-mask flux % with cavity moved +5 mm
- **Column 6**: Through-mask flux % with cavity moved -5 mm

For head loss coefficient kL = 0.5:
- **Column 7**: Through-mask flux % with cavity size +7.5%
- **Column 8**: Through-mask flux % with base cavity size
- **Column 9**: Through-mask flux % with cavity size -7.5%
- **Column 10**: Through-mask flux % with cavity moved +5 mm
- **Column 11**: Through-mask flux % with cavity moved -5 mm

---

## 2. Figure 6 Data: Contribution to Through-Mask Flux

### Dataset: data_for_figure_6.txt

This dataset contains information on how much of the through-mask flux comes from the channel network versus the central cavity region.

#### Data Structure (9 rows × 13 columns)
- **Column 1**: Face shape coefficient Alpha (-1.2, -0.9, -0.6, -0.3, 0, 0.3, 0.6, 0.9, 1.2)

For Outward Protection:
- **Columns 2, 3**: Channel network and cavity contributions (ck = 100)
- **Columns 4, 5**: Channel network and cavity contributions (ck = 500)
- **Columns 6, 7**: Channel network and cavity contributions (ck = 1000)

For Inward Protection:
- **Columns 8, 9**: Channel network and cavity contributions (ck = 100)
- **Columns 10, 11**: Channel network and cavity contributions (ck = 500)
- **Columns 12, 13**: Channel network and cavity contributions (ck = 1000)

---

## 3. Jet Velocity Data (Figure 10)

These datasets show the jet velocity distribution along the mask periphery for different facial features.

| File Name                    | Description                                       |
|------------------------------|---------------------------------------------------|
| data_for_jet_vel_cheek.txt   | Jet velocity for cheek feature                    |
| data_for_jet_vel_chin.txt    | Jet velocity for chin feature                     |
| data_for_jet_vel_nose.txt    | Jet velocity for nose feature                     |
| data_for_jet_vel_zygo.txt    | Jet velocity for zygomatic arch feature           |

#### Data Structure (24 rows × 7 columns)
- **Column 1**: Channel number (i) from 1 to 24
- **Column 2**: Velocity (m/s) for α = -1.2, no nose clip (kL = 0)
- **Column 3**: Velocity (m/s) for α = -1.2, moderate nose clip (kL = 10)
- **Column 4**: Velocity (m/s) for α = -1.2, tight nose clip (kL = 1000)
- **Column 5**: Velocity (m/s) for α = +1.2, no nose clip (kL = 0)
- **Column 6**: Velocity (m/s) for α = +1.2, moderate nose clip (kL = 10)
- **Column 7**: Velocity (m/s) for α = +1.2, tight nose clip (kL = 1000)

---

### Dataset: Barchart.xlsx

This Excel file contains data showing the impact of nose clips with different sealing levels on mask flow distribution.

#### Data Structure
The spreadsheet is organized as follows:
- Data for α = +1.2: Contains information on through-mask flux (Qm) and peripheral leakage (Qg) contributions for various nose clip sealing levels (kL values)
- Data for α = -1.2: Contains similar data for the opposite shape coefficient

The data shows how different nose clip configurations redistribute airflow between the mask fabric and peripheral gaps for 9 different facial features.

Note: This data is provided in Excel format (.xlsx) for easier visualization of the complex relationships between variables.




## Software Requirements

These data files can be read by any text editor or data analysis software that can handle space-delimited text files. For analysis, we recommend using scientific computing environments such as MATLAB, Python (with NumPy/Pandas), or R.

## Notes on Data Generation

All data was generated using the network-based fluid model described in the manuscript. The facial geometries are synthetic representations created using the Basel Face Model (BFM) database and are not photographs or representations of real individuals.

## Contact

For questions regarding this data, please contact:
kshoele@eng.famu.fsu.edu
