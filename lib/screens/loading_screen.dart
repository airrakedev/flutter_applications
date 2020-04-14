import 'package:flutter/material.dart';

import 'package:clima/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();

    //UserScrollNotification GELOCATOR
    getUserLocationData();
  }

  void getUserLocationData() async {
    WeatherModel weather = WeatherModel();

    var weatherData = await weather.getUserLocationWeather();

    //NAVIGATE TO NEXT PAGE
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LocationScreen(weather: weatherData),
      ),
    );
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          size: 100.0,
          color: Colors.white,
        ),
      ),
    );
  }
}
