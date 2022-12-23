

import 'package:flutter/material.dart';

import 'package:landing_page/screens/start_screen.dart';
import 'package:provider/provider.dart';
//import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Data>(
      create: (context)=>Data(),
      child: MaterialApp(
        title: 'Longevity in Time',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home: const StartScreen(),
      ),
    );
  }
}








// The class that will help us use the provider state management

class Data extends ChangeNotifier{

  bool permission= false;


  void updateState(bool? newValue){

    permission=newValue!;
    notifyListeners();

  }


}



