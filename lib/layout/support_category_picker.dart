import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../blocs/support_request_bloc.dart';
import '../model/support_request_category.dart';
import '../utils/colors.dart';
import 'loading_indicator_widget.dart';

class SupportCategoryPicker extends StatefulWidget {
  const SupportCategoryPicker({Key? key}) : super(key: key);

  @override
  State<SupportCategoryPicker> createState() => _SupportCategoryPickerState();
}

class _SupportCategoryPickerState extends State<SupportCategoryPicker> {

  List<RequestCategory> categoryList = [];

  @override
  void initState() {
    getSupport();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
            ],
          ),
          SizedBox(
            height: 20,
          ),
          categoryList.isEmpty ? LoadingIndicatorWidget() : Container(),
          ...categoryList.map(
                  (e) => AccountCustom(e.name, e.categoryId,))
        ],
      )),
    );
  }

  Widget AccountCustom(String? name, int? code) {
    return InkWell(
      onTap: () {
        Provider.of<SupportRequestBloc>(context, listen: false)
            .notifyCategory(name!, code!);
        Navigator.pop(context);

      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        child: Column(
          children: [
            Row(
              children: [
                //SvgPicture.asset(flag),
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

  getSupport() async {
    final SupportRequestBloc cb = context.read<SupportRequestBloc>();
    await cb.getSupportCategorylist();
    categoryList = await cb.categoryList;
    Timer(Duration(seconds: 1), () => setState(() {}) );
  }
}
