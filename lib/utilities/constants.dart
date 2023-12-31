import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontWeight: FontWeight.w100,
  fontSize: 80.0,
);

const kMessageTextStyle = TextStyle(
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
);

const kConditionTextStyle = TextStyle(
  fontSize: 30.0,
  fontWeight: FontWeight.w100,
);

const kDescriptionTextStyle = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.w100,
  color: Colors.grey,
);

const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(Icons.location_city),
  hintText: 'Enter City Name',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide.none,
  ),
);
