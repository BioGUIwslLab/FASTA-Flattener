#!/bin/bash

# Check if input arguments are provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 <input_fasta> <output_fasta>"
    exit 1
fi

input_fasta=$1
output_fasta=$2

awk '/^>/ {if (seq) print seq; print; seq=""; next;} {seq=seq$0;} END {print seq;}' ${input_fasta} > ${output_fasta}
