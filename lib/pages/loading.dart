import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTime instance=WorldTime(location: 'Kolkata',flag: 'india.png',url: 'Asia/Kolkata');
     await instance.getTime();
     Navigator.pushReplacementNamed(context, '/home',arguments:{
       'location': instance.location,
       'flag': instance.flag,
       'time': instance.time,
       'isDaytime': instance.isDaytime,
     });
     //print(instance.time);

  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[900],
      body: Center(
        child: SpinKitHourGlass(
          color: Colors.white,
          size: 80.0,
        ),
      )
    );
  }
}
