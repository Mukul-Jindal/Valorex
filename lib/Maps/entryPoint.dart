import 'package:flutter/material.dart';
import 'package:valorex/Maps/mapDetailClass.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:valorex/Maps/specificMapDetail.dart';

Future<List<MapDetails>> getMaps() async {
  var url = Uri.parse('https://valorant-api.com/v1/maps');
  var response = await http.get(url);
  var body = jsonDecode(response.body);
  body = body['data'];

  List<MapDetails> data;
  data = <MapDetails>[];

  body.forEach((e) => {data.add(new MapDetails.fromJson(e))});
  return data;
}

class MapsList extends StatefulWidget {
  const MapsList({super.key});

  @override
  State<MapsList> createState() => _MapsListState();
}

class _MapsListState extends State<MapsList> {
  late Future<List<MapDetails>> maps;

  @override
  void initState() {
    maps = getMaps();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF0f1923),
        appBar: AppBar(
          title: new Container(
            height: 70,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "MAPS",
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
        body: FutureBuilder<List<MapDetails>>(
          future: maps,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasData) {
              final maps = snapshot.data!;
              return MapsListValue(maps: maps);
            } else {
              return const Text("No data available");
            }
          },
        ),
      ),
    );
  }
}

class MapsListValue extends StatefulWidget {
  const MapsListValue({super.key, required this.maps});
  final List<MapDetails> maps;
  @override
  State<MapsListValue> createState() => _MapsListValueState();
}

class _MapsListValueState extends State<MapsListValue> {
  @override
  Widget build(BuildContext context) {
    List<MapDetails> maps = widget.maps;
    return ListView.separated(
      itemCount: maps.length,
      separatorBuilder: (context, index) {
        return SizedBox(
          height: 15,
        );
      },
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () => {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => specificMapDetail(map: maps[index]),
            ))
          },
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(maps[index].listViewIcon!),
                  ),
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    maps[index].displayName!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Valorant1'),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
