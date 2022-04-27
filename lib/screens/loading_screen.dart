import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:seeclouds/api.dart';
import 'package:seeclouds/constants.dart';
import 'package:seeclouds/screens/main_screen.dart';
import 'package:seeclouds/services/location.dart';
import 'package:seeclouds/services/networking.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? latitude;
  double? longitude;
  // ignore: prefer_typing_uninitialized_variables
  var weatherdata;

  void next() async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MainScreen(
          weather: weatherdata,
        ),
      ),
    );
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;
    String url =
        'https://api.openweathermap.org/data/2.5/onecall?lat=$latitude&lon=$longitude&exclude=hourly,minutely&units=metric&appid=$apikey';
    NetworkHelper networkHelper = NetworkHelper(url);
    weatherdata = await networkHelper.getData();
    while (!await location.checkPermissions()) {
      location.requestPermissions();
    }
    next();
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kPrimaryBlackColor,
      body: Center(
        child: SpinKitSpinningLines(color: kPrimaryBlueColor),
      ),
    );
  }
}
