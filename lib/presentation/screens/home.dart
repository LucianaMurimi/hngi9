import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resume/theme.dart';
import 'package:resume/presentation/resources/asset_manager.dart';
import 'package:resume/presentation/resources/color_manager.dart';
import 'package:resume/presentation/resources/styles_manager.dart';
import 'package:resume/presentation/screens/skills.dart';
import 'package:toggle_switch/toggle_switch.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const BioWidget();
  }
}

class BioWidget extends StatefulWidget {
  const BioWidget({Key? key}) : super(key: key);

  @override
  State<BioWidget> createState() => _BioWidgetState();
}

class _BioWidgetState extends State<BioWidget> {
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top:-20,
              left: -10,
              child: Container(
                width: 80,
                height: 120,
                decoration: BoxDecoration(
                  color: themeProvider.isDarkTheme() == true ? ColorManager.primaryDark : ColorManager.primaryLight,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(40),
                    bottomRight: Radius.circular(80),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: IconButton(
                onPressed: (){
                  setState(() {
                    themeProvider.switchTheme();
                  });
                },
                icon: Icon(themeProvider.isDarkTheme() ? Icons.light_mode : Icons.dark_mode),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: OrientationBuilder(
                builder: (context, orientation){
                  return orientation == Orientation.portrait
                      ? _buildVerticalLayout(context)
                      : _buildHorizontalLayout(context);
                }),
              ),
          ],
        ),
        ),
      );
  }
}


_buildVerticalLayout(BuildContext context){
  ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text("Ms Luciana Murimi",
        style: getHipStyle(fontSize: 56, color: themeProvider.isDarkTheme() == true ? ColorManager.white: ColorManager.primaryDark),),
      const SizedBox(height: 24,),
      CircleAvatar(
        backgroundColor: themeProvider.isDarkTheme() == true ? ColorManager.primaryDark : ColorManager.primaryLight,
        maxRadius: 72,
        child: ClipOval(
            child: Image.asset(ImageAssets.profile)),
      ),
      const SizedBox(height: 20,),
      const Text("A multi-skilled dev who enjoys poetry and a good movie on occassion.",
      textAlign: TextAlign.center
      ),
      const SizedBox(height: 20,),
      ElevatedButton(
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Skills()),
            );
          },
          child: const Text("Profile"))
    ],
  );
}

_buildHorizontalLayout(BuildContext context){
  ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

  return Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: ColorManager.primaryDark,
          maxRadius: 72,
          child: ClipOval(
              child: Image.asset(ImageAssets.profile)),
        ),
        const SizedBox(width: 24,),
        FittedBox(
          child: Column(
            children: [
              Text("Ms Luciana Murimi",
                style: getHipStyle(fontSize: 56,
                    color: themeProvider.isDarkTheme() == true ? ColorManager.white: ColorManager.primaryDark),),
              const SizedBox(height: 24,),
              const Text("A multi-skilled dev who enjoys \npoetry and a good movie on occassion.",
              textAlign: TextAlign.center,),
              const SizedBox(height: 20,),
              ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Skills()),
                    );
                  },
                  child: const Text("Profile")),
            ],
          ),
        )
      ],
    ),
  );
}
