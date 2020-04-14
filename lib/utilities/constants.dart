import 'package:flutter/material.dart';

const kAPIkey = "66cd717e19a74dcd1575119edb3c4fab";

const kBlueColor = Color(0xFF495ABF);
const kGreyColor = Color(0xFFCCCCCC);

const kTempTextStyle = TextStyle(
  fontFamily: 'Fredoka',
  fontSize: 80.0,
  color: kBlueColor,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Nexie',
  fontWeight: FontWeight.bold,
  fontSize: 30.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  color: kBlueColor,
  fontFamily: 'Fredoka',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const kSearchField = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  hintText: 'Find by City',
  hintStyle: TextStyle(
    color: Colors.grey,
    fontFamily: "Nexie",
  ),
//  icon: Icon(
//    Icons.location_city,
//    color: kBlueColor,
//  ),
  border: OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.all(
      Radius.circular(15.0),
    ),
  ),
);
