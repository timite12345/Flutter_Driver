// ignore_for_file: sort_child_properties_last, prefer_const_constructors, avoid_unnecessary_containers

import 'package:driver_app/API/getAllMission.dart';
import 'package:driver_app/MissionListes.dart';
import 'package:flutter/material.dart';

class MissionListes1 extends StatefulWidget {
  final id;
  const MissionListes1({super.key, this.id});

  @override
  State<MissionListes1> createState() => _MissionListes1State();
}

class _MissionListes1State extends State<MissionListes1> {
  void initState() {
    super.initState();
    widget.id;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Missions'),
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
                              builder: (context) =>
                                  FirstScreen(id1: widget.id, widget.id),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Card(
                              child: Padding(
                                padding: EdgeInsets.all(25),
                                child: Container(
                                  child: Row(
                                    children: [
                                      Text(
                                        'Nom Hopital:',
                                        style: TextStyle(
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 120,
                                      ),
                                      Text(
                                        users[index].nom,
                                        style: TextStyle(
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              elevation: 10,
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
