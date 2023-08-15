PSQL="psql -U freecodecamp -d periodic_table -t -c"

if [[ -z $1 ]]
then
  echo -e "Please provide an element as an argument."
else

  INPUT_TYPE=$(echo $1 | sed 's/[0-9]//g')
  
  if [[ $INPUT_TYPE == "" ]]
  then
    #element search in atomic number
    ELEMENT=$($PSQL "SELECT types.type, atomic_number, symbol, name, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements LEFT JOIN properties USING(atomic_number) LEFT JOIN types USING(type_id) WHERE atomic_number=$1 ;")
  else
    # element search in name and symbol
    ELEMENT=$($PSQL "SELECT types.type, atomic_number, symbol, name, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements LEFT JOIN properties USING(atomic_number) LEFT JOIN types USING(type_id) WHERE symbol='$1' OR name='$1' ;")
  fi

  if [[ -z $ELEMENT ]]
  then
    echo "I could not find that element in the database."
    else
    echo $ELEMENT | while read TYPE BAR ATOMIC_NUMBER BAR SYMBOL BAR NAME BAR WEIGHT BAR MPOINT BAR BPOINT
    do
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $WEIGHT amu. $NAME has a melting point of $MPOINT celsius and a boiling point of $BPOINT celsius."
    done
  fi
fi
