import 'package:flutter/material.dart';
import 'package:valorex/Maps/mapDetailClass.dart';

class specificMapDetail extends StatelessWidget {
  specificMapDetail({super.key, required this.map});

  final MapDetails map;
  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      backgroundColor: Color(0xFF0f1923),
      appBar: AppBar(
        title: new Container(
          height: 70,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  map.displayName!.toUpperCase(),
                  style: TextStyle(
                    fontFamily: 'Valorant1',
                    fontSize: 45,
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
      body: SafeArea(
        child: ListView(
          children: [
            Image(
              image: NetworkImage(map.splash!),
            ),
            // Container(
            //   margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
            //   child: Text(
            //     map.displayName!.toUpperCase(),
            //     textAlign: TextAlign.start,
            //     style: TextStyle(
            //         color: Color(0xFFfc5b65),
            //         fontSize: 35,
            //         fontWeight: FontWeight.bold,
            //         fontFamily: 'Valorant1'),
            //   ),
            // ),
            // Container(
            //   padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
            //   child: Text(
            //     map.,
            //     style: TextStyle(
            //       color: Colors.white,
            //       fontSize: 15,
            //       letterSpacing: 1.5,
            //       fontFamily: "Valorant3",
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            Image(
              image: NetworkImage(map.displayIcon!),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
