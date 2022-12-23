import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';






class QrScreen extends StatefulWidget {
  const QrScreen({super.key});

  @override
  State<QrScreen> createState() => _QrScreenState();
}

class _QrScreenState extends State<QrScreen> {

  @override
  void initState() {

    getExpirationDate().then(_updateExpirationDate);


    // TODO: implement initState
    super.initState();
  }


  void _updateExpirationDate(DateTime expirationDate) {
    setState(() {
      newExpirationDate= expirationDate;

      // for the expiration date message
      Future.delayed(Duration.zero, () {
        showGeneralDialog(
          context: context,
          pageBuilder: (ctx, a1, a2) {
            return Container();
          },
          transitionBuilder: (ctx, a1, a2, child) {
            var curve = Curves.easeInOut.transform(a1.value);
            return Transform.scale(
              scale: curve,
              child: _dialog(ctx),
            );
          },
          transitionDuration: const Duration(milliseconds: 300),
        );
      });



    });
  }

  DateTime newExpirationDate= DateTime (2023,01,01);



  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      body: Center(
        child: Container(
          child: QrImage(
            data: 'This simple QR code',
            version: QrVersions.auto,
            size: 280,
            gapless: false,
          )
        ),
      ),
    );
  }

  // alert dialog widget
  Widget _dialog(BuildContext context) {
    return AlertDialog(
      content:  Text(
        "the expiration of date of your data is: $newExpirationDate",
        style: const TextStyle(color: Colors.black, fontSize: 22),
      ),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Okay"))
      ],
    );
  }
}




// fetching the saved date

Future<DateTime> getExpirationDate() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  DateTime expirationDate= DateTime.parse(prefs.getString("dateSaved")!) ;
  return expirationDate;
}