import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class Weather {
//  String url;
//  Weather({this.url});

  Future getWeatherForecast(url) async {
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var weatherResponse = convert.jsonDecode(response.body);
//      print(response.body);
      return weatherResponse;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
