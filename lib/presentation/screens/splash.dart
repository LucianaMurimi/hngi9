import 'package:flutter/material.dart';
import 'package:resume/presentation/resources/asset_manager.dart';
import 'package:resume/presentation/resources/color_manager.dart';
import 'package:resume/presentation/resources/styles_manager.dart';
import 'package:resume/presentation/resources/value_manager.dart';
import 'package:resume/presentation/screens/home.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool animate = false;

  @override
  void initState() {
    super.initState();
    startAnimation();
  }

  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      animate = true;
    });
    await Future.delayed(const Duration(milliseconds: 4000));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Home()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 1600),
                top: animate ? 0 : -40,
                right: animate ? 0 : -60,
                child: Container(
                  width: 80,
                  height: 120,
                  decoration: BoxDecoration(
                      color:ColorManager.primaryLight,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40),
                        bottomLeft: Radius.circular(80),
                      ),
                  ),
                )
            ),
            AnimatedPositioned(
                duration: const Duration(milliseconds: 1600),
                top: animate ? 150 : 100,
                left: animate ? 48 : 24,
                child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 1600),
                    opacity: animate ? 1 : 0.5 ,
                    child: Text("Welcome to my world!", style: getHipStyle(fontSize: 56, color: ColorManager.primaryDark),))),
            AnimatedPositioned(
                duration: const Duration(milliseconds: 1600),
                bottom: animate ? 80 : 40,
                left: animate ? 0 : -20,
                child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 1600),
                    opacity: animate ? 1 : 0.5 ,
                    child: Image.asset(ImageAssets.welcome, width: 372, height: 272,))),
          ],
        ),
      ),
    );
  }
}
