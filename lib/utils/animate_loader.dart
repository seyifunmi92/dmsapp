import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedLoader extends StatefulWidget {
  const AnimatedLoader({Key? key}) : super(key: key);

  @override
  State<AnimatedLoader> createState() => _AnimatedLoaderState();
}

class _AnimatedLoaderState extends State<AnimatedLoader> with SingleTickerProviderStateMixin {

  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animationController.repeat();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Center(
      child: Stack(
        children: [
          Positioned(
            top: height * .4,
            left: 50,
            right: 50,
            child: Container(
                width: 100,
                decoration: BoxDecoration(
                  //color: kColorWhite,
                    borderRadius: BorderRadius.circular(5)),
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle:
                      _animationController.value * 2 * pi,
                      child: child,
                    );
                  },
                  child: Image.asset(
                    "assets/images/spinner.png",
                    width: 70,
                    height: 70,
                    fit: BoxFit.contain,
                  ),
                )),
          ),
          Positioned(
            top: height * .415,
            left: 50,
            right: 50,
            child: Container(
                width: 100,
                decoration: BoxDecoration(
                  //color: kColorWhite,
                    borderRadius: BorderRadius.circular(5)),
                child: Image.asset(
                  "assets/images/dmsspinnerlogo.png",
                  width: 50,
                  height: 50,
                  fit: BoxFit.contain,
                )),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
