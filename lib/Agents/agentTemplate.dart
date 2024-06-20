import 'package:flutter/material.dart';
import 'package:valorex/Agents/agentNameClass.dart';
import 'package:valorex/Agents/specificAgentInfo.dart';

Widget characterTemplate(List<agentsListDetails> agents) {
  return GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 4.0,
      mainAxisSpacing: 4.0,
    ),
    cacheExtent: 9999,
    itemCount: agents.length,
    itemBuilder: (BuildContext context, int index) {
      return InkWell(
        onTap: () => {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AgentInfo(agent: agents[index]),
            ),
          ),
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background/background.jpg'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
          height: 225,
          width: 175,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image(
                image: NetworkImage(
                  agents[index].fullPortrait!,
                ),
                fit: BoxFit.scaleDown,
                filterQuality: FilterQuality.low,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    agents[index].displayName!,
                    style: TextStyle(
                      fontFamily: "Valorant1",
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}
