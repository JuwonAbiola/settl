import 'package:flutter/material.dart';
import 'package:settle/common/helpers/colors.dart';
import 'package:settle/common/helpers/customFunction.dart';
import 'package:settle/common/helpers/styles.dart';

class CustomButton extends StatelessWidget {
  Function onTap;
  Widget data;
  String text;
  Color color;
  Color borderColor = Colors.white;
  Color textColor = Colors.white;
  CustomButton(
      {Key key,
      this.onTap,
      this.data,
      this.text,
      this.color,
      this.borderColor = Colors.white,
      this.textColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: borderColor)),
          width: double.infinity,
          height: 50,
          child: Center(
              child: data != null
                  ? data
                  : Text(
                      text?.toTitleCase(),
                      style: TextStyle(color: textColor),
                    )),
        ));
  }
}

class CustomBackButton extends StatelessWidget {
  Function onTap;
  CustomBackButton({
    Key key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            padding: zeroPadding,
            decoration: BoxDecoration(
              color: deepMagnolia,
              borderRadius: BorderRadius.circular(100),
            ),
            width: 10,
            height: 10,
            child: Icon(
              Icons.chevron_left,
              color: primaryColor,
            )));
  }
}
