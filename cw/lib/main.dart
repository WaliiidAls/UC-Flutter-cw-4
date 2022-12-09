// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(body: SafeArea(child: cwOne())));
  }
}

class cwTwo extends StatelessWidget {
  const cwTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List prayer = ["الفجر", "الشروق", "الظهر", "العصر", "المغرب"];
    List time = ["5:00 AM", "6:00 AM", "12:00 PM", "3:00 PM", "6:00 PM"];
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blue, Colors.cyan, Colors.lime],
                begin: Alignment.topLeft)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(25),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.mosque),
                    Text("العاصمة", style: TextStyle(fontSize: 23)),
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.settings))
                  ]),
            ),
            Container(
              margin: EdgeInsets.only(top: 80, bottom: 40),
              child: Text(TimeOfDay.now().format(context),
                  style: TextStyle(fontSize: 60)),
            ),
            Container(
              margin: EdgeInsets.only(top: 30, bottom: 30),
              child: Text("باقي على الاذان", style: TextStyle(fontSize: 20)),
            ),
            Container(
              padding: EdgeInsets.all(30),
              margin: EdgeInsets.only(top: 1, bottom: 1, left: 5, right: 5),
              decoration: BoxDecoration(
                  color: Colors.blue.shade200.withOpacity(0.5),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.arrow_left),
                  Text(
                      "${DateTime.now().toString().substring(0, 10).replaceAll("-", " - ")}"),
                  Icon(Icons.arrow_right)
                ],
              ),
            ),
            for (int i = 0; i < 5; i++)
              Container(
                padding: EdgeInsets.all(27.5),
                margin:
                    EdgeInsets.only(top: 2.5, bottom: 2.5, left: 5, right: 5),
                decoration: i == 4
                    ? BoxDecoration(
                        color: Colors.blue.shade200.withOpacity(0.5),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)))
                    : BoxDecoration(
                        color: Colors.blue.shade200.withOpacity(0.5)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text(time[i]), Text(prayer[i])]),
              )
          ],
        ),
      ),
    );
  }
}

class cwOne extends StatelessWidget {
  const cwOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(border: Border.all()),
                  child: Image.asset(
                    "assets/images/hedgehog.jpg",
                    width: 100,
                    height: 100,
                  ),
                ),
                Text(
                  "Hedgehog",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            Container(child: Text("Spiny Mammal"), margin: EdgeInsets.all(25)),
            Text("The most adorable creature! 🥹"),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => cwTwo()));
              },
              child: Text("Next"),
            )
          ],
        ));
  }
}
