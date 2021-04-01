import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yuka/app_icons.dart';
import 'package:yuka/fiche.dart';

class DetailsScreen extends StatefulWidget {
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  ProductDetailsCurrentTab currentTab = ProductDetailsCurrentTab.summary;
  int position = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Offstage(
            offstage: currentTab != ProductDetailsCurrentTab.summary,
            child: Fiche(),
          ),
          Offstage(
            offstage: currentTab != ProductDetailsCurrentTab.info,
            child: Text('2'),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(AppIcons.tabBarcode), label: 'Fiche'),
            BottomNavigationBarItem(
                icon: Icon(AppIcons.tabFridge), label: 'Caractéristiques'),
            BottomNavigationBarItem(
                icon: Icon(AppIcons.tabNutrition), label: 'Nutrition'),
            BottomNavigationBarItem(
                icon: Icon(AppIcons.tabArray), label: 'Tableau'),
          ],
          currentIndex: position,
          onTap: (int position) {
            setState(() {
              currentTab = ProductDetailsCurrentTab.values.elementAt(position);

              this.position = position;
            });
          }),
    );
  }
}

enum ProductDetailsCurrentTab { summary, info, nutrition, nutritionalValues }
