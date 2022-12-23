
import 'package:flutter/material.dart';
import 'package:landing_page/screens/connector_patient_screen.dart';
import 'package:landing_page/screens/contacts_screen.dart';
import 'package:landing_page/screens/documentation_screen.dart';
import 'package:landing_page/screens/home_screen.dart';
import 'package:landing_page/screens/upload_screen.dart';





class StartScreen extends StatefulWidget {
  const StartScreen({super.key});


  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {


  // we define one of the CTA screen

  Widget currentScreen= const HomeScreen();


  Map<String, Widget> currentPage = {
    "home": const HomeScreen(),
    "upload" :const UploadScreen(),
    "documentation": const DocumentationScreen(),
    "contacts" :const ContactScreen(),
    "sharing": const ConnectorPatient(),
  };



  // Defining the initial colors of CTA icons

  Map<String, Color> iconColor = {
    "home": Colors.white,
   "upload" :Colors.black,
   "documentation": Colors.black,
   "contacts" :Colors.black,
    "sharing": Colors.black,
  };

  // Defining the initial selection Color

  Map<String, Color> onPressColor = {
    "home": const Color(0xff0057B7),
    "upload" :Colors.transparent,
    "documentation": Colors.transparent,
    "contacts" :Colors.transparent,
    "sharing": Colors.transparent,
  };




  Color colorOfHome= Colors.white;
  Color colorOfUpload= Colors.black;
  Color colorOfDocumentation= Colors.black;
  Color colorOfContacts= Colors.black;

  // color when the icon is pressed


  Color disableColor= Colors.transparent;

  @override

  Widget build(BuildContext context) {
    double viewWidth = MediaQuery.of(context).size.width;
    double viewHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xffE2EDFD),
      body: Stack(
        children: [
          //currentScreen,
          currentScreen,
          Align(
            alignment: Alignment.bottomCenter,
            child: Material(
              elevation: 15,
              color: Colors.transparent,
              child: Container(
                height: 0.08*viewHeight,
                decoration:  const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      // reusableIcon(viewWidth: viewWidth, onPressColor, colorOfHome),
                      reusableIcon(A: "home", B: "upload", C: "documentation", D: "contacts", E:"sharing",viewWidth: viewWidth, icon: Icons.home),
                      reusableIcon(A: "upload", B: "home", C: "documentation", D: "contacts", E:"sharing",viewWidth: viewWidth, icon: Icons.file_upload),
                      reusableIcon(A: "documentation", B: "home", C: "upload", D: "contacts", E:"sharing",viewWidth: viewWidth, icon: Icons.menu_book_outlined),
                      reusableIcon(A: "contacts", B: "home", C: "upload", D: "documentation", E:"sharing",viewWidth: viewWidth, icon: Icons.contacts_outlined),
                      reusableIcon(A: "sharing", B: "home", C: "upload", D: "documentation", E:"contacts",viewWidth: viewWidth, icon: Icons.share),

                    ],

                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }

  // the method for refactoring CTA icons

  ClipRRect reusableIcon({ required String A, required String B, required String C, required String D, required String E, required double  viewWidth, required IconData icon}) {
    return ClipRRect(
                      borderRadius: BorderRadius.circular(viewWidth*0.05),
                      child: Container(
                        height: viewWidth*0.12,
                        width: viewWidth*0.18,
                        color:onPressColor[A],
                        child: IconButton(
                          icon:  Icon(icon,
                            color: iconColor[A],
                            size: viewWidth*0.06,),
                          onPressed: () {
                            setState(
                                  () {

                        // rebuilding Selection Color
                                onPressColor[A]= const Color(0xff0057B7);
                                onPressColor[B]= Colors.transparent;
                                onPressColor[C]= Colors.transparent;
                                onPressColor[D]= Colors.transparent;
                                onPressColor[E]= Colors.transparent;


                        // rebuilding Colors of Icons
                                iconColor[A]= Colors.white;
                                iconColor[B]= Colors.black;
                                iconColor[C]= Colors.black;
                                iconColor[D]= Colors.black;
                                iconColor[E]= Colors.black;


                          // Choosing the current screen
                               currentScreen = currentPage[A]!;

                                  },
                            );
                          },
                        ),
                      ),
                    );
  }
}
