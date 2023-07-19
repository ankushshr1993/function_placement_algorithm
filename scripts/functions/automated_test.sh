#!/bin/bash

# Function to execute a command and wait for it to finish
execute_command() {
  "$@"
  local status=$?
  if [ $status -ne 0 ]; then
    echo "Error: Command execution failed: $1" >&2
    exit $status
  fi
}

# Array of argument options
arguments=("kalman" "particle" "extended")
series=(5 10 15 20 30 40)

# Loop over each argument option
for arg in "${arguments[@]}"; do
  # Loop over each series value
  for s in "${series[@]}"; do
    # Load generator command
    execute_command python3 load_generator_hellopy3.py hellopy series "$s" "$arg"
    sleep 120

    # Clean command
    execute_command python3 clean.py
    sleep 600
  done
done
