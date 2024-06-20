// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:valorex/Guns/gunClass.dart';
import 'weaponListCard.dart';
import 'package:http/http.dart' as http;

Future<List<gunProfile>> getGunList() async {
  var url = Uri.parse('https://valorant-api.com/v1/weapons');
  var response = await http.get(url);
  var body = jsonDecode(response.body);
  body = body['data'];
  List<gunProfile> data = [];
  body.forEach((e) {
    data.add(new gunProfile.fromJson(e));
  });
  return data;
}

class ListViewHomePage extends StatefulWidget {
  const ListViewHomePage({Key? key}) : super(key: key);

  @override
  State<ListViewHomePage> createState() => _ListViewHomePageState();
}

class _ListViewHomePageState extends State<ListViewHomePage> {
  late Future<List<gunProfile>> gunData;
  @override
  void initState() {
    gunData = getGunList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width * 0.6;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF172535),
        appBar: AppBar(
          title: new Container(
            height: 70,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "GUNS",
                    style: TextStyle(
                      fontFamily: 'Valorant1',
                      fontSize: 50,
                      color: Colors.white,
                    ),
                  )
                ]),
          ),
          flexibleSpace: Image(
            image: AssetImage('assets/background/background.jpg'),
            fit: BoxFit.cover,
          ),
          centerTitle: true,
          backgroundColor: Color(0xFF0f1923),
          toolbarHeight: 80,
        ),
        body: FutureBuilder<List<gunProfile>>(
          future: gunData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasData) {
              final gunData = snapshot.data!;
              return ListView.builder(
                itemCount: gunData.length,
                itemBuilder: (context, index) {
                  return WeaponListCard(
                    gunData: gunData[index],
                  );
                },
              );
            } else {
              return const Text("No data available");
            }
          },
        ),
      ),
    );
  }
}
