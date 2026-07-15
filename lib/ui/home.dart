import 'package:flutter/material.dart';
import 'package:islami/assets/app_color.dart';
import 'package:islami/assets/app_font.dart';
import 'package:islami/assets/app_image.dart';
import 'package:islami/ui/tabs/hadeth/hadeth_tab.dart';
import 'package:islami/ui/tabs/quran/quran_tab.dart';
import 'package:islami/ui/tabs/radio/radio_tab.dart';
import 'package:islami/ui/tabs/sebha/sebha_tab.dart';
import 'package:islami/ui/tabs/time/time_tab.dart';

double width(BuildContext context) => MediaQuery.of(context).size.width;

double height(BuildContext context) => MediaQuery.of(context).size.height;

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> images = [
    AppImage.backgroundQuran,
    AppImage.backgroundHadeth,
    AppImage.backgroundSebha,
    AppImage.backgroundRadio,
    AppImage.backgroundTime,
  ];
  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          images[selectedIndex],
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width(context) * 0.15,
            vertical: height(context) * 0.03,
          ),
          child: Image.asset(AppImage.imageHeader),
        ),

        Scaffold(
          backgroundColor: Colors.transparent,
          body: Expanded(child: tabs[selectedIndex]),

          bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              selectedIndex = index;

              setState(() {});
            },
            selectedLabelStyle: AppFont.whiteBold12,

            selectedItemColor: AppColor.white,
            unselectedItemColor: AppColor.black,
            backgroundColor: AppColor.primaryColor,
            showUnselectedLabels: false,

            type: BottomNavigationBarType.fixed,
            items: [
              bottomNavigationIten(AppImage.iconQuran, 'Quran', 0),
              bottomNavigationIten(AppImage.iconHadeth, 'Hadeth', 1),
              bottomNavigationIten(AppImage.iconSebha, 'Sebha', 2),
              bottomNavigationIten(AppImage.iconRadio, 'Radio', 3),
              bottomNavigationIten(AppImage.iconTime, 'Time', 4),
            ],
          ),
        ),
      ],
    );
  }

  BottomNavigationBarItem bottomNavigationIten(
    String icon,
    String label,
    int index,
  ) {
    return BottomNavigationBarItem(
      icon: (selectedIndex == index)
          ? Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(66),
                color: AppColor.blackAlpha,
              ),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              child: ImageIcon(AssetImage(icon)),
            )
          : ImageIcon(AssetImage(icon)),
      label: label,
    );
  }
}
