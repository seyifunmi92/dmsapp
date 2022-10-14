import 'dart:async';
import 'package:dms/model/state.dart';
import 'package:dms/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../blocs/country_bloc.dart';

class StatePicker extends StatefulWidget {
  const StatePicker({Key? key}) : super(key: key);

  @override
  State<StatePicker> createState() => _StatePickerState();
}

class _StatePickerState extends State<StatePicker> with SingleTickerProviderStateMixin {

  late AnimationController _animationController;
  List<StateModel> stateList = [];
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

    getStateList();
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
              stateList.isEmpty ? Text("Item Loading...") : Container(),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          ...stateList.map(
                  (e) => stateListCustom(e.name, e.code))
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

  Widget stateListCustom(String? name, String? code) {
    return InkWell(
      onTap: () {
        Provider.of<CountryBloc>(context, listen: false)
            .notifyState(name!, code!);
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

  void getStateList() async {
    final CountryBloc cb = context.read<CountryBloc>();
    cb.getStatelist();
    stateList = cb.statelist;
    Timer(Duration(seconds: 1), () => setState(() {}) );
  }
}
