import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:settle/common/helpers/colors.dart';

/// This class is a resuable Input box

class Input extends StatelessWidget {
  final String hintText;
  final Function validator;
  final Function onSaved;
  final Function onChanged;
  final Function toggleEye;
  final KeyboardType keyboard;
  final String init;
  final bool isPassword;
  final Color isPasswordColor;
  final bool showObscureText;
  final bool obscureText;
  final Color styleColor;
  final Color hintStyleColor;
  final bool enabled;
  final String labelText;
  final dynamic maxLines;
  final Color borderColor;
  final Widget prefix;
  final Key key;
  final TextEditingController controller;
  final List<TextInputFormatter> inputFormatters;
  final Color fillColor;

  Input(
      {this.hintText,
      this.validator,
      this.onSaved,
      this.toggleEye,
      this.init,
      this.isPassword = false,
      this.isPasswordColor,
      this.showObscureText,
      this.obscureText = false,
      this.keyboard,
      this.styleColor,
      this.hintStyleColor,
      this.enabled = true,
      this.labelText,
      this.maxLines = 1,
      this.borderColor = ivory,
      this.onChanged,
      this.prefix,
      this.key,
      this.controller,
      this.inputFormatters,
      this.fillColor = Colors.transparent});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(0),
      child: TextFormField(
          inputFormatters: inputFormatters,
          controller: controller,
          key: key,
          enabled: enabled,
          style: TextStyle(color: black),
          cursorColor: styleColor,
          obscureText: obscureText,
          maxLines: maxLines,
          onChanged: onChanged,
          decoration: InputDecoration(
            prefixIcon: prefix,
            filled: true,
            fillColor: !enabled ? whiteSmoke : fillColor,
            labelText: hintText,
            hintText: hintText,
            hintStyle: TextStyle(color: black),
            isDense: true,
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor),
            ),
            // contentPadding: EdgeInsets.only(top: 10, bottom: 10),
            suffixIcon: isPassword
                ? GestureDetector(
                    onTap: toggleEye,
                    child: Icon(
                      showObscureText ? Icons.visibility : Icons.visibility_off,
                      color: Color(0xFFC0C1C3),
                    ),
                  )
                : Text(''),
          ),
          validator: validator,
          initialValue: init,
          onSaved: onSaved,
          keyboardType: keyboard == KeyboardType.EMAIL
              ? TextInputType.emailAddress
              : keyboard == KeyboardType.NUMBER
                  ? TextInputType.number
                  : keyboard == KeyboardType.PHONE
                      ? TextInputType.phone
                      : TextInputType.text),
    );
  }
}

enum KeyboardType { EMAIL, PHONE, NUMBER, TEXT }
