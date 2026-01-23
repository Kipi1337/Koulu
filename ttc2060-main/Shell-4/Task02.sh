#!/bin/bash

# generate number between 1-100
generate_random_number() {
    echo $((1 + RANDOM % 100))
}

# print 3 numbers
echo "Random Numbers:"
for i in {1..3}; do
    random_number=$(generate_random_number)
    echo "$i: $random_number"

    # Log the random numbers to syslog with user.info priority
    logger -p user.info -t random_number_script "Random number $i: $random_number"
done
