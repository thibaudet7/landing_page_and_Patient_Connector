
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:landing_page/screens/sharing_gadgets_screens/nfc-screen.dart';







class FileSharingScreen extends StatefulWidget{
  const FileSharingScreen({super.key});

  @override

  _FileSharingScreenState createState() => _FileSharingScreenState();
}

class _FileSharingScreenState extends State<FileSharingScreen> {

  dynamic  selectedFile;

  DateTime newExpirationDate= DateTime (2023,01,01);

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







  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:const Text("Share Text, URL, Image or File"),
          backgroundColor: Colors.redAccent,
        ),
        body: Column(

          children: [
            Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                  onPressed: (){
                    Share.share('Hello Welcome to FlutterCampus', subject: 'Welcome Message');
                    //subject is optional, and it is required for Email App.
                  },
                  child: const Text("Share Plain Text")),
            ),

            Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                  onPressed: (){
                    Share.share('Visit FlutterCampus at https://www.fluttercampus.com');
                  },
                  child: const Text("Share text with URL")),
            ),

            Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
                  onPressed: ()  async{
                     selectedFile = await FilePicker.platform.pickFiles(
                      type: FileType.custom,
                      allowedExtensions: ['jpg', 'pdf', 'doc'],
                      //allowed extension to choose
                    );

                    setState((){});
                  },
                  child: const Text("Pick File to Share")),
            ),

            Container(
              alignment: Alignment.center,
              child: Text(selectedFile == null?"No File Selected":selectedFile.path),
            ),


            Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
                  onPressed: () async {
                    if(selectedFile == null){
                    }else{
                      Share.shareXFiles([selectedFile.path], text: "View File");
                    }

                    setState((){});
                  },
                  child: const Text("Share Picked File")),
            ),


          ],
        )
    );
  }
}

