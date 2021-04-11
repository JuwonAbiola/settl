import 'package:flutter/material.dart';
import 'package:settle/common/helpers/search.dart';
import 'package:settle/common/models/countryModel.dart';
import 'package:settle/common/widgets/countryTile.dart';

countrySearchWidget({context}) {
  return showSearch(
    context: context,
    delegate: SearchPage(
        items: countryList,
        searchLabel: 'Search for Country',
        suggestion: (data) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: GestureDetector(
                onTap: () {
                  Navigator.pop(context, data);
                },
                child: CountryTile(data: data))),
        failure: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('Country not found :('),
            SizedBox(
              height: 10,
            ),
          ]),
        ),
        filter: (CountryModel data) => [data.countryNameEn],
        builder: (CountryModel data) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: GestureDetector(
                onTap: () {
                  Navigator.pop(context, data);
                },
                child: CountryTile(data: data)))),
  );
}
