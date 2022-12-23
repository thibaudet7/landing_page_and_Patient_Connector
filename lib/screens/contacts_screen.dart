

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class ContactScreen extends StatefulWidget

{
  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {

  @override
  Widget build(BuildContext context) {

    double viewWidth = MediaQuery.of(context).size.width;
    double viewHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding:  EdgeInsets.fromLTRB(0,0.05*viewHeight, 0,0.1*viewHeight),
      child: Column(
        children: [
          Stack(
            children: [

              Image.asset('assets/images/contact.png',),
            ],
          ),

          Padding(
            padding:  EdgeInsets.fromLTRB(viewWidth*0.03,viewWidth*0.07,viewWidth*0.03,viewWidth*0.07 ),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              reusableContainer(viewWidth, Icons.call,"Call us"),
              reusableContainer(viewWidth, Icons.message,"Email us"),
              reusableContainer(viewWidth, Icons.whatsapp,"Chat"),
            ],),
          ),
          Padding(
            padding:  EdgeInsets.only(top:0.07*viewWidth),
            child: Container(
              width: viewWidth*0.85,
              height: viewWidth*0.40,
              decoration:  const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  )
              ),
              child: const Center(child: Text("Quick Contact\n\n"

                  ),),
            ),
          ),

        ],
      ),
    );
  }

  Container reusableContainer(double viewWidth, IconData newIcon, String typeOfContact) {
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
                  IconButton(onPressed: (){},
                      icon:  Icon(newIcon,
                          size: viewWidth*0.08, color:const Color(0xff3378E5) ,), ),
                   Text(typeOfContact,style:const TextStyle(color: Color(0xff3378E5) ) ,)
                ],
              ),
            );
  }
}
