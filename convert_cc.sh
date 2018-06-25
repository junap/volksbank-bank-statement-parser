#!/bin/bash

regex='"([0-9.]{10})";"[0-9.]{10}";[^;]*;("[^";]+")?;;;;;"[^§]+§§([^§]+)§§([^"]+)";;"[A-Z]{3}";"(([0-9,\.]{4,})";"S"|([0-9,\.]{4,})";"H")'
file=$1

echo "Date,Payee,Memo,Outflow,Inflow"

while read line
do
  if [[ "$line" =~ $regex ]]
  then
    Date="${BASH_REMATCH[1]}"
    Payee="${BASH_REMATCH[3]}"
    Memo="${BASH_REMATCH[4]}" #TODO remove §§
    Outflow="${BASH_REMATCH[6]}" #TODO remove thousands separator in currency
    Inflow="${BASH_REMATCH[7]}" #TODO remove thousands separator in currency

    echo "$Date,\"$Payee\",\"$Memo\",\"$Outflow\",\"$Inflow\""
  fi
done < $file
