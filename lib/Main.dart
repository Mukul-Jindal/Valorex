import 'package:flutter/material.dart';
import 'package:valorex/Agents/agentList.dart';
import 'package:valorex/Maps/entryPoint.dart';
import 'package:valorex/HomePage/HomePage.dart';
import 'package:valorex/LoadingScreen/loadingscreen.dart';
import 'package:valorex/Guns/gunsList.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/loadingscreen',
      routes: {
        '/loadingscreen': (context) => Loading(),
        '/homescreen': (context) => HomePage(),
        '/agents': (context) => Agents(),
        '/mapshomescreen': (context) => MapsList(),
        '/gunshomescreen': (context) => ListViewHomePage(),
      },
      debugShowCheckedModeBanner: false,
    ),
  );
}
