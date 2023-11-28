import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/OnBording.dart/Views/OnBordingScreen.dart';
import 'package:flutter_application_1/core/shard/Blocopserved.dart';
import 'package:flutter_application_1/core/shard/Local/Shardprfrence.dart';
import 'package:flutter_application_1/core/shard/theam/theam.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHealper.init();
  // Widget widget;
  // var uid = CacheHealper.getData(key: "uid");

  // if(onBoarding !=null){
  //   if(token !=null)
  //     widget =ShopLayout();
  //   else widget =LoginScreen();
  // }else{
  //   widget=OnpordingApp();
  // }
  runApp(MyApp(
      //  widget,
      ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // final Widget widget;
  //const MyApp(this.widget, {super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Social",
      theme: lightTheam,
      darkTheme: darkTheam,
      themeMode: ThemeMode.light,
      home: const FurnitureExample(),
      debugShowCheckedModeBanner: false,
    );
  }
}
