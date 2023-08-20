import 'package:flutter/material.dart';
import 'package:weather/screens/city_screen.dart';
import 'package:weather/services/weather.dart';
import '../utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key, this.locationWeather});

  final dynamic locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late WeatherModel weather = WeatherModel();
  late int temperature;
  late String weatherIcon;
  late String cityName;
  late String weatherMessage;
  late String description;

  @override
  void initState() {
    super.initState();

    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = 'Error';
        weatherMessage = 'Unable to get weather data';
        cityName = '';
        description = '';
        return;
      }
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      var condition = weatherData['weather'][0]['id'];
      cityName = weatherData['name'];
      weatherIcon = weather.getWeatherIcon(condition);
      weatherMessage = weather.getMessage(temperature);
      description = weatherData['weather'][0]['description'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/location_background.jpg'),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () async {
                      var weatherData = await weather.getLocationWeather();
                      updateUI(weatherData);
                    },
                    child: const Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      var typeName = await Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const CityScreen();
                      }));
                      if (typeName != null) {
                        var weatherData =
                            await weather.getCityWeather(typeName);
                        updateUI(weatherData);
                      }
                    },
                    child: const Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40.0,
              ),
              Column(
                children: [
                  Text(
                    cityName,
                    style: kConditionTextStyle,
                  ),
                  Text(
                    '$temperature°',
                    style: kTempTextStyle,
                  ),
                  Text(
                    "${description[0].toUpperCase()}${description.substring(1).toLowerCase()}",
                    style: kDescriptionTextStyle,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
