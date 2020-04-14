import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_icons/weather_icons.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String searchValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/search_image.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      FontAwesomeIcons.longArrowAltLeft,
                      color: Colors.white,
                      size: 40.0,
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(
                    top: 20.0, bottom: 10.0, left: 20.0, right: 20.0),
                child: TextField(
                  style: TextStyle(
                    color: Colors.black87,
                    decorationStyle: TextDecorationStyle.dotted,
                    decorationColor: Colors.white,
                  ),
                  decoration: kSearchField,
                  onChanged: (text) {
                    searchValue = text;
                  },
                ),
              ),
              FlatButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();

                  Navigator.pop(context, searchValue);
                },
                child: Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
