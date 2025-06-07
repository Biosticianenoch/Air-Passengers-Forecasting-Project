## Air Passengers Prediction
# Install and load necessary packages
library(forecast)
library(tseries)
library(ggplot2)

## Load the AirPassengers dataset
data("AirPassengers")
?AirPassengers

## Data Exploration and Preprocessing
str(AirPassengers)
attributes(AirPassengers)

## Plot the time series data
plot(AirPassengers, 
     main = "Monthly Airline Passengers (1949-1960)",
     xlab = "Year", ylab = "Passengers")
abline(reg = lm(AirPassengers ~ time(AirPassengers)))

## General trend
plot(aggregate(AirPassengers, FUN = mean))
# There is a general increase in the number of passengers from 1949-1960
## Decomposition of the Time series
decomposition <- decompose(AirPassengers)
plot(decomposition)

## Check for Stationarity
# Plot the ACF plot
acf(AirPassengers)

# Plot the PACF plot
pacf(AirPassengers)

## Perform ADF test
adf.test(AirPassengers, k = 15)
# P value is more than 0.05 indicating that the data is not stationary
## Perform KPSS test
kpss.test(AirPassengers)
# P value is less than 0.05 indicating that the data is not stationary
# We will not do differencing and log transformation since it will be 
# automatically be handled during model building using auto.arima.
## Model building
arima_model <- auto.arima(AirPassengers)
summary(arima_model)

## Perform residual diagnostic analysis
acf(ts(arima_model$residuals))
pacf(ts(arima_model$residuals))
# From the above ACF and PACF plots we can infer that all the vertical lines at
#each lags falls inside the horizontal boundary, which indicates that the time
#series is stationary after applying seasonal differencing using the auto.arima model. 

## Plot a histogram of residuals
residuals <- residuals(arima_model)
hist(residuals, main="Histogram of Residuals", 
     xlab="Residuals", col="skyblue", border="black", 
     breaks=20, probability=TRUE)
# Add a normal density curve
lines(density(residuals), col="red", lwd=2)
# The histogram indicates that residuals are normally distributed

## Forecasting
forecast_future <- forecast(arima_model, level = c(95), h = 96)
forecast_future
## The model predicts a general increase in the number of passengers as the number 
# years increase

## Visualize your Predictions
plot(forecast_future)
forecast_df <- data.frame(
  Date = time(forecast_future$mean),
  Forecast = as.numeric(forecast_future$mean),
  Lower = as.numeric(forecast_future$lower[, 1]),
  Upper = as.numeric(forecast_future$upper[, 1]))

# Plot the forecast using ggplot2
ggplot(forecast_df, aes(x = Date, y = Forecast)) +
  geom_line(color = "red") +
  theme_classic()+
  geom_ribbon(aes(ymin = Lower, ymax = Upper), alpha = 0.2) +
  labs(title = "Air Passengers Forecast", x = "Year", y = "TB Incidence")

## Goodness of fit of the model
#Ljung-Box test
Box.test(forecast_future$residuals, type = "Ljung-Box")
## Our model is best in making predictions indicated by the p-value greater than 0.05