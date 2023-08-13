#! /bin/bash

PSQL="psql -t -U freecodecamp -d salon -c"

echo -e "\n~~ Joao's Beauty Salon ~~\n"

echo -e "What service would you like?\n"

SERVICES=$($PSQL "SELECT * FROM services ;")

echo "$SERVICES" |  while read ID BAR SERVICE
do
  echo "$ID) $SERVICE"
done

echo -e "\nPlease choose one:"

read SERVICE_ID_SELECTED

SERVICE_TYPE=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED ;")

while [[ -z $SERVICE_TYPE ]]
do
  # show list again
  echo "$SERVICES" |  while read ID BAR SERVICE
  do
    echo "$ID) $SERVICE"
  done
  echo -e "\nPlease choose a valid number:"
  read SERVICE_ID_SELECTED
  SERVICE_TYPE=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED ;")
done

echo -e "\nWhat is your phone number?"

read CUSTOMER_PHONE

CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE';")

if [[ -z $CUSTOMER_NAME ]]
then
  echo -e "\nYour number is not registered.\nWe love a new customer! What's your name?"
  read CUSTOMER_NAME
  # input customer data
  NEW_CUSTOMER_INSERT=$($PSQL "INSERT INTO customers (name, phone) VALUES ('$CUSTOMER_NAME', '$CUSTOMER_PHONE') ;")
fi

CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

echo -e "\nWhat time do you wanto to book for$SERVICE_TYPE, $CUSTOMER_NAME?"
read SERVICE_TIME

APPOINTMENT_INPUT=$($PSQL "INSERT INTO appointments (customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME') ;")

echo -e "\nI have put you down for a$SERVICE_TYPE at $SERVICE_TIME, $CUSTOMER_NAME."
echo -e "\nThanks for choosing Joao's Beauty Salon.\nLooking forward to meet you!"