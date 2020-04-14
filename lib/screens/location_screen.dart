import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_icons/weather_icons.dart';
import 'city_screen.dart';

class LocationScreen extends StatefulWidget {
  final weather;
  LocationScreen({this.weather});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  AssetImage _imageToShow;
  String weatherBackground = "images/location_background.jpg";

  WeatherModel weatherUtils = WeatherModel();

  int temperature;
  String condition;

  String cityName;
  String weatherTitle;
  String weatherDescription;

  IconData font;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    dynamic weatherData = widget.weather;

    //UPDATE UI
    updateUI(weatherData);
  }

  void updateUI(dynamic weatherData) async {
    setState(() {
      //CHECK IF WEATHERDATA HAS PAYLOAD
      if (weatherData == null) {
        temperature = 0;
        condition = '';
        cityName = "your location";
        weatherTitle = "Weather";
        weatherDescription = "Unable to access data";
        weatherBackground = 'location_background.jpg';
        return;
      }

      temperature = weatherData['main']['temp'].toInt();

      print("$temperature --- di pod");
      cityName = weatherData['name'];

      int conditionValue = weatherData['weather'][0]['id'];

      print("$conditionValue -- Mao ni id");

//condition = weatherUtils.getWeatherFontIcon(conditionValue);
      font = weatherUtils.getWeatherFontIcon(conditionValue);
//weatherDescription = weatherUtils.getMessage(temperature);
      weatherTitle = weatherData['weather'][0]['main'];
      weatherDescription = weatherData['weather'][0]['description'];
      weatherBackground = weatherUtils.getWeatherBackground(conditionValue);

      _imageToShow = new AssetImage(weatherBackground);

//font = getWeatherFontIcon(conditionValue);

      print("$font -- yeoh");
    });
  }

  @override
  Widget build(BuildContext context) {
    print("$font -- yeoh");
    return Scaffold(
      body: Container(
//        decoration: BoxDecoration(
//          image: DecorationImage(
//            image: AssetImage("images/location_background.jpg"),
////            image: _imageToShow,
//            fit: BoxFit.cover,
//            colorFilter: ColorFilter.mode(
//              Colors.white.withOpacity(0.8),
//              BlendMode.dstATop,
//            ),
//          ),
//        ),
//        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      //UPDATE UI
                      var weatherData =
                          await weatherUtils.getUserLocationWeather();
                      updateUI(weatherData);
                    },
                    child: Icon(
//                      Icons.near_me,
                      FontAwesomeIcons.streetView,
                      size: 40.0,
                      color: kBlueColor,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      FocusScope.of(context).unfocus();
                      var searchValue = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CityScreen()),
                      );

                      if (searchValue != null) {
                        var cityWeather = await weatherUtils
                            .getCityWeatherCondition(searchValue);
                        updateUI(cityWeather);
                        print("$cityWeather -- WOW");
                      }
                      print(searchValue);
                    },
                    child: Icon(
                      FontAwesomeIcons.mapMarkedAlt,
                      size: 40.0,
                      color: kBlueColor,
                    ),
                  ),
                ],
              ),
              Container(
                child: Expanded(
//                  padding: EdgeInsets.only(left: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 30.0,
                      ),
                      Text(
                        cityName.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30.0,
                            color: kBlueColor,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3.0,
                            fontFamily: "Fredoka"),
                      ),
                      Text(
                        "It's $weatherTitle",
                        style: TextStyle(
                            fontSize: 20.0,
                            color: kGreyColor,
                            letterSpacing: 1.0,
                            fontFamily: "Nexie"),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            FontAwesome(font: font),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '$temperature°',
                              style: kTempTextStyle,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
//                mainAxisAlignment: MainAxisAlignment.end,
                height: 200.0,
                padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 40.0),
                width: double.infinity,

                decoration: BoxDecoration(
                  color: kBlueColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60.0),
                    topRight: Radius.circular(60.0),
                  ),
                ),
                child: Text(
                  "Wow! $weatherDescription in $cityName!",
                  textAlign: TextAlign.center,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FontAwesome extends StatelessWidget {
  const FontAwesome({this.font});

  final IconData font;

  @override
  Widget build(BuildContext context) {
    return Icon(
      this.font,
      size: 120.0,
      color: kBlueColor,
    );
  }
}
