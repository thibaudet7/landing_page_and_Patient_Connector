
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';



class DocumentationScreen extends StatefulWidget

{
  const DocumentationScreen({Key? key}) : super(key: key);

  @override
  State<DocumentationScreen> createState() => _DocumentationScreenState();
}

class _DocumentationScreenState extends State<DocumentationScreen> {

  final Uri _url = Uri.parse('https://www.sciencedirect.com/science/article/pii/S1532046407000032');

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }


  //https://www.truenorthitg.com/healthcare-unstructured-data/



  _launchURLBrowser2() async {
    var url = Uri.parse("https://www.truenorthitg.com/healthcare-unstructured-data/");
    if (!await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURLBrowser3() async {
    var url = Uri.parse("https://pubmed.ncbi.nlm.nih.gov/17081736/");
    if (!await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }



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

              Image.asset('assets/images/documentation.png',),
            ],
          ),

          Padding(
            padding:  EdgeInsets.fromLTRB(viewWidth*0.03,viewWidth*0.07,viewWidth*0.03,viewWidth*0.07 ),
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                reusableContainer(viewWidth,"Science direct",_launchUrl ),
                reusableContainer(viewWidth,"healthcare unstructured",_launchURLBrowser2),
                reusableContainer(viewWidth,"pubmed",_launchURLBrowser3 ),
                //reusableContainer(viewWidth, "Chat"),
              ],),
          ),


        ],
      ),
    );
  }

  Padding reusableContainer(double viewWidth, String nameOfDocumentation, Function() function) {
    return Padding(
      padding:  EdgeInsets.all(viewWidth*0.03),
      child: Container(
        width: viewWidth*0.9,
        height: viewWidth*0.10,
        decoration:  const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            )
        ),
        child: TextButton(

          onPressed:function ,
          child: Text(nameOfDocumentation,style:
          const TextStyle(color: Color(0xff3378E5), fontSize: 22) ,),
        )

      ),
    );
  }
}
