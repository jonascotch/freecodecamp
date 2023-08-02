#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo "$($PSQL "TRUNCATE games, teams;")"

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
if [[ $YEAR != "year" ]]
then
    # get winner team_id
    WINNER_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    # if null
    if [[ -z $WINNER_TEAM_ID ]]
    then
      $PSQL "INSERT INTO teams(name) VALUES ('$WINNER')"
      #get new team_id
      WINNER_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    fi
    # get opponent team_id
    OPPONENT_TEAM_ID=$($PSQL " SELECT team_id from teams WHERE name='$OPPONENT';")
    if [[ -z $OPPONENT_TEAM_ID ]]
    then
      # insert into table
      $PSQL "INSERT INTO teams(name) VALUES ('$OPPONENT')"
      #get opponent team_id
      OPPONENT_TEAM_ID=$($PSQL " SELECT team_id from teams WHERE name='$OPPONENT';")
    fi

    # insert data in games table
    $PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ($YEAR, '$ROUND', $WINNER_TEAM_ID, $OPPONENT_TEAM_ID, $WINNER_GOALS, $OPPONENT_GOALS)"    
fi
done