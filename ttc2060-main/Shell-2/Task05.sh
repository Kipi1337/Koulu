#!/bin/bash

while true; do
    # Prompt the user for the operation
    read -p "Enter the operation (-, +, *, /) or 'exit' to quit: " operation

    # Check if the user wants to exit
    if [ "$operation" == "exit" ]; then
        echo "Exiting the calculator. Goodbye!"
        exit 0
    fi

    # Check if the operation is valid
    if [[ "$operation" != "+" && "$operation" != "-" && "$operation" != "*" && "$operation" != "/" ]]; then
        echo "Error: Invalid operation. Please enter +, -, *, /, or 'exit'."
        continue
    fi

    # Prompt the user for two values
    read -p "Enter the first value: " value1
    read -p "Enter the second value: " value2

    # Perform the calculation based on the selected operation
    case "$operation" in
        "+") result=$(echo "$value1 + $value2" | bc);;
        "-") result=$(echo "$value1 - $value2" | bc);;
        "*") result=$(echo "$value1 * $value2" | bc);;
        "/") 
            # Check if the denominator is not zero
            if [ "$value2" -eq 0 ]; then
                echo "Error: Division by zero is not allowed."
                continue
            fi
            result=$(echo "scale=2; $value1 / $value2" | bc);;
    esac

    # Print the result
    echo "Result: $result"
done