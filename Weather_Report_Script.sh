#!/bin/bash

# API key and location

read -p "Enter location: " LOCATION
API_KEY="bd5e378503939ddaee76f12ad7a97608"


# Fetch weather data

WEATHER_DATA=$(curl -s "http://api.openweathermap.org/data/2.5/weather?q=$LOCATION&appid=$API_KEY&units=metric")

# Extract relevant information

TEMP=$(echo $WEATHER_DATA | jq -e '.main.temp')
DESCRIPTION=$(echo $WEATHER_DATA | jq '.weather[0].description')

# Display the weather

echo "Weather in $LOCATION:"
echo "Temperature: $TEMP°C"
echo "Description: $DESCRIPTION"

