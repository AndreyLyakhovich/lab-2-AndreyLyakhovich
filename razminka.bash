#!/bin/bash

a=$1
b=$2

echo -n $(($a + $b)) 
echo -n " "
echo -n $(($a - $b)) 
echo -n " "
echo $(($a * $b))
