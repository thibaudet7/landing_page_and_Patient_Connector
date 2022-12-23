import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';



class NFCScreen extends StatefulWidget {
  const NFCScreen({super.key});



  @override
  State<StatefulWidget> createState() => NFCScreenState();
}

class NFCScreenState extends State<NFCScreen> {
  ValueNotifier<dynamic> result = ValueNotifier(null);

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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('NfcManager')),
        body: SafeArea(
          child: FutureBuilder<bool>(
            future: NfcManager.instance.isAvailable(),
            builder: (context, ss) => ss.data != true
                ? Center(child: Text('NfcManager.isAvailable(): ${ss.data}'))
                : Flex(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              direction: Axis.vertical,
              children: [
                Flexible(
                  flex: 2,
                  child: Container(
                    margin: const EdgeInsets.all(4),
                    constraints: const BoxConstraints.expand(),
                    decoration: BoxDecoration(border: Border.all()),
                    child: SingleChildScrollView(
                      child: ValueListenableBuilder<dynamic>(
                        valueListenable: result,
                        builder: (context, value, _) =>
                            Text('${value ?? ''}'),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: GridView.count(
                    padding: const EdgeInsets.all(4),
                    crossAxisCount: 2,
                    childAspectRatio: 4,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                    children: [
                      ElevatedButton(
                          onPressed: _tagRead,
                          child: const Text('Tag Read')),
                      ElevatedButton(
                          onPressed: _ndefWrite,
                          child: const Text('Ndef Write')),
                      ElevatedButton(
                          onPressed: _ndefWriteLock,
                          child: const Text('Ndef Write Lock')),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _tagRead() {
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      result.value = tag.data;
      NfcManager.instance.stopSession();
    });
  }

  void _ndefWrite() {
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      var ndef = Ndef.from(tag);
      if (ndef == null || !ndef.isWritable) {
        result.value = 'Tag is not ndef writable';
        NfcManager.instance.stopSession(errorMessage: result.value);
        return;
      }

      NdefMessage message = NdefMessage([
        NdefRecord.createText('Hello World!'),
        NdefRecord.createUri(Uri.parse('https://flutter.dev')),
        NdefRecord.createMime(
            'text/plain', Uint8List.fromList('Hello'.codeUnits)),
        NdefRecord.createExternal(
            'com.example', 'mytype', Uint8List.fromList('mydata'.codeUnits)),
      ]);

      try {
        await ndef.write(message);
        result.value = 'Success to "Ndef Write"';
        NfcManager.instance.stopSession();
      } catch (e) {
        result.value = e;
        NfcManager.instance.stopSession(errorMessage: result.value.toString());
        return;
      }
    });
  }

  void _ndefWriteLock() {
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      var ndef = Ndef.from(tag);
      if (ndef == null) {
        result.value = 'Tag is not ndef';
        NfcManager.instance.stopSession(errorMessage: result.value.toString());
        return;
      }

      try {
        await ndef.writeLock();
        result.value = 'Success to "Ndef Write Lock"';
        NfcManager.instance.stopSession();
      } catch (e) {
        result.value = e;
        NfcManager.instance.stopSession(errorMessage: result.value.toString());
        return;
      }
    });
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

