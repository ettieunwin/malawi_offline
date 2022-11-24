# Material for running Malawi short course material offline.

In this repo there is code to recreate the analysis from the MLW/ICL hosted introduction to infectious disease modelling course with a focus on malaria.

There are three R documented scripts that can be adapted along with odin model files.

1) ```compile_plot.R```:  Compiles and plots all outputs from an odin model.
2) ```sensitivity.R```: Runs a simple sensitivity analysis and plots one specified output variable over time for multiple specified input variables.
3) ```sensitivity_malaria.R```: Runs a more complicated sensitivty analysis where the output at time t_max is plotted for one specified out for multiple input variables.
