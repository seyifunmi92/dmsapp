import 'package:dms/blocs/company_bloc.dart';
import 'package:dms/model/company_model.dart';
import 'package:dms/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CompanyPicker extends StatefulWidget {
  const CompanyPicker({Key? key}) : super(key: key);

  @override
  State<CompanyPicker> createState() => _CompanyPickerState();
}

class _CompanyPickerState extends State<CompanyPicker> with SingleTickerProviderStateMixin {

  late AnimationController _animationController;
  List<DmsCompany> companylist = [];
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

    final CompanyBloc cb = context.read<CompanyBloc>();
    cb.getCompanieslist();
    companylist = cb.companylist;

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
            ],
          ),
          SizedBox(
            height: 20,
          ),
          ...companylist.map(
                  (e) => countryCustom(e.name, e.code))
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

  Widget countryCustom(String? name, String? code) {
    return InkWell(
      onTap: () {
        Provider.of<CompanyBloc>(context, listen: false)
            .notifyCompany(name!, code!);
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
}
