![image](https://github.com/user-attachments/assets/c20dbcf5-0d09-4e29-bbf6-7c32c9438209)




# VWAP (Volume Weighted Average Price) Indicator for ProRealTime

## Overview
This repository provides a custom **VWAP (Volume Weighted Average Price)** indicator designed for use in **ProRealTime**. The indicator includes standard deviation bands (up to 3 levels) to help identify support and resistance levels around the VWAP, which can be particularly useful for day trading and intraday strategies.

This script is an intraday version of the VWAP and calculates the VWAP based on the volume and typical price, with additional upper and lower standard deviation bands.

## Table of Contents
- [Overview](#overview)
- [Formula](#formula)
- [How to Use in ProRealTime](#how-to-use-in-prorealtime)
- [Standard Deviation Bands](#standard-deviation-bands)
- [Customization](#customization)
- [Example Use Case](#example-use-case)
- [License](#license)

## Formula

The VWAP is calculated as follows:

1. **VWAP Calculation**:
   The VWAP is calculated by taking the summation of the product of volume and typical price, divided by the summation of volume.

   ```prorealcode
   VWAP = SUMMATION[d](volume * typicalprice) / SUMMATION[d](volume)
   ```

   Where `d` is the number of periods since the start of the trading day.

2. **Standard Deviation**:
   The script calculates the standard deviation of the typical price from the VWAP over the intraday period:

   ```prorealcode
   sd = std[d](abs(typicalprice - VWAP))
   ```

3. **Standard Deviation Bands**:
   Three sets of standard deviation bands are drawn around the VWAP, each representing 1, 2, and 3 standard deviations above and below the VWAP:

   ```prorealcode
   SDup1 = VWAP + sd
   SDlw1 = VWAP - sd
   SDup2 = VWAP + 2 * sd
   SDlw2 = VWAP - 2 * sd
   SDup3 = VWAP + 3 * sd
   SDlw3 = VWAP - 3 * sd
   ```

## How to Use in ProRealTime

### Step 1: Install the VWAP Indicator
1. Open **ProRealTime**.
2. Navigate to the **Indicators** section.
3. Select **Create Indicator** or **New Indicator**.
4. Copy and paste the following code into the code editor:

   ```prorealcode
   // VWAP intraday with Standard Deviations
   if day<>day[1] then
       d=0
   else
       d=d+1
   endif
   
   if volume > 0 then
       VWAP = SUMMATION[d](volume * typicalprice) / SUMMATION[d](volume)
   endif
   
   sd = std[d](abs(typicalprice - VWAP))
   
   SDup1 = VWAP + sd
   SDlw1 = VWAP - sd
   SDup2 = VWAP + sd * 2
   SDlw2 = VWAP - sd * 2
   SDup3 = VWAP + sd * 3
   SDlw3 = VWAP - sd * 3
   
   if VWAP > VWAP[1] then
       color = 1
   else
       color = -1
   endif
   
   RETURN VWAP coloured by color STYLE(LINE,2) as "VWAP", SDup1 coloured(102,102,102) STYLE(DOTTEDLINE,1) as "upper 1 STD", SDlw1 coloured(102,102,102) STYLE(DOTTEDLINE,1) as "lower 1 STD", SDup2 coloured(102,102,102) STYLE(DOTTEDLINE,1) as "upper 2 STD", SDlw2 coloured(102,102,102) STYLE(DOTTEDLINE,1) as "lower 2 STD", SDup3 coloured(102,102,102) STYLE(DOTTEDLINE,1) as "upper 3 STD", SDlw3 coloured(102,102,102) STYLE(DOTTEDLINE,1) as "lower 3 STD"
   ```

### Step 2: Apply the Indicator to Your Chart
- Once you have pasted the code, apply the indicator to any intraday chart in ProRealTime.
- The VWAP line will be drawn with color changes indicating its direction (up or down), along with three levels of upper and lower standard deviation bands.

## Standard Deviation Bands

The indicator provides three sets of **standard deviation bands** around the VWAP:
- **Upper 1 STD** and **Lower 1 STD** represent 1 standard deviation above and below the VWAP.
- **Upper 2 STD** and **Lower 2 STD** represent 2 standard deviations above and below the VWAP.
- **Upper 3 STD** and **Lower 3 STD** represent 3 standard deviations above and below the VWAP.

These bands help traders visualize price extremes relative to the VWAP, making them useful for identifying overbought and oversold conditions.

## Customization

You can adjust the following elements:
1. **Standard Deviation Multiples**: By default, the script uses standard deviation multiples of 1, 2, and 3. You can change these values to fit your personal strategy.
2. **Colors and Styles**: The code colors the VWAP and standard deviation lines for clarity. You can modify these to match your personal preferences or chart theme.

## Example Use Case

This VWAP indicator is particularly useful for **intraday traders**:
- **Mean Reversion**: Use the 1st and 2nd standard deviation bands as potential support and resistance levels, where price may reverse back toward the VWAP.
- **Trend Continuation**: If price consistently holds above or below the 1st or 2nd standard deviation, this could indicate a strong trend, offering trade entry or exit signals.
- **Volume Analysis**: VWAP is a key tool for analyzing how price moves relative to volume. If the price moves above or below VWAP with significant volume, it could signal a potential shift in market sentiment.

## License

This project is licensed under the MIT License. See the `LICENSE` file for more details.

---

This guide should help you configure and use the VWAP with standard deviation bands in **ProRealTime**. Modify the parameters and settings as necessary to match your specific trading strategy.
