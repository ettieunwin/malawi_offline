# This runs a sensitivity analysis for an odin model 
library(odin)
library(tidyverse)

# The file name of the model
model <- "malaria/basic.R"
# Compiles the model
mod_code <- odin::odin(model)
# Define times to look at
t = 1:5000

# Range of inputs
ms = seq(from = 1, to = 10, length.out = 1001)

# Function to run the model for each parameter set
f <- function(m) {
  mod <- mod_code$new(user = list(m = m))
  # Change value you want sensitivity over here
  output = mod$run(t)[, "I_h"]  
  return (output)
}

# Runs model for each of your input parameters
output = data.frame(sapply(ms, f))
names(output) = ms
output$t = t

# Changes output to long format
output_long = output %>%
  gather(key = parameter_value, value = value, -t) %>% 
  filter(t == max(t))
output_long$parameter_value = as.numeric(output_long$parameter_value)

# Makes plot
p <- ggplot(output_long) + 
  geom_line(aes(parameter_value, value))+
  theme_bw()
print(p)
