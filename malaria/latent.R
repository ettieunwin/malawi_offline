# human equations
deriv(S_h) <- - lambda_h * S_h + sigma * I_h
deriv(I_h) <- lambda_h * S_h - sigma * I_h

# mosquito equations
deriv(S_v) <- e - lambda_v * S_v - mu * S_v
deriv(E_v) <- lambda_v * S_v - gamma * E_v - mu * E_v
deriv(I_v) <- gamma * E_v - mu * I_v

lambda_h = m * b_h * a * I_v  # human force of infection
lambda_v = b_v * a * I_h      # mosquito force of infection

# initial conditions
initial(S_h) <- 1 - I_init_h
initial(I_h) <- I_init_h

initial(S_v) <- 1 - I_init_v
initial(E_v) <- 0
initial(I_v) <- I_init_v

#outputs
output(R0) <- (m * a^2 * b_h * b_v * gamma) / ((gamma + mu) * sigma * mu)
output(m_threshold) <- ((gamma + mu) * sigma * mu) / (a^2 * b_h * b_v * gamma)
output(EIR) <- m * a * I_v * 365

# parameter values
I_init_h <- 0.001             # proportion of infectious humans at start of epidemic
I_init_v <- 0                 # proportion of infectious mosquitoes at start of epidemic

mu <- -log(p)                 # mosquito death rate
e <- mu                       # mosquito birth rate
p = user(0.9)                 # probability a mosquito survives one day

sigma <- user(0.02)           # human recovery rate
gamma <- 0.0833               # progression (1 / duration of latent period 12 days)

m = user(10)                  # density of female mosquitoes per person
a = user(0.3)                 # biting rate per female mosquito
b_h = 0.2                     # probability of infection in susceptible human given bite from infectious mosquito 
b_v = 0.05                    # probability of infection in susceptible mosquito given bite on an infectious human


