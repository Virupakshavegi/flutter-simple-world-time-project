import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data={};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty? data : ModalRoute.of(context)!.settings.arguments as Map;
    print(data);

    //set background image
    String bgImage= data['isDaytime']? 'day.jpg' : 'night.jpg' ;
    Color? bgColor =data['isDaytime']? Colors.amberAccent : Colors.amber[700];


    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,120.0,0,0),
            child: Column(
              children: <Widget>[const Icon(
                Icons.edit_location,
                color: Colors.black87,
              ),
                TextButton(
                    onPressed: () async {
                      dynamic result= await Navigator.pushNamed(context, '/Location');
                      setState(() {
                        data={
                          'time': result['time'],
                          'location': result['location'],
                          'isDaytime': result['isDaytime'],
                          'flag': result['flag'],
                        };
                      });
                    },
                    child: const Text(
                      'Edit Location',
                      style: TextStyle(
                        color: Colors.black87,
                      ),
                  ),

                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  data['time'],
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 66.0,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
