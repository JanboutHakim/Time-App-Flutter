import 'package:flutter/material.dart';
import 'package:world_time/services/World_Time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String? time;
  void setupWorldTime() async {
    World_Time instance = World_Time(
        location: 'Berlin', url: 'Europe/Berlin', flag: 'germany.png');
    await instance.getDate();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'loacation': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'daytime': instance.daytime
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: SpinKitCubeGrid(
            color: Colors.grey[500],
            size: 80,
          ),
        ));
  }
}
