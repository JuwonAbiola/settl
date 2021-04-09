import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:settle/common/helpers/colors.dart';
import 'package:settle/common/helpers/constants.dart';
import 'package:settle/common/helpers/spacer.dart';
import 'package:settle/common/helpers/styles.dart';
import 'package:settle/common/helpers/validators.dart';
import 'package:settle/common/mock/contactMock.dart';
import 'package:settle/common/models/contactModels.dart';
import 'package:settle/common/widgets/Input.dart';
import 'package:settle/common/widgets/appBar.dart';
import 'package:settle/common/widgets/buttons.dart';
import 'package:settle/common/widgets/contactTile.dart';

class ContactListScreen extends StatefulWidget {
  ContactListScreen({Key key}) : super(key: key);

  @override
  _ContactListScreenState createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  TabController _tabController;

  int tabIndex = 0;
  List<ContactModel> _contacts;
  bool _permissionDenied = false;

  @override
  void initState() {
    super.initState();
    _fetchContacts();
  }

  Future _fetchContacts() async {
    if (await FlutterContacts.requestPermission()) {
      List<Contact> contacts = await FlutterContacts.getContacts(
          withProperties: true, withPhoto: true);
      List<ContactModel> contactModelList = contacts
          .map(
            (dynamic item) => ContactModel.fromContact(item),
          )
          .toList();

      setState(() => _contacts = contactModelList);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        appBar: CustomAppBar(leading: CustomBackButton(), title: ''),
        body: Container(
          padding: overallPadding,
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: <Widget>[
                Center(
                  child: Text(
                    'Choose who to send money to',
                    style: titleStyle,
                  ),
                ),
                spacerH20,
                if (_permissionDenied) Center(child: Text('Permission denied')),
                spacerH20,
                Container(
                  constraints: BoxConstraints(maxHeight: 150.0),
                  child: Material(
                    color: Colors.indigo,
                    child: Container(
                      color: Colors.white,
                      child: TabBar(
                        labelPadding: zeroPadding,
                        indicatorPadding: zeroPadding,
                        indicator: BoxDecoration(color: white),
                        onTap: (int data) {
                          setState(() {
                            tabIndex = data;
                          });
                        },
                        tabs: [
                          Tab(
                            child: Container(
                              margin: EdgeInsets.only(right: 2.5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: tabIndex == 0
                                      ? palePrimaryColor
                                      : whiteSmoke),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "From Contacts",
                                  style: TextStyle(
                                      color: tabIndex == 0
                                          ? primaryColor
                                          : nobleGrey),
                                ),
                              ),
                            ),
                          ),
                          Tab(
                            child: Container(
                              margin: EdgeInsets.only(left: 2.5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      50), // Creates border
                                  color: tabIndex == 1
                                      ? palePrimaryColor
                                      : whiteSmoke),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text("Phone number",
                                    style: TextStyle(
                                        color: tabIndex == 1
                                            ? primaryColor
                                            : nobleGrey)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      SingleChildScrollView(
                          child: _fromContacts(
                              context: context, contacts: _contacts)),
                      SingleChildScrollView(
                          child: _phoneNumber(context: context))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

Widget _phoneNumber({context}) {
  final _formKey = GlobalKey<FormState>();

  return Form(
    key: _formKey,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        spacerH20,
        spacerH5,
        Input(
            hintText: 'Recepient’s phone number',
            keyboard: KeyboardType.PHONE,
            validator: (String value) => FieldValidator.validate(value: value),
            fillColor: magnolia,
            borderColor: deepMagnolia),
        spacerH20,
        spacerH5,
        Input(
            hintText: 'Recepient’s name',
            keyboard: KeyboardType.TEXT,
            validator: (String value) => FieldValidator.validate(value: value),
            fillColor: magnolia,
            borderColor: deepMagnolia),
        spacerH50,
        CustomButton(
          text: 'Continue',
          color: primaryColor,
          onTap: () {
            FocusScope.of(context).unfocus();
            if (_formKey.currentState.validate()) {
              _formKey.currentState.save();
            }
          },
        )
      ],
    ),
  );
}

Widget _fromContacts({context, contacts}) {
  final _formKey = GlobalKey<FormState>();

  return Form(
    key: _formKey,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        spacerH20,
        spacerH5,
        Input(
            prefix: Icon(Icons.search),
            hintText: 'Search ',
            keyboard: KeyboardType.TEXT,
            borderColor: ivory),
        spacerH20,
        spacerH5,
        ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: contactMockDataList.length,
          separatorBuilder: (BuildContext context, int index) => Divider(
            color: deepMagnolia,
            thickness: 1,
          ),
          itemBuilder: (BuildContext context, int index) {
            return ContactTile(
              data: contactMockDataList[index],
            );
          },
        ),
        Divider(
          color: deepMagnolia,
          thickness: 1,
        ),
        contacts == null
            ? Center(child: CircularProgressIndicator())
            : ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (BuildContext context, int index) => Divider(
                      color: deepMagnolia,
                      thickness: 1,
                    ),
                itemCount: contacts?.length,
                itemBuilder: (context, index) => ContactTile(
                      data: contacts[index],
                    ))
      ],
    ),
  );
}
