// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:cached_network_image/cached_network_image.dart';
import 'package:driver_app/API/getAllHopital.dart';
import 'package:driver_app/API/putHeureFin.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class PanelWidget extends StatefulWidget {
  final ScrollController controller;
  final PanelController panelController;
  final String id;
  const PanelWidget({
    Key? key,
    required this.controller,
    required this.panelController,
    required this.id,
  }) : super(key: key);
  Widget build(BuildContext context) => ListView(
        padding: EdgeInsets.zero,
        controller: controller,
        children: [
          SizedBox(
            height: 12,
          ),
        ],
      );
  @override
  State<PanelWidget> createState() => _PanelWidgetState();
}

class _PanelWidgetState extends State<PanelWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: FutureBuilder<List<Hopital>>(
          future: getAllHopital(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Hopital> users = snapshot.data as List<Hopital>;
              return ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    return Container(
                      //margin: EdgeInsets.all(8),
                      //padding: EdgeInsets.all(10),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // SizedBox(
                          //   height: 5,
                          // ),
                          buildDragHandle(), //le bouton pour scroller le slidebar
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              _button("Popular", Icons.favorite, Colors.blue),
                              _button("Events", Icons.event, Colors.amber),
                              _button("More", Icons.more_horiz, Colors.green),
                            ],
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Container(
                            padding:
                                const EdgeInsets.only(left: 24.0, right: 24.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Images",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    )),
                                SizedBox(
                                  height: 12.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl:
                                          "https://www.linfodrome.com/media//article/images/src/60917-53b7854f9ace90bac3b41e115847d38e.webp",
                                      height:
                                          120.0, //agrandir images de façon verticale
                                      width: 270,

                                      fit: BoxFit.cover,
                                    ),
                                    //  Container(

                                    //  ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Center(
                            child: Text(
                              'Infos Hopital',
                              style: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.amber),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            child: Row(
                              children: [
                                Text(
                                  'Nom Hopital :',
                                  style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  width: 80,
                                ),
                                Text(
                                  users[index].nom,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Row(
                              children: [
                                Text(
                                  'Adresse Hopital :',
                                  style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  width: 80,
                                ),
                                Text(
                                  users[index].adresse,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Container(
                            child: Row(
                              children: [
                                Text(
                                  'Type  :',
                                  style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  width: 190,
                                ),
                                Text(
                                  users[index].type,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Container(
                            child: Row(
                              children: [
                                Text(
                                  'Téléphone  :',
                                  style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Text(
                                  users[index].tel,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Container(
                            child: Row(
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green),
                                  child: Text(
                                    'Fin        ',
                                    style: TextStyle(
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.black),
                                  ),
                                  onPressed: () {
                                    var hd = DateTime.now().toString();
                                    updateheureFin(widget.id, hd);
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //       builder: (context) =>
                                    //           DetailsMission(),
                                    //     ));
                                  },
                                ),
                                SizedBox(
                                  width: 120,
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                  ),
                                  child: Text(
                                    'Annuler ',
                                    style: TextStyle(
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.black),
                                  ),
                                  onPressed: () {},
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                        ],
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
          }),
    );
  }

//le bouton qui permet de scroller le slideupPanel
  buildDragHandle() => GestureDetector(
        child: Center(
          child: Container(
            width: 30, //permet de changer de position du titre du slide
            height: 5, // permet de le grossir ou rendre petit
            decoration: BoxDecoration(
                //le bouton pour scroller le slideupPanel
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(12)),
          ),
        ),
        onTap: () {},
      );
}

Widget _button(String label, IconData icon, Color color) {
  return Column(
    children: <Widget>[
      Container(
        padding: const EdgeInsets.all(16.0),
        child: Icon(
          icon,
          color: Colors.white,
        ),
        decoration:
            BoxDecoration(color: color, shape: BoxShape.circle, boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.15),
            blurRadius: 8.0,
          )
        ]),
      ),
      SizedBox(
        height: 12.0,
      ),
      Text(label),
    ],
  );
}
