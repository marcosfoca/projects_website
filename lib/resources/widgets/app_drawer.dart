import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  Color color1, color2;
  AppDrawer({super.key, required this.color1, required this.color2});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: color1,
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: ListView(
          shrinkWrap: true,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/homepage');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.person_rounded, size: 35, color: color2),
                  SizedBox(width: 20),
                  FittedBox(child: Text("marcos fortis (me)", style: TextStyle(color: color2, fontFamily: 'BebasNeue', fontSize: 20),)),
                ],
              ),
            ),
            SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/remindpage');
              },
              child: Row(
                children: [
                  SizedBox(
                    height: 35,
                    width: 35,
                    child: ClipOval(
                      child: Image.asset("lib/resources/assets/remind_icon.png"),
                    ),
                  ),
                  SizedBox(width: 20),
                  Text("ReMind", style: TextStyle(color: color2,  fontFamily: 'BebasNeue', fontSize: 20),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
