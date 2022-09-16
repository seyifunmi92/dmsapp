import 'package:dms/blocs/country_bloc.dart';
import 'package:dms/model/country_model.dart';
import 'package:dms/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountryPicker extends StatefulWidget {
  const CountryPicker({Key? key}) : super(key: key);

  @override
  State<CountryPicker> createState() => _CountryPickerState();
}

class _CountryPickerState extends State<CountryPicker> with SingleTickerProviderStateMixin {

  late AnimationController _animationController;
  List<DmsCountry> countrylist = [];
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

    final CountryBloc cb = context.read<CountryBloc>();
    cb.getCountrieslist();
    countrylist = cb.countrylist;

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
          ...countrylist.map(
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
        Provider.of<CountryBloc>(context, listen: false)
            .notifyCountry(name!, code!);
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
                Text("+($code)", style: kmediumText(appBackgroundColorDark)),
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
