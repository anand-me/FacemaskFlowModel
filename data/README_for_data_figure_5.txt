data_for_figure_5a.mat -- 9 x6
data_for_figure_5b.mat -- 9 x6
data_for_figure_5c.mat -- 9 x6

This dataset corresponds to exhale flux penetrating through the mask fabric for different values of ck 100,500, and  1000(kg/m^2 × s) 

~~~~~~~~~~~~~~~~~~
To mimic or recreate the plot
  run --> plot_figures_5abc.m 
                             ==> plots the figure 5a, 5b and 5c as in manuscript
  run --> plot_figures_5def.m 
                             ==> plots the figure 5d, 5e and 5f as in manuscript
~~~~~~~~~~~~~~~~~~
same approach for case with 48 and 56 channels 
~~~~~~~~~~~~~~~~~~

~~~~~~~~~~~~~~~~~~~~~~~
5a-c: for outward protection model
~~~~~~~~~~~~~~~~~~~~~~~

~~~~~~~~~~~~~~~~~~~~~~~
column 1: alpha (-1.2:0.3:1.2)
~~~~~~~~~~~~~~~~~~~~~~~

cloumn 2: sensitivity analysis when cavity size is increased to + 7.5%
cloumn 3: sensitivity analysis when cavity size is base size
cloumn 4: sensitivity analysis when cavity size is reduced to + 7.5%
column 5: sensitivity analysis for placement of cavity regions --> if moved +5 mm from base position
column 6: sensitivity analysis for placement of cavity regions --> if moved -5 mm from base position


~~~~~~~~~~~~~~~~~~~~~~~
5d-f: for inward protection model  for two different values of head loss coefficient k_L = 0.2 and 0.5
~~~~~~~~~~~~~~~~~~~~~~~

data_for_figure_5d.mat -- 9 x11 
data_for_figure_5e.mat -- 9 x11
data_for_figure_5f.mat -- 9 x11

~~~~~~~~~~~~~~~~~~~~~~~
k_L = 0.2
~~~~~~~~~~~~~~~~~~~~~~~
cloumn 2: sensitivity analysis when cavity size is increased to + 7.5%
cloumn 3: sensitivity analysis when cavity size is base size
cloumn 4: sensitivity analysis when cavity size is reduced to + 7.5%
column 5: sensitivity analysis for placement of cavity regions --> if moved +5 mm from base position
column 6: sensitivity analysis for placement of cavity regions --> if moved -5 mm from base position

~~~~~~~~~~~~~~~~~~~~~~~
k_L = 0.5
~~~~~~~~~~~~~~~~~~~~~~~
cloumn 7: sensitivity analysis when cavity size is increased to + 7.5%
cloumn 8: sensitivity analysis when cavity size is base size
cloumn 9: sensitivity analysis when cavity size is reduced to + 7.5%
column 10: sensitivity analysis for placement of cavity regions --> if moved +5 mm from base position
column 11: sensitivity analysis for placement of cavity regions --> if moved -5 mm from base position


~~~~~~~~~~~~~~~~~~~~~~~~
The deployed face is visualized as .ply file and can be plotted using the .gh file
~~~~~~~~~~~~~~~~~~~~~~~~
The PCA faces are also provided as .fig file named as:
1_feature_nose_alpha_-1.2.fig
2_feature_nose_alpha_-0.6.fig
3_feature_nose_alpha_0.fig
4_feature_nose_alpha_0.6.fig
5_feature_nose_alpha_1.2.fig
~~~~~~~~~~~~~~~~~~~~~~~~

