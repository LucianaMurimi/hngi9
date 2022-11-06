import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resume/theme.dart';
import 'package:resume/presentation/resources/color_manager.dart';
import 'package:resume/presentation/resources/styles_manager.dart';
import 'package:feather_icons_svg/feather_icons_svg.dart';
import 'package:url_launcher/url_launcher.dart';


class Skills extends StatefulWidget {
  const Skills({Key? key}) : super(key: key);

  @override
  State<Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  @override
  Widget build(BuildContext context) {
    return const SkillsWidget();
  }
}

class SkillsWidget extends StatelessWidget {
  const SkillsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top:0,
            right: -10,
            child: Container(
              width: 80,
              height: 120,
              decoration: BoxDecoration(
                color: themeProvider.isDarkTheme() == true ? ColorManager.primaryDark : ColorManager.primaryLight,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  bottomLeft: Radius.circular(80),
                ),
              ),
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
    );
  }
}

_buildVerticalLayout(BuildContext context){
  ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const SkillsTextWidget(),
      const Divider(height: 40,),
      const SocialLinksWidget(),
      Text("My hobbies include: editing my life story, hiding behind metaphors, and trying to convince my shadow that Iʼm someone worth following. \n- Rudy Francisco",
        style: getHipStyle(fontSize: 20, color: themeProvider.isDarkTheme() == true ? ColorManager.grey : ColorManager.primaryDark),),
    ],
  );
}

_buildHorizontalLayout(BuildContext context){
  ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

  return Center(
    child: FittedBox(
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SkillsTextWidget(),
            const VerticalDivider(width: 40,),
            Column(
              children: [
                const SocialLinksWidget(),
                Text("My hobbies include: editing my life story, hiding behind metaphors, and \n trying to convince my shadow that Iʼm someone worth following. \n- Rudy Francisco",
                  style: getHipStyle(fontSize: 20, color: themeProvider.isDarkTheme() == true ? ColorManager.grey :ColorManager.primaryDark),),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

class SkillsTextWidget extends StatelessWidget {
  const SkillsTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Skills", style: getHipStyle(fontSize: 56, color: ColorManager.primary),),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FeatherIcon(FeatherIcons.circle, size: 8, color: ColorManager.primary,),
            const SizedBox(width: 8,),
            const Text("Mobile App Development"),
          ],
        ),
        const SizedBox(height: 6,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FeatherIcon(FeatherIcons.circle, size: 8, color: ColorManager.primary,),
            const SizedBox(width: 8,),
            const Text("Web App Development"),
          ],
        ),
        const SizedBox(height: 6,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FeatherIcon(FeatherIcons.circle, size: 8, color: ColorManager.primary,),
            const SizedBox(width: 8,),
            const Text("Data Analysis"),
          ],
        ),
      ],
    );
  }
}

class SocialLinksWidget extends StatelessWidget {
  const SocialLinksWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return Column(
      children: [
        Text("Let's link up:", style: getLightStyle(color: themeProvider.isDarkTheme() == true ? ColorManager.grey :ColorManager.primaryDark),),
        Padding(
          padding: const EdgeInsets.only(left: 40.0, right: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: (){
                _launchURLApp("https://github.com/LucianaMurimi");
              },
                  icon: FeatherIcon(FeatherIcons.github, size: 20, color: ColorManager.primary,)),
              IconButton(onPressed: (){
                _launchURLApp("https://twitter.com/Luciana_Murimi");
              },
                  icon: FeatherIcon(FeatherIcons.twitter, size: 20, color: ColorManager.primary,)),
              IconButton(onPressed: (){
                _launchURLApp("https://lucianamurimi.hashnode.dev");
              }, icon: FeatherIcon(FeatherIcons.cloud, size: 20, color: ColorManager.primary,)),
            ],
          ),
        ),
      ],
    );
  }
}


_launchURLApp(String url) async {
  var _url = Uri.parse(url);
  if (await canLaunchUrl(_url)) {
    await launchUrl(_url);
  } else {
    throw 'Could not launch $_url';
  }
}