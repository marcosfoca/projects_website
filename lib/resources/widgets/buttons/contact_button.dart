import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:marcos_portfolio/resources/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactButton extends StatelessWidget {
  const ContactButton({super.key});

  _requestContact() async {
    final email = "theneymarofsoftware@gmail.com";
    final subject = Uri.encodeComponent("Contact request (from portfolio website)");

    // Create a mailto Uri
    final emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
      query: 'subject=$subject',
    );

    // Check if the platform is web or mobile/desktop
    if (kIsWeb) {
      // On web, use an anchor element for better reliability
      final mailtoLink = emailLaunchUri.toString();
      launch(mailtoLink); // Launch works for web-based links
    } else {
      // Handle for non-web platforms
      if (await canLaunch(emailLaunchUri.toString())) {
        await launch(emailLaunchUri.toString());
      } else {
        print("error abriendo link");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(defaultRed),
        foregroundColor: MaterialStateProperty.all<Color>(defaultLightBlue),
      ),
      onPressed: () async {
        await _requestContact();
      },
      child: Row(
        children: [
          const Icon(Icons.account_circle),
          SizedBox(width: 10),
          const Text("Contact me", style: TextStyle(fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }
}
