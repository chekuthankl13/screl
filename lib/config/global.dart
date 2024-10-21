import 'package:flutter/material.dart';
import 'package:screl/modules/home/models/side_bar_model.dart';

class Global {

  static  Color orange = const Color.fromARGB(255, 232, 81, 22);//rgba(232,81,22,255)

  static const white = Colors.white;
  static const black = Colors.black;
  static const grey = Colors.grey;


 static ValueNotifier<SideBarModel> indexVal = ValueNotifier(sideBars[0]);
}