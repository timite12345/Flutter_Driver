// ignore_for_file: sort_child_properties_last, prefer_const_constructors, avoid_unnecessary_containers

import 'package:driver_app/API/getAllMission.dart';
import 'package:driver_app/MissionListes.dart';
import 'package:flutter/material.dart';

class MissionListes1 extends StatefulWidget {
//  final id;
  const MissionListes1({
    super.key,
  });

  @override
  State<MissionListes1> createState() => _MissionListes1State();
}

class _MissionListes1State extends State<MissionListes1> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.lightBlue.shade900,
        elevation: 0,
        title: const Text(
          'Missions',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 23,
          ),
        ),
      ),
      body: Container(
        color: Colors.grey,
        padding: const EdgeInsets.all(8),
        child: FutureBuilder<List<Mission>>(
          future: getAllMission(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Mission> users = snapshot.data as List<Mission>;
              return ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FirstScreen(
                                id1: users[index].id,
                              ),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: Card(
                                color: Colors.lightBlue.shade900,
                                shape: StadiumBorder(),
                                child: Padding(
                                  padding: EdgeInsets.all(15),
                                  child: Container(
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 75,
                                        ),
                                        Text(
                                          'Transport ',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 23,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          users[index].id,
                                          style: TextStyle(
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 23,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                elevation: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            }
            if (snapshot.hasError) {
              // ignore: avoid_print
              print(snapshot.error.toString());
              return const Text('error');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
