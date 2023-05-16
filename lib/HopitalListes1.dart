// ignore_for_file: avoid_unnecessary_containers, sort_child_properties_last, prefer_const_constructors

import 'package:driver_app/API/getAllHopital.dart';
import 'package:driver_app/HopitalListes.dart';
import 'package:flutter/material.dart';

class HopitalListes1 extends StatefulWidget {
  final id;
  const HopitalListes1({
    super.key,
    this.id,
  });

  @override
  State<HopitalListes1> createState() => _HopitalListes1State();
}

class _HopitalListes1State extends State<HopitalListes1> {
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
          'Listes Hopitaux',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 23,
          ),
        ),
      ),
      body: Container(
        color: Colors.grey,
        padding: const EdgeInsets.all(8),
        child: FutureBuilder<List<Hopital>>(
          future: getAllHopital(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Hopital> users = snapshot.data as List<Hopital>;
              return ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HopitalListe(
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
                                        // SizedBox(
                                        //   width: 5,
                                        // ),
                                        Text(
                                          'Nom Hopital:',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 23,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          users[index].nom,
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
