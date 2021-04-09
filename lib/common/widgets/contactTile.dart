import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:settle/common/helpers/colors.dart';
import 'package:settle/common/helpers/styles.dart';
import 'package:settle/common/helpers/customFunction.dart';
import 'package:settle/common/models/contactModels.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContactTile extends StatelessWidget {
  ContactModel data;
  ContactTile({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: data?.userName?.isEmpty
          ? ClipOval(
              child: Container(
                height: 40,
                width: 40,
                child: Container(
                  color: whiteSmoke,
                  child: Center(
                    child: Text('${data?.name?.getInitials()}',
                        style: TextStyle(color: nobleGrey, fontSize: 16)),
                  ),
                ),
              ),
            )
          : Stack(children: [
              ClipOval(
                child: Container(
                  height: 40,
                  width: 40,
                  child: data?.profilePhoto.isNotEmpty
                      ? Image.network('${data?.profilePhoto}')
                      : Container(
                          color: paleMagnolia,
                          child: Center(
                            child: Text('${data?.name?.getInitials()}',
                                style: TextStyle(
                                    color: primaryColor, fontSize: 16)),
                          ),
                        ),
                ),
              ),
              Positioned(
                  right: 0,
                  bottom: 0,
                  child: ClipOval(
                    child: Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: deepMagnolia,
                      ),
                      width: 15,
                      height: 15,
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/images/svgs/icon.svg',
                          width: 25,
                        ),
                      ),
                    ),
                  ))
            ]),
      title: Text(
        '${data?.name}',
        style: TextStyle(color: charcoal, fontWeight: FontWeight.bold),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(
            '${data?.userName.isNotEmpty ? data?.userName : data?.phoneNumber}',
            style: TextStyle(color: black)),
      ),
      trailing: Container(
          padding: zeroPadding,
          decoration: BoxDecoration(
            color: deepMagnolia,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Icon(
            Icons.chevron_right,
            color: primaryColor,
          )),
    );
  }
}
