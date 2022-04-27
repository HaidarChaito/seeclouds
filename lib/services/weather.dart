import 'dart:math';

class Weather {
  Weather(this.weather);
  List listPreviewMaps = [];
  // ignore: prefer_typing_uninitialized_variables
  var weather;

  String setImageBackground() {
    int rng = Random().nextInt(3) + 1;
    var stat = weather['daily'][0]['weather'][0]['id'];
    // storm
    if (stat < 400) {
      return 'resources/background/storm$rng.jpg';
    } else if (stat < 600) {
      // rain
      return 'resources/background/rain$rng.jpg';
    } else if (stat < 800) {
      // snow
      return 'resources/background/snow$rng.jpg';
    } else if (stat == 800) {
      // clear
      return 'resources/background/clear$rng.jpg';
    } else {
      // cloudy
      return 'resources/background/cloudy$rng.jpg';
    }
  }

  void initWeather() {
    DateTime now = DateTime.now();

    for (var i = 0; i < 7; i++) {
      String tod = '';
      var tod2 = now.add(Duration(days: i)).weekday;
      switch (tod2) {
        case (1):
          tod += 'Mon';
          break;
        case (2):
          tod += 'Tue';
          break;
        case (3):
          tod += 'Wed';
          break;
        case (4):
          tod += 'Thu';
          break;
        case (5):
          tod += 'Fri';
          break;
        case (6):
          tod += 'Sat';
          break;
        case (7):
          tod += 'Sun';
          break;
      }
      tod += ' ';
      tod += now.add(Duration(days: i)).day.toString();
      Map<String, String> listmap = {
        'listPreviewTextDay': tod,
        'listPreviewTextTempHigh':
            weather['daily'][i]['temp']['max'].round().toString() + 'c',
        'listPreviewTextTempLow':
            weather['daily'][i]['temp']['min'].round().toString() + 'c',
        'listPreviewTextPrec': weather['daily'][i]['humidity'].toString() + '%',
      };
      listPreviewMaps.add(listmap);
    }
  }

  String setDescription() {
    return weather['daily'][0]['weather'][0]['description'];
  }

  String setImages(int i) {
    var stat = weather['daily'][i]['weather'][0]['id'];
    if (stat < 400) {
      return 'resources/img/storm.png';
    } else if (stat < 600) {
      return 'resources/img/rain.png';
    } else if (stat < 800) {
      return 'resources/img/snow.png';
    } else if (stat == 800) {
      return 'resources/img/sunny.png';
    } else {
      return 'resources/img/cloudy.png';
    }
  }
}
