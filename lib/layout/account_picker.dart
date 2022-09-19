import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../blocs/cart_bloc.dart';
import '../model/account_item.dart';
import '../utils/colors.dart';
import 'loading_indicator_widget.dart';

class AccountPicker extends StatefulWidget {
  const AccountPicker({Key? key}) : super(key: key);

  @override
  State<AccountPicker> createState() => _AccountPickerState();
}

class _AccountPickerState extends State<AccountPicker> {

  List<AccountItem> accountList = [];

  @override
  void initState() {
    getAccounts();
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
          accountList.isEmpty ? LoadingIndicatorWidget() : Container(),
          ...accountList.map(
                  (e) => AccountCustom(e.friendlyName ?? "Distributor Name", e.sapAccountId!.toInt()))
        ],
      )),
    );
  }

  Widget AccountCustom(String? name, int? code) {
    return InkWell(
      onTap: () {
        Provider.of<CartBloc>(context, listen: false)
            .notifyAccount(name!, code!);
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

  getAccounts() async {
    final CartBloc cb = context.read<CartBloc>();
    await cb.getAccountlist();
    accountList = await cb.accountList;
    Timer(Duration(seconds: 3), () => setState(() {}) );


  }
}
