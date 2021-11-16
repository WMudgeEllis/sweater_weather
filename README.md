# README

### Summary

This is a learning project designed to explore exposing endpoints that aggregate data from several different apis.


### Deployment instructions

  ```
  git clone git@github.com:WMudgeEllis/sweater_weather.git

  bundle install

  rails db:{create,migrate}

  bundle exec install figaro

  ```

  You will need three different api keys added to the config/application.yml for the end points to be functional:

    * [mapquest](https://developer.mapquest.com/) saved as 'mapquest_key' enviroment variable

    * [open weather](https://openweathermap.org/api) saved as 'open_weather_key' variable

    * [unslplash](unsplash) save as 'unsplash_id'


### Endpoints

<details>
  <summary> Retrieve weather for a city </summary>

  * Method: GET

  * Endpoint: api/v1/forcast

  * Parameters: only accepts location as a string. Example request:

  * api/v1/forcast?location=denver,co

```
{
  "data": {
      "id": null,
      "type": "forecast",
      "attributes": {
          "current_weather": {
              "datetime": "2021-11-16T13:20:31.000-07:00",
              "sunrise": "2021-11-16T06:46:09.000-07:00",
              "sunset": "2021-11-16T16:43:41.000-07:00",
              "temperature": 69.78,
              "feels_like": 67.12,
              "humidity": 14,
              "uvi": 1.91,
              "visibility": 10000,
              "conditions": "overcast clouds",
              "icon": "04d"
          },
          "daily_weather": [
              {
                  "date": "2021-11-16",
                  "sunrise": "2021-11-16T06:46:09.000-07:00",
                  "sunset": "2021-11-16T16:43:41.000-07:00",
                  "max_temp": 69.78,
                  "min_temp": 46.8,
                  "conditions": "overcast clouds",
                  "icon": "04d"
              },
              {
                  "date": "2021-11-17",
                  "sunrise": "2021-11-17T06:47:17.000-07:00",
                  "sunset": "2021-11-17T16:42:57.000-07:00",
                  "max_temp": 42.98,
                  "min_temp": 34.63,
                  "conditions": "broken clouds",
                  "icon": "04d"
              },
              {
                  "date": "2021-11-18",
                  "sunrise": "2021-11-18T06:48:26.000-07:00",
                  "sunset": "2021-11-18T16:42:16.000-07:00",
                  "max_temp": 49.24,
                  "min_temp": 32.27,
                  "conditions": "clear sky",
                  "icon": "01d"
              },
              {
                  "date": "2021-11-19",
                  "sunrise": "2021-11-19T06:49:34.000-07:00",
                  "sunset": "2021-11-19T16:41:36.000-07:00",
                  "max_temp": 61.65,
                  "min_temp": 43.93,
                  "conditions": "overcast clouds",
                  "icon": "04d"
              },
              {
                  "date": "2021-11-20",
                  "sunrise": "2021-11-20T06:50:41.000-07:00",
                  "sunset": "2021-11-20T16:40:58.000-07:00",
                  "max_temp": 58.75,
                  "min_temp": 44.8,
                  "conditions": "overcast clouds",
                  "icon": "04d"
              }
          ],
          "hourly_weather": [
              {
                  "time": "13:00",
                  "temperature": 69.78,
                  "conditions": "overcast clouds",
                  "icon": "04d"
              },
              {
                  "time": "14:00",
                  "temperature": 69.44,
                  "conditions": "overcast clouds",
                  "icon": "04d"
              },
              {
                  "time": "15:00",
                  "temperature": 68.38,
                  "conditions": "overcast clouds",
                  "icon": "04d"
              },
              {
                  "time": "16:00",
                  "temperature": 66.18,
                  "conditions": "overcast clouds",
                  "icon": "04d"
              },
              {
                  "time": "17:00",
                  "temperature": 62.47,
                  "conditions": "overcast clouds",
                  "icon": "04n"
              },
              {
                  "time": "18:00",
                  "temperature": 58.68,
                  "conditions": "overcast clouds",
                  "icon": "04n"
              },
              {
                  "time": "19:00",
                  "temperature": 57.15,
                  "conditions": "broken clouds",
                  "icon": "04n"
              },
              {
                  "time": "20:00",
                  "temperature": 55.26,
                  "conditions": "scattered clouds",
                  "icon": "03n"
              }
          ]
      }
  }
}
```  
</details>

<details>
  <summary> Background image for a city </summary>

  * Permissions: any image that is presented must say the source (unsplash.com), give the photographer credit, and link to the author's unsplash portfolio. More information can be found [here](https://help.unsplash.com/en/articles/2511315-guideline-attribution)

  * method: GET

  * Endpoint: api/v1/backgrounds

  * Parameters: only accepts location as a string. Example request:

  * /api/v1/backgrounds?location=denver,co

  ```
  {
    "data": {
        "type": "image",
        "id": null,
        "attributes": {
            "location": "denver,co",
            "image_url": "https://images.unsplash.com/photo-1634507307799-ace9b49840b7?crop=entropy&cs=srgb&fm=jpg&ixid=MnwyNzU0MjV8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjb3xlbnwwfHx8fDE2MzcwODUwNjc&ixlib=rb-1.2.1&q=85",
            "credit": {
                "source": "unsplash.com",
                "photographer": "Dillon Wanner",
                "photographer_portfolio": "https://dillydally.myportfolio.com"
            }
        }
    }
  }

  ```

</details>


<details>
  <summary> User Registration </summary>

  * method: POST

  * Endpoint: api/v1/users

  * Parameters: No parameters, must include the following in the body of the request:

  ```
  {
    "email": "whatever@example.com",
    "password": "password",
    "password_confirmation": "password"
  }
  ```

  * Example response:

  ```
  {
      "data": {
          "type": "users",
          "id": "3",
          "attributes": {
              "email": "whatever@example.com",
              "api_key": "c66eefa19f1d0dfef2e2cf9a7e34e5a9"
          }
      }
  }
  ```

</details>


<details>
  <summary> User Login </summary>

  * method: POST

  * Endpoint: api/v1/sessions

  * Parameters: No parameters, must include the following in the body of the request:

  ```
  {
    "email": "whatever@example.com",
    "password": "password"
  }
  ```

  * Example response:

  ```
  {
      "data": {
          "type": "users",
          "id": "2",
          "attributes": {
              "email": "whatever@example.com",
              "api_key": "534d5f259d937d75a77dbecec01e3d32"
          }
      }
  }
  ```

</details>

<details>
  <summary> Road Trip </summary>

  * method: POST

  * Endpoint: api/v1/road_trip

  * Parameters: No parameters, must include the following in the body of the request:

  ```
  {
      "origin": "Denver,CO",
      "destination": "Pueblo,CO",
      "api_key": "534d5f259d937d75a77dbecec01e3d32"
  }
  ```

  * All are required. Api key must be a valid key.

  * Example response:

  ```
  {
      "data": {
          "id": null,
          "type": "road_trip",
          "attributes": {
              "start_city": "Denver,CO",
              "end_city": "Pueblo,CO",
              "travel_time": "01:45:23",
              "weather_at_eta": {
                  "temperature": 71.76,
                  "conditions": "overcast clouds"
              }
          }
      }
  }
  ```

</details>
