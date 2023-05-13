// ignore_for_file: sized_box_for_whitespace

import 'package:driver_app/MapsSlinding.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ChoixPage.dart';
import 'Delay_animation.dart';

// ignore: use_key_in_widget_constructors
class SocialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // sa particularité Ce widget est capable d'occuper tout l'écran
      // de l'appareil. c'est un widget père auquel s'accroche tout les autres
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 0,
            vertical: 10,
          ),
          child: Column(
            children: [
              DelayedAnimation(
                duration: 100,
                children: Container(
                  height: 260,
                  width: 600,
                  child: Image.asset('images/im2.png'),
                ),
              ),
              DelayedAnimation(
                  duration: 1000,
                  children: Container(
                      child: Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 40,
                            horizontal: 30,
                          ),
                          child: Column(
                            children: [
                              Text(
                                "Ordres de Mission",
                                style: TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Biscuit",
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              SizedBox(height: 0),
                              Text(
                                "Laissez-nous vous guider :",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  color: Colors.grey,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          )))),
              DelayedAnimation(
                  duration: 700,
                  children: Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 14,
                        horizontal: 40,
                      ),
                      child: Column(
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ChoixPage(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                shape: StadiumBorder(),
                                primary: Colors.indigo,
                                padding: const EdgeInsets.all(13),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.car_repair_outlined,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    "Nouvelles Missions",
                                    style: GoogleFonts.poppins(
                                      // color : Colors.black ,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              )),
                          SizedBox(height: 30),
                          ElevatedButton(
                              onPressed: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => FirstScreen(),
                                //   ),
                                // );
                              },
                              style: ElevatedButton.styleFrom(
                                shape: StadiumBorder(),
                                primary: Colors.blueGrey,
                                padding: const EdgeInsets.all(13),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.car_repair_sharp),
                                  SizedBox(width: 10),
                                  Text(
                                    "Historiques Missions",
                                    style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              )),
                          SizedBox(height: 30),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MapsSlidingUp(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                shape: StadiumBorder(),
                                primary: Colors.blueAccent,
                                padding: const EdgeInsets.all(15),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add_alert_outlined,
                                    color: Colors.red,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "Envoyer Alertes",
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              )),
                          SizedBox(height: 30),
                        ],
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
