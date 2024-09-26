#!/bin/bash

files=("qs_scf_initialization.F")
#files=( "qs_scf_initialization.F" "qs_charge_mixing.F" "qs_gspace_mixing.F" "qs_mixing_utils.F" "qs_outer_scf.F" "qs_scf.F" "qs_scf_diagonalization.F" "qs_scf_loop_utils.F" "qs_scf_methods.F" "qs_scf_output.F")

input_raw="WRITE (*, *) "
input=$(printf '%s\n' "$input_raw" | sed -e 's/[\/&]/\\&/g')
echo $input

output_raw="!WRITE (*, *) "
output=$(printf '%s\n' "$output_raw" | sed -e 's/[\/&]/\\&/g')
echo $output

for file in "${files[@]}"; do
	echo $file
	sed -i -e "s/$input/$output/g" src/$file
done
