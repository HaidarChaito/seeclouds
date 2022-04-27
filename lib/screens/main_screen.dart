import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:seeclouds/components/custom_floating_button.dart';
import 'package:seeclouds/components/gradient.dart';
import 'package:seeclouds/components/list_preview_items.dart';
import 'package:seeclouds/constants.dart';
import 'package:seeclouds/services/location.dart';
import 'package:seeclouds/services/weather.dart';

class MainScreen extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final weather;
  const MainScreen({Key? key, this.weather}) : super(key: key);
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late Weather weather;
  final Location _location = Location();

  @override
  void initState() {
    super.initState();
    weather = Weather(widget.weather);
    weather.initWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // background image
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(weather.setImageBackground()),
              fit: BoxFit.fitHeight),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  // first button
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: CustomFloatingButton(
                      icon: FontAwesomeIcons.book,
                    ),
                  ),
                  // second button
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: CustomFloatingButton(
                      icon: Icons.search_rounded,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  FutureBuilder(
                    future: _location.getCurrentLocation(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return GradientText(
                          _location.city ?? 'test',
                          style: kMainPreviewText,
                          gradient: const LinearGradient(
                            end: Alignment.bottomCenter,
                            colors: [kPrimaryBlueColor, kPrimaryPinkColor],
                          ),
                        );
                      } else {
                        return const Text('test2');
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        weather.listPreviewMaps[0]['listPreviewTextTempHigh'],
                        style: kListPreviewTextpinkBig,
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      Image.asset(
                        weather.setImages(0),
                        width: 70,
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      Text(
                        weather.listPreviewMaps[0]['listPreviewTextTempLow'],
                        style: kListPreviewTextblueBig,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GradientText(
                    weather.setDescription(),
                    style: kMainDescription,
                    gradient: const LinearGradient(
                      begin: Alignment.center,
                      end: Alignment.bottomRight,
                      colors: [kPrimaryPinkColor, kPrimaryBlueColor],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                color: kPrimaryCardColor,
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: const [
                    SizedBox(
                      width: 205,
                    ),
                    Icon(
                      FontAwesomeIcons.temperatureArrowUp,
                      color: kPrimaryWhite,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Icon(
                      FontAwesomeIcons.temperatureArrowDown,
                      color: kPrimaryWhite,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Icon(
                      FontAwesomeIcons.droplet,
                      color: kPrimaryBlueColor,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    if (index != 0) {
                      return ListPreviewItems(
                          listPreviewImage1: weather.setImages(index),
                          listPreviewTexts: weather.listPreviewMaps[index]);
                    } else {
                      return Container();
                    }
                  },
                  itemCount: weather.listPreviewMaps.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> getListViews() {
    List<Widget> list = [];
    for (var i = 0; i < 5; i++) {
      list.add(
        ListPreviewItems(
            listPreviewImage1: weather.setImages(i),
            listPreviewTexts: weather.listPreviewMaps[i]),
      );
      list.add(
        const SizedBox(
          height: 5,
        ),
      );
    }
    return list;
  }
}
