import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

void nextScreen (context, page){
  // finish(context);
  Navigator.push(context, MaterialPageRoute(
    builder: (context) => page));
}


void nextScreeniOS (context, page){
  finish(context);
  Navigator.push(context, CupertinoPageRoute(
    builder: (context) => page));
}


void nextScreenCloseOthers (context, page){
  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => page), (route) => false);
}

void nextScreenReplace (context, page){
  finish(context);
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => page));
}


void nextScreenPopup (context, page){
  // finish(context);
  Navigator.push(context, MaterialPageRoute(
    fullscreenDialog: true,
    builder: (context) => page),
  );
}


void nextScreenReplaceWithTransition(context, page){
  finish(context);
  Navigator.pushReplacement(
      context,
      PageRouteBuilder(
          maintainState: true,
          opaque: true,
          pageBuilder: (context, _, __) => page,
          transitionDuration: const Duration(seconds: 1),
          transitionsBuilder:
              (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          }));
}