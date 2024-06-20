// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:valorex/Guns/gunClass.dart';
import 'package:valorex/Guns/guns.dart';
import 'package:valorex/Guns/tacticalKnife.dart';

class WeaponListCard extends StatelessWidget {
  const WeaponListCard({
    Key? key,
    required this.gunData,
  }) : super(key: key);

  final gunProfile gunData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return gunData.uuid == "2f59173c-4bed-b6c3-2191-dea9b58be9c7"
                    ? TacticalKnife()
                    : GunsScreen(body: gunData);
              },
            ),
          );
        },
        child: Card(
          color: Color.fromRGBO(255, 82, 82, 0.8),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                  margin: EdgeInsets.all(10.0),
                  height: 110,
                  child: Image(
                    image: NetworkImage(gunData.displayIcon),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        gunData.displayName,
                        style: TextStyle(
                          fontSize: 28,
                          color: Color(0xFF0f1923),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Valorant1',
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        gunData.category.split('::')[1],
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontFamily: 'Valorant1',
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
