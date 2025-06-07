library(tidyverse)
data("AirPassengers")
library(tseries)

# Plot the a10 data using ggseasonplot
ggseasonplot(AirPassengers) +
  ggtitle("Seasonal Plot of AirPassengers") +
  theme_minimal()

ggseasonplot(tb) +
  ggtitle("Seasonal Plot of TB Incidence") +
  theme_minimal()

# Plot the tb data using ggseasonplot with polar coordinates
ggseasonplot(tb, polar = TRUE) +
  ggtitle("Polar Seasonal Plot of TB Incidence") +
  theme_minimal()

# Subset the tb data starting from 2012
tb_2012 <- window(tb, start = c(2012, 1))

# Inspect the subsetted data
print(tb_2012)

# Plot the tb_2012 data using autoplot
autoplot(tb_2012) +
  ggtitle("Quarterly TB Incidence (From 2012)") +
  theme_minimal()

# Plot the tb_2012 data using ggsubseriesplot
ggsubseriesplot(tb_2012) +
  ggtitle("Subseries Plot of Quarterly TB Incidence (From 2012)") +
  theme_minimal()

# Plot the relationship between TB and its lagged values
gglagplot(tb) +
  ggtitle("Lag Plot of TB Data") +
  theme_minimal()

# Plot the autocorrelations of the TB data
ggAcf(tb) +
  ggtitle("Autocorrelation Function (ACF) of TB Data") +
  theme_minimal()

ggPacf(tb) +
  ggtitle("Partial Autocorrelation Function (ACF) of TB Data") +
  theme_minimal()
## White noice
set.seed(3)
b <- ts(rnorm(36))
autoplot(b)
## white noice ACF
ggAcf(b)
