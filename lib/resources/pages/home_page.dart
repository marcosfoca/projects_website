import 'dart:async';
import 'package:flutter/material.dart';
import '../colors.dart';
import '../widgets/app_drawer.dart';
import '../widgets/buttons/contact_button.dart';
import '../widgets/contact_dialog_box.dart';
import 'dart:html' as html;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;
  bool _autoScroll = true;
  int _selectedAppIndex = 0; // To keep track of the selected app for the detail view

  @override
  void initState() {
    super.initState();

    // Ensure the auto-scroll starts after the first frame has been rendered
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(seconds: 2), () {
        if (mounted) {
          _startAutoScroll();
        }
      });
    });
  }

  void _startAutoScroll() {
    Timer.periodic(Duration(milliseconds: 100), (timer) {
      if (_scrollController.hasClients && _autoScroll) {
        _scrollPosition += 1;
        _scrollController.animateTo(
          _scrollPosition,
          duration: Duration(milliseconds: 100),
          curve: Curves.linear,
        );

        // Reset position when reaching the end
        if (_scrollPosition >= _scrollController.position.maxScrollExtent) {
          _scrollPosition = 0;
        }
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void contactButton() {
    showDialog(context: context, builder: (context) => const ContactDialogBox());
  }

  Widget presentationBlock() {
    return Row(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: defaultDarkBlue, width: 5), // Border color and width
                  borderRadius: BorderRadius.circular(20), // Rounded corners
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15), // Match with border radius
                  child: Image.asset(
                    "lib/resources/assets/photo_of_me.png",
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 100.0, horizontal: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // NAME
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Creative ',
                            style: TextStyle(
                              fontFamily: 'Lobster',
                              fontWeight: FontWeight.w900,
                              color: defaultRed,
                              fontSize: 60,
                            ),
                          ),
                          TextSpan(
                            text: 'thinking, ',
                            style: TextStyle(
                              color: defaultDarkBlue,
                              fontSize: 52,
                            ),
                          ),
                          TextSpan(
                            text: 'practical ',
                            style: TextStyle(
                              fontFamily: 'BebasNeue',
                              fontWeight: FontWeight.w900,
                              color: defaultBlack,
                              fontSize: 60,
                            ),
                          ),
                          TextSpan(
                            text: 'outcomes.',
                            style: TextStyle(
                              color: defaultDarkBlue,
                              fontSize: 52,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Marcos Fortis: Self-taught Software Developer",
                      style: TextStyle(
                        fontFamily: 'BebasNeue',
                        color: defaultBlack,
                        fontWeight: FontWeight.w900,
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(height: 10),
                    // DESCRIPCION
                    Text(
                      "In life, there are thinkers and executers. I have already been both, since i decided to develop my first app at the age of 18. I learned app development and launched ReMind, my first app, in less than a year, while balancing studies and work. Now, I can assist you with with the creation of apps and websites, recognizing what you feel as a thinker, and knowing what you want me to execute.",
                      style: TextStyle(
                        color: defaultBlack,
                        fontSize: 21,
                      ),
                    ),
                    SizedBox(height: 20,),
                    TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(defaultRed),
                        foregroundColor: MaterialStateProperty.all<Color>(defaultLightBlue),
                      ),
                      onPressed: ()  {
                        contactButton();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.account_circle, size: 40),
                            SizedBox(width: 13),
                            FittedBox(child: Text("contact this guy", style: TextStyle(fontSize: 30, fontFamily: 'BebasNeue'),)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
          ),
        ]
    );
  }

  List<String> appNames = [
    "ReMind",
    "Hablo"
  ];

  List<String> appDescriptions = [
    "My first project, done by me alone. ReMind implements a Progressive Overload Algorithm to easily add new Habits to your routine withe the help of AI.",
    "Bla Bla Bla",
  ];

  List<String> appDownloadLink = [
    "https://play.google.com/store/apps/details?id=com.theneymarofsoftware.remind",
    "examplelink",
  ];

  List<String> appIconSource = [
    "lib/resources/assets/remind_icon.png",
    "lib/resources/assets/remind_icon.png",
  ];

  List<String> appPageRoutes = [
    "/remindpage",
    "/examplepage",
  ];

  Widget appCards() {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        controller: _scrollController,
        itemCount: appNames.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedAppIndex = index;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20), // Rounded corners for the card
                child: Container(
                  color: _selectedAppIndex == index ? defaultBlack : defaultBlue,
                  width: 150,
                  height: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipOval( // Make the image circular
                        child: Image.asset(
                          appIconSource[index],
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover, // Ensure the image fits well inside the circular shape
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        appNames[index],
                        style: TextStyle(
                          fontSize: 27,
                          fontFamily: "BebasNeue",
                          color: _selectedAppIndex == index ? defaultLightBlue : defaultBlack,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }


  // The app details section
  Widget appDetails() {
    return Container(
      width: 800,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: defaultBlue, width: 3),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            appNames[_selectedAppIndex],
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, fontFamily: "Lobster", color: defaultRed),
          ),
          SizedBox(height: 10),
          Text(
            appDescriptions[_selectedAppIndex],
            style: TextStyle(fontSize: 21, color: defaultBlack),
          ),
          SizedBox(height: 20),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, appPageRoutes[_selectedAppIndex]);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: defaultDarkBlue,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "see more",
                        style: TextStyle(fontSize: 25, color: defaultLightBlue, fontFamily: 'BebasNeue'),
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  html.window.open(appDownloadLink[_selectedAppIndex], '_blank');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: defaultBlue,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.launch_outlined, color: defaultLightBlue),
                      SizedBox(width: 10),
                      Text(
                        "link to play store",
                        style: TextStyle(fontSize: 25, color: defaultLightBlue, fontFamily: 'BebasNeue'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultBlue,
      appBar: AppBar(
        foregroundColor: defaultLightBlue,
        backgroundColor: defaultDarkBlue,
        title: Center(child: Text("Marcos Fortis", style: TextStyle(fontSize: 30, fontFamily: 'Lobster'))),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: ContactButton(),
          ),
        ],
      ),
      drawer: AppDrawer(color1: defaultDarkBlue, color2: defaultLightBlue),
      body: ListView(
          shrinkWrap: true,
          children: [
            presentationBlock(),
            Container(
              color: defaultLightBlue,
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0, top: 30.0),
                child: Column(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Some of my ',
                            style: TextStyle(
                              fontFamily: 'Lobster',
                              fontWeight: FontWeight.w900,
                              color: defaultDarkBlue,
                              fontSize: 60,
                            ),
                          ),
                          TextSpan(
                            text: 'projects',
                            style: TextStyle(
                              fontFamily: 'BebasNeue',
                              fontWeight: FontWeight.w900,
                              color: defaultRed,
                              fontSize: 60,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 50),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Scrollable view with titles and images from appNames and appIconSource
                        appCards(),
                        SizedBox(height: 50),
                        // Widget showing app details
                        appDetails(),
                        SizedBox(height: 50),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ]
      ),
    );
  }
}
