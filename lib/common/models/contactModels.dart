import 'package:flutter_contacts/flutter_contacts.dart';

class ContactModel {
  String name;
  String userName;
  String phoneNumber;
  String profilePhoto;

  ContactModel({this.name, this.userName, this.phoneNumber, this.profilePhoto});

  ContactModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    userName = json['userName'];
    phoneNumber = json['phoneNumber'];
    profilePhoto = json['profilePhoto'];
  }
  ContactModel.fromContact(Contact json) {
    name = '${json?.displayName}';
    userName = '';
    phoneNumber =
        '${json.phones.isNotEmpty ? json.phones.first.number : 'Not Available'}';
    profilePhoto = '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['userName'] = this.userName;
    data['phoneNumber'] = this.phoneNumber;
    data['profilePhoto'] = this.profilePhoto;
    return data;
  }
}
