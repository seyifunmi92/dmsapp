import 'dart:async';

import 'package:dms/model/delivery_method.dart';
import 'package:dms/model/plant.dart';
import 'package:dms/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../blocs/cart_bloc.dart';

class PlantPicker extends StatefulWidget {
  const PlantPicker({Key? key}) : super(key: key);

  @override
  State<PlantPicker> createState() => _PlantPickerState();
}

class _PlantPickerState extends State<PlantPicker> with SingleTickerProviderStateMixin {

  late AnimationController _animationController;
  List<Plant> plantList = [];
  bool loading = true;
  bool dataLoaded = false;

  @override
  void initState() {
    // TODO: implement initState
    _animationController = AnimationController(
      vsync: this,
      duration:const  Duration(seconds: 2),
    );
    _animationController.repeat();

    getPlantList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(child: ListView(
        children: [
          Row(
            children: [
              IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              SizedBox(
                width: 5,
              ),
              plantList.isEmpty ? Text("Item Loading...") : Container(),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          ...plantList.map(
                  (e) => plantListCustom(e.name, e.plantType!.code))
        ],
      )),
    );
  }


  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }

  Widget plantListCustom(String? name, String? code) {
    return InkWell(
      onTap: () {
        Provider.of<CartBloc>(context, listen: false)
            .notifyPlant(name!, code!);
        Navigator.pop(context);

      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Text(
                  name!,
                  style: kmediumText(appBackgroundColorDark),
                ),
                SizedBox(
                  width: 5,
                ),
                Text("($code)", style: kmediumText(appBackgroundColorDark)),
              ],
            ),
            Divider(
              color: appShadowColor,
            )
          ],
        ),
      ),
    );
  }

  void getPlantList() async {
    final CartBloc cb = context.read<CartBloc>();
    await cb.getPlantList();
    plantList = await cb.plantList;
    Timer(Duration(seconds: 1), () => setState(() {}) );
  }
}
