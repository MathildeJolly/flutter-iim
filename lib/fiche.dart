import 'package:flutter/material.dart';
import 'package:yuka/app_colors.dart';
import 'package:yuka/app_icons.dart';
import 'package:yuka/res/app_images.dart';
import 'package:yuka/separator_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: AppColors.blue,
          primaryColorDark: AppColors.blueDark,
          accentColor: AppColors.yellow,
          appBarTheme: AppBarTheme(
              elevation: 0.0,
              backgroundColor: AppColors.white,
              titleTextStyle: TextStyle(color: AppColors.blue),
              actionsIconTheme: IconThemeData(color: AppColors.blue)),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              selectedItemColor: AppColors.blue,
              unselectedItemColor: AppColors.gray2)),
      home: Fiche(),
    );
  }
}

class Fiche extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);

    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: [
            Image(
              image: AssetImage(AppImages.pancakes),
              height: 350,
              fit: BoxFit.cover,
            ),
            Positioned(
                child: Body(themeData: themeData), left: 0, right: 0, top: 300)
          ],
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.themeData,
  }) : super(key: key);

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(16.0),
              topRight: const Radius.circular(16.0))),
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 30.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 2 textes
          Text(
            'Petit pois et carotte',
            style: themeData.textTheme.headline5,
          ),
          Text(
            'Casse grain',
            style: themeData.textTheme.subtitle1!.copyWith(color: Colors.grey),
          ),
          Text('Petit pois et carottes à l\'étuvée avec garniture',
              style: themeData.textTheme.caption),
          Banner(themeData: themeData)
        ],
      ),
    );
  }
}

class Banner extends StatelessWidget {
  const Banner({
    Key? key,
    required this.themeData,
  }) : super(key: key);

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.gray1,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: AssetImage(AppImages.nutriscoreA),
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: SeparatorWidget(axis: Axis.vertical),
            ),
            Text('Group Nova', style: themeData.textTheme.bodyText1),
            Text('Produits alimentaires et boissons ultra-transformés',
                style: const TextStyle(fontSize: 12, color: AppColors.gray2)),
            SeparatorWidget(axis: Axis.horizontal),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('EcoScore', style: themeData.textTheme.bodyText1),
                Row(
                  children: [
                    Icon(AppIcons.ecoscoreD, color: AppColors.ecoScoreD),
                    Text('Impact environnemental élevé',
                        style: const TextStyle(
                            fontSize: 12, color: AppColors.gray2)),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
