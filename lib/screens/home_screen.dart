


import 'package:flutter/material.dart';
import 'dart:math' as math;



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override

  Widget build(BuildContext context) {

    double viewWidth = MediaQuery.of(context).size.width;
    double viewHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Padding(
        padding:  EdgeInsets.only(bottom: viewHeight*0.2),
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(top: 0.07* viewHeight),
              child: Padding(
                padding:  EdgeInsets.all(0.05*viewWidth),
                child: Container(
                  height: 0.12*viewHeight,
                  decoration:  const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      )
                  ),
                  child: Row(children: [
                    Transform.rotate(
                      angle: -math.pi/2,
                      child: SizedBox(
                        width: 0.1*viewHeight,
                        height: 0.1*viewWidth,
                        child: Image.asset('assets/images/logo.png',),
                      ),
                    ),
                  ],),
                ),
              ),
            ),
            // SizedBox(
            //   height: 0.02*viewHeight,
            // ),
            Padding(
              padding:  EdgeInsets.all(0.04*viewWidth),
              child: Container(
                height: 0.22*viewHeight,
                decoration:  const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    )
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8.0,15, 8.0, 8.0),
                  child: Row(
                    children: [
                    SizedBox(
                      width: 0.25 *viewWidth,
                      height: 0.12*viewWidth,
                      child: Image.asset('assets/images/AI.png',),
                    ),
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children:   [
                       Align(
                         alignment:Alignment.centerLeft,
                         child: TextButton(
                           onPressed: (){},
                           child: Text("Clinical trials AI simulation",
                                  textAlign:TextAlign.left,
                                  style: TextStyle(color: const Color(0xff007BFF), fontSize: 0.045*viewWidth),),
                         ),
                       ),
                        Text("How we use AI to\npredict risks and give\nyou suggestions to \nstay healthy",
                            style: TextStyle( fontSize: 0.055*viewWidth))


                    ],),

                  ],),
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.fromLTRB(0.04*viewWidth,0.01*viewWidth,0.04*viewWidth,0.01*viewWidth),
              child: SizedBox(
                height: 0.18*viewHeight,
                child: Padding(
                  padding:  const EdgeInsets.fromLTRB(8, 20, 8, 8),
                  child: Row(mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                      width: 0.25*viewWidth,
                      height: 0.12*viewWidth,
                      child: Padding(
                        padding:  const EdgeInsets.only(left:20),
                        child: Stack(children:[
                        Image.asset('assets/images/database.png',),
                        SizedBox(
                          width: 0.15 *viewWidth,
                          height: 0.15*viewWidth,
                          child: Opacity(
                            opacity: 0,
                            child: ElevatedButton(
                                  onPressed: (){},
                                style: ElevatedButton.styleFrom(

                                  backgroundColor: Colors.blueAccent,
                                  textStyle: const TextStyle(
                                      ),
                                ),
                                  child: null),
                          ),
                        )
                        ]
                        ),
                      ),
                        ),
                      Text("Patient Data \nDepersonalization",style: TextStyle( fontSize: 0.06*viewWidth), )

                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.all(0.04*viewWidth),
              child: Stack(
                children: [

                  Image.asset('assets/images/unstructured.png',),
                  Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(top:10 ),
                        child: Container(
                          height: viewHeight*0.05,
                          width: viewWidth*0.8,
                          color: Colors.white,
                          child: Center(
                            child: TextButton(
                              onPressed: (){},
                              child: Text("Structuring unstructured data",
                                style: TextStyle( fontSize: 0.05*viewWidth,color: const Color(0xff007BFF)), ),
                            ),
                          ),
                        ),
                      ))
                ],
              ),
            ),


            Padding(
              padding:  EdgeInsets.all(0.04*viewWidth),
              child: SizedBox(
                height: 0.12*viewHeight,

                child: Padding(
                  padding:  const EdgeInsets.fromLTRB(8, 20, 8, 8),
                  child: Row(mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 0.25*viewWidth,
                        height: 0.12*viewWidth,
                        child: Padding(
                          padding:  const EdgeInsets.only(left:20),
                          child: Stack(children:[
                            Image.asset('assets/images/lab.png',),
                            SizedBox(
                              width: 0.15 *viewWidth,
                              height: 0.15*viewWidth,
                              child: Opacity(
                                opacity: 0,
                                child: ElevatedButton(
                                    onPressed: (){},
                                    style: ElevatedButton.styleFrom(

                                      backgroundColor: Colors.blueAccent,
                                      textStyle: const TextStyle(
                                      ),
                                    ),
                                    child: null),
                              ),
                            )
                          ]
                          ),
                        ),
                      ),
                      Text("Document analysis",style: TextStyle( fontSize: 0.06*viewWidth), )

                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.all(0.04*viewWidth),
              child: Stack(
                children: [

                  Image.asset('assets/images/predictions.png',),
                  Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(top:5 ),
                        child: Container(
                          height: viewHeight*0.05,
                          width: viewWidth*0.8,
                          color: Colors.white,
                          child: Center(
                            child: TextButton(
                              onPressed: (){},
                              child: Text("Predictions endpoints",
                                style: TextStyle( fontSize: 0.05*viewWidth,color: const Color(0xff007BFF)), ),
                            ),
                          ),
                        ),
                      ))
                ],
              ),
            ),

          ],


        ),
      ),
    );
  }
}
