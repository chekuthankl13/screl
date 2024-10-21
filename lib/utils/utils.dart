import 'package:flutter/material.dart';
import 'package:screl/config/global.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
spaceHeight(height) => SizedBox(height: double.parse(height.toString()));

spaceWidth(width) => SizedBox(width: double.parse(width.toString()));

sH(context) => MediaQuery.of(context).size.height;

sW(context) => MediaQuery.of(context).size.width;

isTab(context) => sW(context) <= 980;

Center loading() {
  return  Center(
    child: CircularProgressIndicator(
        color: Global.orange,
        ),
  );
}

showToast(context,{String? txt})=> ScaffoldMessenger.of(context).showSnackBar(  SnackBar(content: Text(txt ?? "Successfully saved !!")));