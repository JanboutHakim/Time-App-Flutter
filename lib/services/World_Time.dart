import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class World_Time {
  String location;
  String time = "";
  String flag; //url to assest picture
  String url;
  bool? daytime;

  World_Time({required this.location, required this.url, required this.flag});

  Future<void> getDate() async {
    try {
      //send a request
      http.Response response = await http.get(Uri(
          scheme: 'http', host: 'worldtimeapi.org', path: 'api/timezone/$url'));
      //convert json string to map
      Map data = jsonDecode(response.body);
      String nowtime = data['datetime'];
      String offset = data['utc_offset'];

      //create a datetime obj
      DateTime now = DateTime.parse(nowtime);
      now = now.add(
          Duration(hours: int.parse(offset.replaceAll(RegExp(r'[^0-9]'), ''))));
      //set the time propyrte
      daytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('the Error is :$e');
      time = 'Could Not Get Time ';
      daytime = false;
    }
  }
}
