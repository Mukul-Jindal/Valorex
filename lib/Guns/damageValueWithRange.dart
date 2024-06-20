import 'package:flutter/material.dart';
import 'package:valorex/Guns/gunClass.dart';

class DamageValueWithRange extends StatelessWidget {
  const DamageValueWithRange({
    Key? key,
    required this.margin,
    required this.bodyPart,
    required this.data,
    required this.index,
  }) : super(key: key);

  final EdgeInsetsGeometry margin;
  final String bodyPart;
  final gunProfile data;
  final int index; //0 : head, 1: body, 2:leg

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white30),
      margin: margin,
      child: Row(
        children: <Widget>[
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    bodyPart.toUpperCase(),
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Valorant2",
                        fontSize: 20),
                  ),
                ),
              ),
            ] +
            data.weaponStats!.damageRanges!
                .map<Widget>(
                  (index) => Expanded(
                    child: Text(
                      index == 0
                          ? index.headDamage!.round().toString()
                          : index == 1
                              ? index.bodyDamage!.round().toString()
                              : index.legDamage!.round().toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Valorant2",
                          fontSize: 20),
                    ),
                  ),
                )
                .toList(),
      ),
    );
  }
}
