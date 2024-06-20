// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:valorex/Agents/agentNameClass.dart';

// void main() => runApp(MaterialApp(
//       home: AgentInfo(),
//       debugShowCheckedModeBanner: false,
//     ));

class AgentInfo extends StatefulWidget {
  final agentsListDetails agent;

  AgentInfo({
    Key? key,
    required this.agent,
  }) : super(key: key);

  @override
  State<AgentInfo> createState() => _characterState();
}

class _characterState extends State<AgentInfo> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    agentsListDetails agent = widget.agent;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF0f1923),
        appBar: AppBar(
          title: Container(
            height: 70,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 17.5, 0, 17.5),
              child: Text(
                agent.displayName!,
                style: TextStyle(
                  fontFamily: 'Valorant1',
                  fontSize: 35,
                  color: Colors.white,
                ),
              ),
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
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              margin: EdgeInsets.all(7),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              width: MediaQuery.of(context).size.width,
              child: Image(
                image: NetworkImage(agent.fullPortrait!),
                fit: BoxFit.cover,
              ),
              height: 250,
            ),
            SizedBox(height: 5),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: Colors.black54,
              ),
              padding: EdgeInsets.all(7),
              margin: EdgeInsets.all(7),
              child: Center(
                child: Text(
                  agent.description!,
                  overflow: TextOverflow.visible,
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: "Valorant3",
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            abilityListElement(agentAbility: agent.abilities![0]),
            abilityListElement(agentAbility: agent.abilities![1]),
            abilityListElement(agentAbility: agent.abilities![2]),
            abilityListElement(agentAbility: agent.abilities![3]),
          ]),
        ),
      ),
    );
  }
}

class abilityListElement extends StatelessWidget {
  const abilityListElement({
    super.key,
    required this.agentAbility,
  });

  final agentsAbilities agentAbility;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.redAccent,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.all(5),
              width: (MediaQuery.of(context).size.width * 0.20),
              child: Image(
                matchTextDirection: true,
                image: NetworkImage(
                    agentAbility.displayIcon!),
                fit: BoxFit.cover,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black54,
              ),
              padding: EdgeInsets.all(7),
              margin: EdgeInsets.all(5),
              width:
                  (MediaQuery.of(context).size.width) * 0.70,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      agentAbility.displayName!.toUpperCase(),
                      style: TextStyle(
                        fontFamily: 'Valorant2',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      )),
                  Text(
                    agentAbility.description!,
                    style: TextStyle(
                      fontFamily: 'Valorant3',
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.visible,
                    softWrap: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
