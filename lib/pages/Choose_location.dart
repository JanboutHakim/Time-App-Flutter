import 'package:flutter/material.dart';
import 'package:world_time/services/World_Time.dart';

class ChoseLocation extends StatefulWidget {
  const ChoseLocation({super.key});

  @override
  State<ChoseLocation> createState() => _ChoseLocationState();
}

class _ChoseLocationState extends State<ChoseLocation> {
  int count = 0;
  List<World_Time> locations = [
    World_Time(location: 'London', url: 'Europe/London', flag: 'London.jpg'),
    World_Time(location: 'Berlin', url: 'Europe/Berlin', flag: 'Berlin.jpg'),
    World_Time(location: 'Rome', url: 'Europe/Rome', flag: 'Rome.jpg'),
    World_Time(location: 'Tokyo', url: 'Asia/Tokyo', flag: 'Tokyo.jpg')
  ];
  void updateTime(index) async {
    Map data = {};

    World_Time instance = locations[index];
    await instance.getDate();
    data = {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'daytime': instance.daytime
    };
    Navigator.pop(context, data);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Chose a Location'),
        centerTitle: true,
        // elevation: 0,
      ),
      backgroundColor: Colors.grey[200],
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 1, horizontal: 4),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('images/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
