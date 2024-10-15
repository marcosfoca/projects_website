import 'package:flutter/material.dart';
import 'package:marcos_portfolio/resources/colors.dart';
import 'dart:html' as html;

class ContactDialogBox extends StatefulWidget {
  const ContactDialogBox({super.key});

  @override
  State<ContactDialogBox> createState() => _ContactDialogBoxState();
}

class _ContactDialogBoxState extends State<ContactDialogBox> {

  Future<void> _requestContact() async {
    final String link = 'https://www.linkedin.com/in/marcos-fortis-6ab841284/';
    html.AnchorElement anchor = html.AnchorElement(href: link);
    anchor.click();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: defaultLightBlue,
      title: Center(
        child: Text(
          'Contact me!',
          style: TextStyle(
            color: defaultDarkBlue,
            fontFamily: 'BebasNeue',
            fontSize: 43
          ),
        ),
      ),
      contentPadding: EdgeInsets.all(24),
      content: SizedBox(
        height: 200,
        width: 350,
        child: Wrap(
          children: [
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Color(0xff0077b5)),
                foregroundColor: MaterialStateProperty.all<Color>(defaultLightBlue),
              ),
              onPressed: () async {await _requestContact();},
              child: Text("LinkedIn Profile", style: TextStyle(fontFamily: 'BebasNeue', fontSize: 17),),
            ),
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Color(0xff0077b5)),
                foregroundColor: MaterialStateProperty.all<Color>(defaultLightBlue),
              ),
              onPressed: () async {await _requestContact();},
              child: Text("Instagram Profile", style: TextStyle(fontFamily: 'BebasNeue', fontSize: 17),),
            )
          ],
        ),
      ),
    );
  }
}