# This runs a sensitivity analysis for an odin model 
library(odin)
library(tidyverse)

# The file name of the model
model <- "r0/exponential.R"
# Compiles the model
mod_code <- odin::odin(model)
# Define times to look at
t = 1:20

# Function to run the model for each parameter set
f <- function(N_init) {
  mod <- mod_code$new(user = list(N_init = N_init))
  # Change value you want sensitivity over here
  output = mod$run(t)[, "N"]  
  return (output)
}

# Range of inputs
N_inits = 10:20

# Runs model for each of your input parameters
output = data.frame(sapply(N_inits, f))
names(output) = N_inits
output$t = t

# Changes output to long format
output_long = gather(output, key = parameter_value, value = value, -t)

# Makes plot
p <- ggplot(output_long) + 
  geom_line(aes(t, value, colour = parameter_value))+
  theme_bw()
p
