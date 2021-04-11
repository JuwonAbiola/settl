import 'package:flutter/material.dart';
import 'package:settle/common/helpers/colors.dart';
import 'package:settle/common/helpers/spacer.dart';
import 'package:settle/common/models/countryModel.dart';
import 'package:settle/common/helpers/customFunction.dart';

class CountryTile extends StatelessWidget {
  CountryTile({Key key, this.data}) : super(key: key);
  CountryModel data;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: palePrimaryColor,
              spreadRadius: 0.5,
              blurRadius: 10,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ]),
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(15),
      child: Row(children: [
        Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: palePrimaryColor,
              spreadRadius: 0.5,
              blurRadius: 10,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ], color: palePrimaryColor, borderRadius: BorderRadius.circular(100)),
          height: 50,
          width: 50,
          child: Center(
            child: Text(
              '${data?.countryCallingCode}',
              style:
                  TextStyle(color: primaryColor, fontWeight: FontWeight.w500),
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${data?.countryNameEn?.toTitleCase()}',
                style: TextStyle(
                    fontWeight: FontWeight.w500, color: primaryColor)),
            spacerH5,
            Text(
              '${data?.flag}',
            ),
          ],
        ),
      ]),
    );
  }
}
