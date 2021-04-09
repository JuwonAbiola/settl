import 'package:settle/common/models/contactModels.dart';

final contactMockData = [
  {
    "name": "Uzumaki Naruto",
    "userName": "@naruto",
    "phoneNumber": '+2348067890267',
    "profilePhoto": "https://placekitten.com/200"
  },
  {
    "name": "Yagami Light",
    "userName": "@light",
    "phoneNumber": '2348067890267',
    "profilePhoto": "https://picsum.photos/200"
  },
  {
    "name": "John Doe",
    "userName": "@john",
    "phoneNumber": '2348067890267',
    "profilePhoto": "https://placebear.com/200/200"
  },
  {
    "name": "Janet Doe",
    "userName": "@doe",
    "phoneNumber": '2348067890267',
    "profilePhoto": ""
  },
  {
    "name": "Morgan Freeman",
    "userName": "@freeman",
    "phoneNumber": '2349060990234',
    "profilePhoto": ""
  },
];

List<ContactModel> contactMockDataList = contactMockData
    .map(
      (dynamic item) => ContactModel.fromJson(item),
    )
    .toList();
