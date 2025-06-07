
# ✈️📈 Air Passengers Forecasting Model  
**Time Series Forecasting with ARIMA in R**

[![R](https://img.shields.io/badge/Built%20With-R-1f425f.svg?logo=r)](https://www.r-project.org/)  
📅 **Date**: *January 25, 2025*  👨‍💻 **Author**: *Enock Bereka*

---

## 🎯 Project Overview

> A powerful time series forecasting model built using **ARIMA** to predict monthly airline passenger traffic based on historical trends from **1949–1960**. The model uses statistical techniques, residual diagnostics, and visualizations to provide actionable insights.

---

## 🚀 Objectives

- 📊 **Explore** and understand the trend and seasonality of airline passenger data.
- 🔍 **Check** for stationarity using statistical tests (ADF & KPSS).
- 🧠 **Build** an automated ARIMA model using `auto.arima`.
- 📈 **Forecast** future air passenger volumes over the next 96 months.
- ✅ **Evaluate** model fit using residual diagnostics and Ljung-Box test.

---

## 🛠️ Tools & Libraries

```r
library(forecast)
library(tseries)
library(ggplot2)
```

> All computations were performed in **R** with visualizations powered by **ggplot2**.

---

## 📊 Methodology Summary

### 🧭 1. Data Exploration & Visualization
- Dataset: `AirPassengers` (monthly airline passenger totals from 1949 to 1960).
- Identified a **clear upward trend** and **strong seasonal component**.

### 🧩 2. Time Series Decomposition
- Confirmed components:
  - **Trend**: Growth over time
  - **Seasonal**: Repeating yearly cycles
  - **Residual**: Noise

### 🧪 3. Stationarity Tests
- **ADF Test**: p = 0.59 → ❌ *Non-stationary*
- **KPSS Test**: p = 0.01 → ❌ *Non-stationary*

🎯 Model handles differencing internally using `auto.arima`.

### 🔧 4. Model Building (ARIMA)
```r
auto.arima(AirPassengers)
# ARIMA(2,1,1)(0,1,0)[12]
```

✔️ Good fit with low AIC and normally distributed residuals.

### 🧮 5. Forecasting (Next 8 Years)
- Forecast horizon: **96 months**
- Strong growth trend predicted.
- Confidence intervals calculated at **95%**.

### 📈 6. Forecast Visualization
```r
ggplot(forecast_df, aes(x = Date, y = Forecast)) +
  geom_line(color = "red") +
  geom_ribbon(aes(ymin = Lower, ymax = Upper), alpha = 0.2) +
  theme_classic() +
  labs(title = "Air Passengers Forecast", x = "Year", y = "Passenger Count")
```

---

## ✅ Model Evaluation

### 🔬 Residual Diagnostics
- ACF/PACF of residuals → Within bounds ✅
- Histogram → Normal distribution ✅

### 📉 Ljung-Box Test
```r
p-value = 0.9879
```
✅ No autocorrelation in residuals → *Good model fit*

---

## 📌 Key Insights

- Airline passenger traffic shows **seasonal growth**, peaking mid-year.
- The ARIMA model captured trend and seasonality **effectively**.
- Predictions suggest **continued increase** in air travel demand.

---

## 💡 Recommendations

| Area | Suggestion |
|------|------------|
| 📈 Forecasting | Extend dataset with recent years for up-to-date predictions |
| 📊 Dashboard | Develop an interactive dashboard using **Shiny**, **Power BI**, or **Tableau** |
| 🌍 Variables | Incorporate exogenous variables (economic data, fuel prices, travel restrictions) |
| 🧠 Models | Compare with **Prophet**, **SARIMA**, or **LSTM** models |

---

## 🧠 What I Learned

> This project deepened my understanding of:
> - Time Series decomposition  
> - Stationarity testing and differencing  
> - Automated ARIMA modeling  
> - Forecast visualization and diagnostics

---

## 📬 Let's Connect

**Enock Bereka**  
📍 Kakamega, Kenya  
📧 [My Email](enochwafulah254@gmail.com)  
🔗 [LinkedIn Profile](https://linkedin.com/in/enockbereka)

---

> 🧭 *“Time series analysis turns the past into insights and the future into foresight.”*
