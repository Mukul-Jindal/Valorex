// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class StatsCard extends StatelessWidget {
  const StatsCard({
    Key? key,
    required this.heading,
    required this.value,
    required this.units,
    required this.margin,
  }) : super(key: key);

  final dynamic heading, value, units;
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: margin,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white24,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white30,
                ),
                child: Center(
                  child: Text(
                    heading.toUpperCase(),
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: "Valorant2",
                      color: Colors.white70,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Text(
                value.toString(),
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: "Valorant2",
                  color: Colors.white70,
                ),
              ),
            ),
            Expanded(
              child: Text(
                units.toUpperCase(),
                style: TextStyle(
                  color: Colors.white30,
                  fontFamily: "Valorant2",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
