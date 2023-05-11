// ignore_for_file: prefer_const_constructors, unused_field, prefer_final_fields

import 'package:driver_app/GpsPage.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:driver_app/PanelWidget.dart';

class MapsSlidingUp extends StatefulWidget {
  const MapsSlidingUp({super.key});

  @override
  State<MapsSlidingUp> createState() => _MapsSlidingUpState();
}

class _MapsSlidingUpState extends State<MapsSlidingUp> {
  final panelController = PanelController();
  final double _initFabHeight = 120.0;
  double _fabHeight = 0;
  double _panelHeightOpen = 0;
  double _panelHeightClosed = 95.0;

  @override
  Widget build(BuildContext context) {
    _panelHeightOpen = MediaQuery.of(context).size.height * 0.8;
    _panelHeightClosed = MediaQuery.of(context).size.height * 0.2;
    return Scaffold(
      body: SlidingUpPanel(
        controller: panelController,
        maxHeight: _panelHeightOpen,
        minHeight: _panelHeightClosed,
        parallaxEnabled: true,
        parallaxOffset: .5,
        body: Home(),
        panelBuilder: (controller) => PanelWidget(
          controller: controller,
          panelController: panelController,
          id: '',
        ),
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
    );
  }
}
