import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Fracture(),
      debugShowCheckedModeBanner: false,
    ));

class Fracture extends StatelessWidget {
  const Fracture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0f1923),
      body: SafeArea(
        child: ListView(
          children: [
            Image(
              image: NetworkImage(
                  'https://images.contentstack.io/v3/assets/bltb6530b271fddd0b1/blt1a720126e3713bba/6131bf518e16ab655b34901a/Fracture_Screenshot-8.jpg?auto=webp&width=915'),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Text(
                'fracture',
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Color(0xFFfc5b65),
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Valorant1'),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Text(
                'A top secret research facility split apart by a failed '
                'radianite experiment. With defender options as '
                'divided as the map, the choice is yours: meet the '
                'attackers on their own tuff or batten down the '
                'hatches to weather the assault.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  letterSpacing: 1.5,
                  fontFamily: "Valorant3",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Image(
              image: NetworkImage(
                  'https://images.contentstack.io/v3/assets/bltb6530b271fddd0b1/blt6145fdc7dffa2f5f/6131c5e985514a6ee3fac889/Fracture_Map_Website_Asset.jpg?auto=webp&width=515'),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: new Container(
          height: 70,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "FRACTURE",
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
    );
  }
}
