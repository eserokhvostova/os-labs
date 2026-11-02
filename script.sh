#!/bin/bash

count = 1
while IFC= read -r line || [[ -n "$line" ]]; do
	echo "$count: $line"
	count=$((count+1))
done < "$1"



