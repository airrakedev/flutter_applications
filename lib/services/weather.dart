import 'location.dart';
import 'networking.dart';
import 'package:clima/utilities/constants.dart';
import 'package:weather_icons/weather_icons.dart';

//INITIALISE LOCATION CLASS
Location location = Location();

//INITIALISE WEATHER CLASS
Weather weather = Weather();

class WeatherModel {
  Future<dynamic> getCityWeatherCondition(cityName) async {
    String url =
        "https://api.openweathermap.org/data/2.5/weather?q=$cityName&units=metric&appid=$kAPIkey";

    return await weather.getWeatherForecast(url);
  }

  Future<dynamic> getUserLocationWeather() async {
    await location.getCurrentLocation();

    String url = "https://api.openweathermap.org/data/2.5/weathe"
        "r?lat=${location.latitude}&lon=${location.longitude}&appid=$kAPIkey&units=metric";

    return await weather.getWeatherForecast(url);
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  dynamic getWeatherFontIcon(int condition) {
    if (condition < 300) {
      if (condition >= 200 || condition <= 202) {
        return WeatherIcons.storm_showers;
      } else if (condition > 202 || condition <= 221) {
        return WeatherIcons.night_lightning;
      } else {
        return WeatherIcons.night_snow_thunderstorm;
      }
    } else if (condition < 400) {
      if (condition >= 300 || condition <= 302) {
        return WeatherIcons.night_snow_wind;
      } else if (condition > 302 || condition <= 312) {
        return WeatherIcons.night_showers;
      } else {
        return WeatherIcons.night_rain_wind;
      }
    } else if (condition < 600) {
      if (condition >= 500 || condition <= 501) {
        return WeatherIcons.rain_wind;
      } else if (condition > 302 || condition <= 312) {
        return WeatherIcons.rain;
      } else {
        return WeatherIcons.showers;
      }
    } else if (condition < 700) {
      if (condition >= 600 || condition <= 601) {
        return WeatherIcons.snow;
      } else if (condition > 601 || condition <= 616) {
        return WeatherIcons.sprinkle;
      } else {
        return WeatherIcons.sleet;
      }
    } else if (condition < 800) {
      if (condition >= 701 || condition <= 721) {
        return WeatherIcons.day_haze;
      } else if (condition > 721 || condition <= 761) {
        return WeatherIcons.day_fog;
      } else {
        return WeatherIcons.day_cloudy_gusts;
      }
    } else if (condition == 800) {
      return WeatherIcons.day_sunny_overcast;
    } else if (condition <= 804) {
      return WeatherIcons.cloudy;
    } else {
      return WeatherIcons.day_sunny;
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }

  String getWeatherBackground(int condition) {
    if (condition < 300) {
      return 'images/thunderstorm.jpg';
    } else if (condition < 400) {
      return 'images/drizzle.jpg';
    } else if (condition < 600) {
      return 'images/rain.jpg️';
    } else if (condition < 700) {
      return 'images/snow.jpg️';
    } else if (condition < 800) {
      return 'images/atmosphere.jpg';
    } else if (condition == 800) {
      return 'images/clear.jpg️';
    } else if (condition <= 804) {
      return 'images/cloudy.jpg️';
    } else {
      return 'images/location_background.jpg‍';
    }
  }
}
