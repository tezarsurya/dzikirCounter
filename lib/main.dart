import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int number = 0;
  String dzikir;

  void tekanTombol() {
    setState(() {
      number = number + 1;
      if (number == 99) {
        getar();
        number = 0;
      }
    });
  }

  String ubahDzikir(dzikir) {
    if (number >= 0 && number < 33) {
      dzikir = "Subhanallah";
      return "Subhanallah";
    } else if (number >= 33 && number < 66) {
      dzikir = "Alhamdulillah";
      return "Alhamdulillah";
    } else {
      dzikir = "Allahuakbar";
      return "Allahuakbar";
    }
  }

  void getar() {
    if (number == 33) {
      Vibration.vibrate(duration: 500);
    } else if (number == 66) {
      Vibration.vibrate(duration: 500);
    } else if (number == 99) {
      Vibration.vibrate(duration: 1000);
    }
  }

  void reset() {
    setState(() {
      number = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    getar();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Dzikir Counter"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                number.toString(),
                style: TextStyle(fontSize: 100, color: Colors.green),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    ubahDzikir(dzikir),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.green,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Container(
                child: RaisedButton(
                  onPressed: tekanTombol,
                  child: Text("Dzikir button"),
                ),
                margin: EdgeInsets.all(10),
                width: 300,
                height: 75,
              ),
              Container(
                child: RaisedButton(
                  color: Colors.red,
                  onPressed: reset,
                  child: Text("Reset"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
