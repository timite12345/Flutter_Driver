// ignore_for_file: unused_import, unused_local_variable

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

void updateheureDebut(id, heureDebut) async {
  final response = await http.put(
      Uri.parse('http://192.168.59.171:8000/api/updateheurefin/$id'),
      headers: <String, String>{
        'content-type': 'application/json',
        'accept': 'application/json',
        'Authorization': 'Bearer '
      },
      body: jsonEncode(<String, String>{
        'heureDebut': heureDebut,
      }));
}
