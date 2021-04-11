import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:settle/common/helpers/countries.dart';

class CountryModel {
  String countryNameEn;
  String countryNameLocal;
  String countryCode;
  String currencyCode;
  String currencyNameEn;
  String tinType;
  String tinName;
  String countryCallingCode;
  String region;
  String flag;

  CountryModel({
    this.countryNameEn,
    this.countryNameLocal,
    this.countryCode,
    this.currencyCode,
    this.currencyNameEn,
    this.tinType,
    this.tinName,
    this.countryCallingCode,
    this.region,
    this.flag,
  });

  CountryModel.fromJson(Map<String, dynamic> json) {
    countryNameEn = json['countryNameEn'];
    countryNameLocal = json['countryNameLocal'];
    countryCode = json['countryCode'];
    currencyCode = json['currencyCode'];
    currencyNameEn = json['currencyNameEn'];
    tinType = json['tinType'];
    tinName = json['tinName'];
    countryCallingCode = json['countryCallingCode'];
    region = json['region'];
    flag = json['flag'];
  }
}

List<CountryModel> countryList = countries
    .map(
      (dynamic item) => CountryModel.fromJson(item),
    )
    .toList();
