#!/bin/bash

error=false

# Testing valid files
echo -e "\033[0;35mCHECK VALID MAPS\033[0m"
for file in valid/*
do
  echo "Testing $file"
  output=$(./cub3D "$file" 2>&1)
#  sleep 0.2
  if [[ -n "$output" ]]
  then
    echo -e "\033[0;31mKO\033[0m"
    error=true
  else
    echo -e "\033[0;32mOK\033[0m"
  fi
done

# Testing invalid files
echo -e "\033[0;35mCHECK INVALID MAPS\033[0m"
for file in invalid/*
do
  echo "Testing $file"
  output=$(./cub3D "$file" 2>&1)
  #  sleep 0.2
  if [[ -n "$output" ]]
  then
    echo -e "\033[0;32mOK\033[0m"
  else
    echo -e "\033[0;31mKO\033[0m"
    error=true
  fi
done

if [ "$error" = true ]
then
  echo -e "\033[0;31m\nError : -------- > Some of Tests Failed\n\033[0m"
else
  echo -e "\033[0;32m\nAll Tests passed\n\033[0m"
fi
