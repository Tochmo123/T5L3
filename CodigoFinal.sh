#!/bin/bash

number=$1


if [[ $number =~ ^M{0,4}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})$ ]]; then
  echo "El número está codificado en formato romano."
  decimal=0
  for ((i=0; i<${#number}; i++))
  do
    current_char=${number:$i:1}                 ## Esto hace que a partir de $i posicion te coja el uno,dos, etc...
    if [[ $current_char == "I" ]]; then
      decimal=$((decimal+1))
    elif [[ $current_char == "V" ]];  then
      decimal=$((decimal+5))
    elif [[ $current_char == "X" ]]; then
      decimal=$((decimal+10))
    elif [[ $current_char == "L" ]]; then
      decimal=$((decimal+50))
    elif [[ $current_char == "C" ]]; then
      decimal=$((decimal+100))
    elif [[ $current_char == "D" ]]; then
      decimal=$((decimal+500))
    elif [[ $current_char == "M" ]]; then
      decimal=$((decimal+1000))
    fi
  done
  echo "El número en decimal es: $decimal"
elif [[ $number =~ ^[0-9]+$ ]]; then
if [[ $number -lt 1 || $number -gt 1999 ]]; then
  echo "El número debe estar entre 1 y 1999"
  else
  roman=""
  echo "El número está codificado en formato decimal."
  while ((number >= 1000))
  do
    roman+="M"
    number=$((number-1000))
  done
  while ((number >= 900))
  do
    roman+="CM"
    number=$((number-900))
  done
  while ((number >= 500))
  do
    roman+="D"
    number=$((number-500))
  done
  while ((number >= 400))
  do
    roman+="CD"
    number=$((number-400))
  done
  while ((number >= 100))
  do
    roman+="C"
    number=$((number-100))
  done
  while ((number >= 90))
  do
    roman+="XC"
    number=$((number-90))
  done
  while ((number >= 50))
  do
    roman+="L"
    number=$((number-50))
  done
  while ((number >= 40))
  do
    roman+="XL"
    number=$((number-40))
  done
  while ((number >= 10))
  do
    roman+="X"
    number=$((number-10))
  done
  while ((number >= 9))
  do
    roman+="IX"
    number=$((number-9))
  done
   while ((number >= 5))
  do
    roman+="V"
    number=$((number-5))
  done
  while ((number >= 4))
  do
    roman+="IV"
    number=$((number-4))
  done
  while ((number > 0))
  do
    roman+="I"
    number=$((number-1))
  done
  echo "El número en romano es: $roman"
  fi
else
  echo "El número introducido no es válido."
fi

