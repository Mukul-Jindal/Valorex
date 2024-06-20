import 'package:flutter/material.dart';
import 'package:valorex/Agents/agentTemplate.dart';
import 'package:valorex/Agents/agentNameClass.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<agentsListDetails>> getAgents() async {
  var url =
      Uri.parse("https://valorant-api.com/v1/agents?isPlayableCharacter=true");
  var response = await http.get(url);
  var body = jsonDecode(response.body);
  body = body['data'];
  List<agentsListDetails>? data;
  data = <agentsListDetails>[];
  body.forEach((e) => {
    data!.add(new agentsListDetails.fromJson(e))
  });
  return data;
}

class Agents extends StatefulWidget {
  const Agents({Key? key}) : super(key: key);

  @override
  State<Agents> createState() => _HomeState();
}

class _HomeState extends State<Agents> {
  late Future<List<agentsListDetails>> agents;

  @override
  void initState() {
    // TODO: implement initState
    agents = getAgents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF172535),
        appBar: AppBar(
          title: Container(
            height: 70,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "AGENTS",
                  style: TextStyle(
                    fontFamily: 'Valorant1',
                    fontSize: 50,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          flexibleSpace: Image(
            image: AssetImage('assets/background/background.jpg'),
            fit: BoxFit.cover,
          ),
          centerTitle: true,
          backgroundColor: Color(0xFF0f1923),
          toolbarHeight: 80,
        ),
        body: FutureBuilder<List<agentsListDetails>>(
          future: agents,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasData) {
              final agents = snapshot.data!;
              return characterTemplate(agents);
            } else {
              return const Text("No data available");
            }
          },
        ),
      ),
    );
  }
}
