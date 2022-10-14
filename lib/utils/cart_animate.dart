import 'dart:math';

import 'package:flutter/material.dart';

import 'colors.dart';

class CartAnimate extends StatefulWidget {
  const CartAnimate({Key? key}) : super(key: key);

  @override
  State<CartAnimate> createState() => _CartAnimateState();
}

class _CartAnimateState extends State<CartAnimate> with SingleTickerProviderStateMixin {

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
    return Container(
      width: width,
      height: height,
      color: const Color(0xFF000000).withOpacity(0.3),
      child: Stack(
        children: [
          Positioned(
            top: height * .415,
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
                    return Transform.scale(
                      scale: _animationController.value * 2 * pi,
                      child: child,
                    );
                  },
                  child: Icon(
                    Icons.shopping_cart,
                    color: appColorPrimaryLight,
                  ),
                )
                // child: Image.asset(
                //   "assets/images/add-to-cart.gif",
                //   width: 90,
                //   height: 90,
                //   fit: BoxFit.contain,
                // ),
            ),
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
