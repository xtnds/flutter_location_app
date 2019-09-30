import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget{
  
  @override
  State<StatefulWidget> createState() {

    return _MyLocationState();
    
  }
}

class _MyLocationState extends State<MyApp>{

  String lat ="";
  String lon="";
  
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'the location app',
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          title: new Text(''),
          
        ),
        body: Center(
          child: new RaisedButton(
            onPressed: () async{
              Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
              print("Latitude ="+ position.latitude.toString() +" :: Longitude = "+position.longitude.toString() );
  

              setState(() {
                lat = position.latitude.toString();
                lon = position.longitude.toString();
              });
            },
            child: Text('Location'),
          ),
          
        ),
      ),
    );
  }
}