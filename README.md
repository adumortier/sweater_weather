### Notification Microservice

This notification microservice is used along with the Gard(in)That app. It allows the app to interact with the Google Calendar API and send notifications to users when they have added plants to their virtual garden.

Gard(in)That app repository:

https://github.com/adumortier/gardenthat

Gard(in)That on Heroku

https://thesweaterweather.herokuapp.com/

### Sweater Weather Access Points 

Retrieve a background picture for a specific location:
```sh
GET api/v1/backgrounds?location=<location_name_here>
```
Expected response: 
```sh
{
    "data": {
        "id": "poro",
        "type": "background",
        "attributes": {
            "url": "image_link_here"
        }
    }
}
```
Retrieve weather forecast for a specific location:
```sh
GET api/v1/forecast?location=<location_name_here>
```
Expected response: 
```sh
"data": {
        "id": "poro",
        "type": "weather_info",
        "attributes": {
            "weather_today_general": {
                "location": "Paris",
                "time": "6:26 PM, April 21",
                "current_temperature": 66,
                "description": "scattered clouds",
                "temperature_high": 58,
                "temperature_low": 66,
                "icon": "http://openweathermap.org/img/wn/03d@2x.png"
            },
            "weather_today_details": {
                "feels_like": 60,
                "humidity_percent": 45,
                "visibility_miles": 6,
                "description": "scattered clouds",
                "icon": "http://openweathermap.org/img/wn/03d@2x.png",
                "sunrise_time": "4:47 AM",
                "sunset_time": "6:50 PM",
                "uv_index": 5
            },
            "weather_forecast": {
                "forecast_hourly": [
                    {
                        "time": "6 PM",
                        "temperature": 66,
                        "icon": "http://openweathermap.org/img/wn/03d@2x.png"
                    },
                    {
                        "time": "7 PM",
                        "temperature": 64,
                        "icon": "http://openweathermap.org/img/wn/02n@2x.png"
                    },
                    {
                        "time": "8 PM",
                        "temperature": 62,
                        "icon": "http://openweathermap.org/img/wn/02n@2x.png"
                    },
                    {
                        "time": "9 PM",
                        "temperature": 61,
                        "icon": "http://openweathermap.org/img/wn/03n@2x.png"
                    }]
              "forecast_daily": [
                    {
                        "day": "Tuesday",
                        "description": "Clouds",
                        "precipitation_mm": 0,
                        "high_temp": 66,
                        "low_temp": 58,
                        "icon": "http://openweathermap.org/img/wn/03d@2x.png"
                    },
                    {
                        "day": "Wednesday",
                        "description": "Clear",
                        "precipitation_mm": 0,
                        "high_temp": 68,
                        "low_temp": 52,
                        "icon": "http://openweathermap.org/img/wn/01d@2x.png"
                    },
                    {
                        "day": "Thursday",
                        "description": "Clear",
                        "precipitation_mm": 0,
                        "high_temp": 74,
                        "low_temp": 54,
                        "icon": "http://openweathermap.org/img/wn/01d@2x.png"
                    },
                    {
                        "day": "Friday",
                        "description": "Clouds",
                        "precipitation_mm": 0,
                        "high_temp": 73,
                        "low_temp": 58,
                        "icon": "http://openweathermap.org/img/wn/04d@2x.png"
                    }
                    ]      
              }
        }
    }
}

```
Register a new user:
```sh
POST api/v1/users?email=<email_address_here>&password=<password_here>&password_confirmation=<confirmation_password_here>
```
Expected response: 
```sh

```
Login a registered user:
```
POST api/v1/sessions?email=<email_address_here>&password=<password_here>
```
Expected response: 
```sh

```
