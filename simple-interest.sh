#!/bin/bash

# simple-interest.sh: Calculates simple interest (I = PRT / 100)

# 1. Get input from the user (Principal, Rate, Time)
read -p "Enter the Principal Amount (P): " P
read -p "Enter the Annual Interest Rate (R): " R
read -p "Enter the Time in Years (T): " T

# 2. Check if inputs are numbers (optional but recommended for a real script)
if ! [[ "$P" =~ ^[0-9]+(\.[0-9]+)?$ && "$R" =~ ^[0-9]+(\.[0-9]+)?$ && "$T" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
    echo "Error: All inputs must be numeric values."
    exit 1
fi

# 3. Calculate Simple Interest using 'bc' for floating-point arithmetic
# Formula: I = (P * R * T) / 100
# Scale=2 ensures the result has 2 decimal places.
INTEREST=$(echo "scale=2; ($P * $R * $T) / 100" | bc)

# 4. Calculate the Total Amount
AMOUNT=$(echo "scale=2; $P + $INTEREST" | bc)

# 5. Display the results
echo ""
echo "--- Simple Interest Calculation ---"
echo "Principal (P): $P"
echo "Rate (R): $R%"
echo "Time (T): $T years"
echo "-----------------------------------"
echo "Simple Interest (I): $INTEREST"
echo "Total Amount Due: $AMOUNT"
echo "-----------------------------------"
