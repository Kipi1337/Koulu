#!/bin/bash

# Functions
add() {
    echo "$1 + $2" | bc
}
subtract() {
    echo "$1 - $2" | bc
}
multiply() {
    echo "$1 * $2" | bc
}
divide() {
    echo "scale=2; $1 / $2" | bc
}

# Validate operator
validateoperator() {
    [[ "$1" == "+" || "$1" == "-" || "$1" == "*" || "$1" == "/" ]]
}

while true;
do
    # Read operation
    read -p "Enter the operation (-, +, *, /) or 'exit' to quit: " operation
    # Check if the user wants to exit
    if [ "$operation" == "exit" ]; then
        echo "Exiting the calculator. Goodbye!"
        exit 0
    fi
    # Check if operation is valid
    if ! validateoperator "$operation"; then
        echo "Error: Invalid operation. Please enter +, -, *, /, or 'exit'."
        continue
    fi

    # Read numbers from user
    read -p "Enter the first value: " value1
    read -p "Enter the second value: " value2

    # Case based on operation
    case "$operation" in
        "+") result=$(add "$value1" "$value2");;
        "-") result=$(subtract "$value1" "$value2");;
        "*") result=$(multiply "$value1" "$value2");;
        "/") 
            # Check if the denominator is not zero
            if [ "$value2" -eq 0 ]; then
                echo "Error: Division by zero is not allowed."
                continue
            fi
            result=$(divide "$value1" "$value2");;
    esac

    # Print the result
    echo "Result: $result"
done
