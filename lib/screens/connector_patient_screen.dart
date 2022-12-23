

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:landing_page/screens/sharing_screen.dart';

//import 'package:landing_page/main.dart';
//import 'package:landing_page/screens/sharing_screen.dart';




class ConnectorPatient extends StatefulWidget {
  const ConnectorPatient({Key? key}) : super(key: key);

  @override
  State<ConnectorPatient> createState() => _ConnectorPatientState();
}

class _ConnectorPatientState extends State<ConnectorPatient> {


  @override
  void initState() {

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
    super.initState();
  }


  @override

  Widget build(BuildContext context) {

    double viewWidth = MediaQuery.of(context).size.width;
    double viewHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding:  EdgeInsets.only(top: 0.02*viewHeight, left:5, right: 5),
      child: ListView(
        children: [
          ReusableMaterial(viewWidth: viewWidth, viewHeight: viewHeight,imageString:'assets/images/doc1.png',
            doctorName:" Dr Peaceful" ,
          doctorSpeciality:"neurologists",),
          ReusableMaterial(viewWidth: viewWidth, viewHeight: viewHeight,imageString:'assets/images/doc2.png',
            doctorName:" Dr Smiley" ,
            doctorSpeciality:"neurologists",),
          ReusableMaterial(viewWidth: viewWidth, viewHeight: viewHeight,imageString:'assets/images/doc3.png',
            doctorName:" Dr Joyful" ,
            doctorSpeciality:"neurologists",),
          ReusableMaterial(viewWidth: viewWidth, viewHeight: viewHeight,imageString:'assets/images/doc4.png',
            doctorName:" Dr Assurance" ,
            doctorSpeciality:"neurologists",),
          ReusableMaterial(viewWidth: viewWidth, viewHeight: viewHeight,imageString:'assets/images/doc5.png',
            doctorName:" Dr Faithful" ,
            doctorSpeciality:"neurologists",),

        ],
      ),);
  }


// alert dialog behaviour preparation

  Widget _dialog(BuildContext context) {
    return AlertDialog(
      content: const Text(
        " If you agree to share your data with a Doctor, please tick the box",
        style: TextStyle(color: Colors.black, fontSize: 22),
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

class ReusableMaterial extends StatefulWidget {
  const ReusableMaterial({
    Key? key,
    required this.viewWidth,
    required this.viewHeight,
    required this.imageString,
    required this.doctorSpeciality,
    required this.doctorName,
  }) : super(key: key);

  final double viewWidth;
  final double viewHeight;
  final String imageString;
  final String doctorName;
  final String doctorSpeciality;


  @override
  State<ReusableMaterial> createState() => _ReusableMaterialState();
}

class _ReusableMaterialState extends State<ReusableMaterial> {


void gotoShareScreen(){

  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const SharingScreen()),

  );

}

bool isTicked=false;

void checkboxCallback(bool? newValue)  {
  setState(() {
    isTicked=newValue!;

    if(isTicked==true) {
      Timer(const Duration(seconds: 1), gotoShareScreen);
    }
  });

}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Material(
       elevation: 8,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                color: Colors.white,
                width: 0.18*widget.viewWidth,
                height: 0.18*widget.viewWidth,
                child: Stack(children: [
                  ClipOval(
                    child: Image.asset(widget.imageString),
                  ),
                  const Align(
                    alignment: Alignment.topRight,
                    child: Icon(Icons.circle,
                      color: Colors.green,
                      size: 15,),
                  ),
                ],

                ),
              ),
            ),
            Container(
              color: Colors.white,
              height: 0.12*widget.viewHeight,
              width: 0.7*widget.viewWidth,
              child: Center(
                child: ListTile(
                title:  Text(widget.doctorName, style:const TextStyle(fontSize: 20,color: Colors.black),),
      subtitle:  Text("  ${widget.doctorSpeciality}", style:const TextStyle(fontSize: 14,color: Colors.grey),),

      trailing: Checkbox(value: isTicked,
      onChanged: checkboxCallback,

      ),
      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SingleCheckbox extends StatelessWidget {
  const SingleCheckbox({
    Key? key,
    required this.checkboxState,
    required this.toggleCheckboxState,
  }) : super(key: key);

  final bool checkboxState;
  final Function (bool?) toggleCheckboxState;

  @override
  Widget build(BuildContext context) {
    return Checkbox
      (value: checkboxState,
    onChanged:toggleCheckboxState,
    );
  }
}









// reusableMaterial(viewHeight, viewWidth,'assets/images/doc1.png', "Dr. Gabriella Kindness","Neurologists Specialist", ),
//     );
// reusableMaterial(viewHeight, viewWidth,'assets/images/doc2.png', "Dr. Ben Smiler","Neurologists Specialist" ),
//
// reusableMaterial(viewHeight, viewWidth,'assets/images/doc3.png', "Dr. Andrew Joyful","Neurologists Specialist" ),
//
// reusableMaterial(viewHeight, viewWidth,'assets/images/doc4.png', "Dr. Nikita Nice","Neurologists Specialist" ),
// reusableMaterial(viewHeight, viewWidth,'assets/images/doc5.png', "Dr. Ariane Assurance","Neurologists Specialist" ),