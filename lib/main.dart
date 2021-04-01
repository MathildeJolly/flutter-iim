import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yuka/app_colors.dart';
import 'package:yuka/app_icons.dart';
import 'package:yuka/details.dart';
import 'package:yuka/res/app_vectorial_images.dart';

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
      home: DetailsScreen(),
    );
  }
}

class EmptyListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mes scans',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        actions: [
          IconButton(
            icon: Icon(AppIcons.barcode),
            onPressed: () {},
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(AppVectorialImages.illEmpty),
            SizedBox(height: screenHeight * 0.1),
            FractionallySizedBox(
              widthFactor: 0.3,
              child: Text(
                'Vous n\'avez pas encore scanné de produit',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.blue,
                  height: 1.7,
                  fontSize: 17.0,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.1),
            TextButton(
              onPressed: () {
                //Navigator.of(context).push('/product')
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'Commencer'.toUpperCase(),
                  ),
                  const SizedBox(width: 20.0),
                  Icon(Icons.arrow_right_alt),
                ],
              ),
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  vertical: 18.0,
                  horizontal: 25.0,
                ),
                primary: AppColors.blue,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(22.0),
                  ),
                ),
                backgroundColor: AppColors.yellow,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
