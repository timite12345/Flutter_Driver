// ignore_for_file: avoid_unnecessary_containers, sort_child_properties_last, prefer_const_constructors, avoid_print, prefer_typing_uninitialized_variables, annotate_overrides

import 'package:driver_app/API/getAllChauffeurs.dart';
import 'package:driver_app/ChauffeurListes.dart';
import 'package:flutter/material.dart';

class ChauffeurListes1 extends StatefulWidget {
  final id;
  const ChauffeurListes1({
    super.key,
    this.id,
  });

  @override
  State<ChauffeurListes1> createState() => _ChauffeurListes1State();
}

class _ChauffeurListes1State extends State<ChauffeurListes1> {
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
          'Listes Chauffeurs',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 23,
          ),
        ),
      ),
      body: Container(
        color: Colors.grey,
        padding: const EdgeInsets.all(8),
        child: FutureBuilder<List<Chauffeur>>(
          future: getAllChauffeurs(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Chauffeur> users = snapshot.data as List<Chauffeur>;
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
                                          width: 15,
                                        ),
                                        Text(
                                          'Nom Chauffeur:',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 23,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 15,
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
