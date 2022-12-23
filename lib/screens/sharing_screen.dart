import 'package:flutter/material.dart';
import 'package:landing_page/screens/sharing_gadgets_screens/file_sharing_screen.dart';
import 'package:landing_page/screens/sharing_gadgets_screens/nfc-screen.dart';
import 'package:landing_page/screens/sharing_gadgets_screens/qr_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';





class SharingScreen extends StatefulWidget {
  const SharingScreen({Key? key}) : super(key: key);

  @override
  State<SharingScreen> createState() => _SharingScreenState();
}

class _SharingScreenState extends State<SharingScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor:  Color(0xffE2EDFD),
      body: SharingGadget(),

    );
  }
}





class SharingGadget extends StatefulWidget

{
  const SharingGadget({Key? key}) : super(key: key);

  @override
  State<SharingGadget> createState() => _SharingGadgetState();
}

class _SharingGadgetState extends State<SharingGadget> {

  // default date
  DateTime date =DateTime(2022,12,24);


  @override
  Widget build(BuildContext context) {

    double viewWidth = MediaQuery.of(context).size.width;
    double viewHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding:  EdgeInsets.fromLTRB(0,0.05*viewHeight, 0,0.1*viewHeight),
      child: Column(
        children: [

          Padding(
            padding:  EdgeInsets.all(viewWidth*0.03),
            child: Container(
              width: viewWidth*0.9,
              height: viewWidth*0.3,
              decoration:  const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  )
              ),
              child: const Center(child: Text("Choose a way for sending your data",
                style: TextStyle(
                  fontSize:20,
                ),

              ),),
            ),
          ),

          Padding(
            padding:  EdgeInsets.fromLTRB(viewWidth*0.03,viewWidth*0.07,viewWidth*0.03,viewWidth*0.07 ),
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    reusableContainer(viewWidth, Icons.nfc,"NFC", const NFCScreen()),
                    reusableContainer(viewWidth, Icons.qr_code,"QR code",const QrScreen()),
                    reusableContainer(viewWidth, Icons.file_copy,"file/Url..",  const FileSharingScreen()),

                  ],),
                const SizedBox(height:20,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    //reusableContainer(viewWidth, Icons.link,"link"),
                    //reusableContainer(viewWidth, Icons.file_copy,"file"),

                  ],),

              ],
            ),
          ),

        ],
      ),
    );
  }

  Container reusableContainer(double viewWidth, IconData newIcon, String typeOfContact,  Widget gadgetScreen) {
    return Container(
      width: viewWidth*0.28,
      height: viewWidth*0.28,
      decoration:  const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          )
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(onPressed: (){

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
                    child: _dialog(ctx, gadgetScreen),
                  );
                },
                transitionDuration: const Duration(milliseconds: 300),
              );
            });
          },
            icon:  Icon(newIcon,
              size: viewWidth*0.08, color:Colors.black ,), ),
          Text(typeOfContact,style:const TextStyle(color: Colors.black ) ,)
        ],
      ),
    );
  }


  // Alert allowing to choose the expiration date

  Widget _dialog(BuildContext context, Widget gadgetScreen) {
    return AlertDialog(
      content:  Text(
        " ${date.year}/${date.month}/${date.day}",
        style: const TextStyle(color: Colors.black, fontSize: 22),
      ),
      actions: <Widget>[
        Center(
          child: ElevatedButton(
            onPressed: ()async{
              DateTime? newDate= await showDatePicker(context: context, initialDate: date,
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
              ) ;

              if(newDate==null) return;

              setState(() {
                date=newDate;
              });

              // storing the expiration date
              saveExpirationDate(date.toIso8601String());
            },
            style:ElevatedButton.styleFrom(backgroundColor: Colors.black) ,
            child: const Text("choose an expiration date",
              style: TextStyle(color: Colors.blue, fontSize: 20),),),
        ),

        TextButton(
            onPressed: () {


                if(date==DateTime(2022,12,24)) {

                  Navigator.of(context).pop();

                }
                else if (date!=DateTime(2022,12,24))
                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  gadgetScreen),
                  );
                }




            },
            child: const Text("Okay"))
      ],
    );
  }

}

// Future widget to store expiration date

Future saveExpirationDate(String expirationDateString) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  prefs.setString('dateSaved', expirationDateString);
}
