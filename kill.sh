#!/usr/bin/env bash

# Drop this in your ~/.bashrc or ~/.zshrc file

# Use as: killAllProcesses chrome
#      where 'chrome' is the name of the process
#
# To get the name of the process run: ps -A
function killAllProcesses() {
  for f in $(pgrep "$1"); do
    echo "💀 Killing PID $f"
    kill -9 $f
  done
}

# Use as: checkIfJavaIsConsumingMemoryAndKillIt
function checkIfJavaIsConsumingMemoryAndKillIt() {
  local CURRENT_DATE=$(date)

  local TOTAL_MEM_CONSUMED_BY_JAVA_PROC=$(top grep java | awk '{ printf "%s\n", $8/1024 }' | awk '{s+=$1} END {printf "%.0f\n", s}')

  if [[ $TOTAL_MEM_CONSUMED_BY_JAVA_PROC > 4 ]]; then
    echo "🤯Java process is consuming more than 4 Gb memory, killing all java processes!"
    echo ""
    echo "🧐 Memory consumed as of $CURRENT_DATE = $TOTAL_MEM_CONSUMED_BY_JAVA_PROC Gb"
    killAllProcesses java
  fi
}

