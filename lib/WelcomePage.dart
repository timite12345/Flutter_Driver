// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:driver_app/LoginPage1.dart';
import 'package:flutter/material.dart';
import 'Delay_animation.dart';

class WelcomePage extends StatelessWidget {
  //get vertical => null;

  // get horizontal => null;

  @override
  Widget build(BuildContext context) {
    // var top;
    // var textAlign;
    // var GoogleFonts;
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade900,
      body: SingleChildScrollView(
        child: Container(
            margin: const EdgeInsets.symmetric(
              vertical: 70,
              horizontal: 20,
            ),
            child: Column(children: [
              DelayedAnimation(
                duration: 1000,
                children: SizedBox(
                  height: 340,
                  child: Image.asset("images/im1.png"),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              DelayedAnimation(
                duration: 1500,
                children: Container(
                  margin: const EdgeInsets.only(
                    top: 80,
                    bottom: 30,
                  ),
                  child: const Text(
                    "Bienvenue",
                    style: TextStyle(
                      fontSize: 60,
                      //fontWeight: FontWeight.bold,
                      fontFamily: "Biscuit",
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              DelayedAnimation(
                duration: 1600,
                children: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 0,
                  ),
                  width: 350,
                  child: Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            shape: const StadiumBorder(),
                            padding: EdgeInsets.all(13)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "Commencer",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HommePage(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ])),
      ),
    );
  }
}
