#! /bin/bash

PSQL="psql -U freecodecamp -d number_guess -t -c"

echo -e "\n~~ Number Guessing Game ~~\n"

echo "Enter your username:"

read NAME

USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$NAME' ;")

if [[ -z $USER_ID ]]
then
  # salute new user
  echo "Welcome, $NAME! It looks like this is your first time here."
  # insert new user in database
  NEW_USER_INSERT=$($PSQL "INSERT INTO users (username) VALUES ('$NAME') ;")
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$NAME'")

else
  # get data for user
  USER_GAME_DATA=$($PSQL "SELECT username, COUNT(*), MIN(guesses) FROM users FULL JOIN games USING(user_id) WHERE user_id=$USER_ID GROUP BY username;")
  
  # greet user with data
  echo $USER_GAME_DATA | while read USERNAME BAR GAMES_PLAYED BAR BEST_GAME
  do
    echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  done
fi

SECRET_NUMBER=$(echo $((RANDOM%1000 + 1)))

echo -e "\nGuess the secret number between 1 and 1000:"
read GUESSED_NUMBER

NUMBER_OF_GUESSES=0

while [[ $GUESSED_NUMBER != $SECRET_NUMBER ]]
do
  CHECK_GUESSED=$(echo $GUESSED_NUMBER | sed 's/[0-9]//g')
  
  if [[ $CHECK_GUESSED != "" ]]
  then
    # ask for proper number
    echo "That is not an integer, guess again:"
    read GUESSED_NUMBER
  else
    NUMBER_OF_GUESSES=$(( NUMBER_OF_GUESSES + 1 ))
    if [[ $GUESSED_NUMBER < $SECRET_NUMBER ]]
    then
      echo -e "\nIt's higher than that, guess again:"
      read GUESSED_NUMBER
    else
      echo -e "\nIt's lower than that, guess again:"
      read GUESSED_NUMBER
    fi
  fi
done

NUMBER_OF_GUESSES=$(( NUMBER_OF_GUESSES + 1 ))

echo -e "\nYou guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"

INSERT_RESULT=$($PSQL "INSERT INTO games (user_id, guesses) VALUES ($USER_ID, $NUMBER_OF_GUESSES) ;")
