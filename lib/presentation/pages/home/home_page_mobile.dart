import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_daniel/core/utils/functions.dart';
import 'package:portfolio_daniel/presentation/pages/portfolio/portfolio_page.dart';
import 'package:portfolio_daniel/presentation/widgets/app_drawer.dart';
import 'package:portfolio_daniel/presentation/widgets/circular_container.dart';
import 'package:portfolio_daniel/presentation/widgets/language_toggle.dart';
import 'package:portfolio_daniel/presentation/widgets/socials.dart';
import 'package:portfolio_daniel/presentation/widgets/spaces.dart';
import 'package:portfolio_daniel/values/values.dart';

import 'home_page.dart';

class HomePageMobile extends StatefulWidget {
  @override
  _HomePageMobileState createState() => _HomePageMobileState();
}

class _HomePageMobileState extends State<HomePageMobile> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.primaryColor,
      drawer: AppDrawer(
        menuList: Data.menuList,
        selectedItemRouteName: HomePage.homePageRoute,
      ),
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(),
            Spacer(flex: 2),
            CircleAvatar(
              radius: 64,
              backgroundImage: AssetImage(ImagePath.DEV),
            ),
            SpaceH24(),
            DefaultTextStyle(
              style: const TextStyle(
                fontSize: 60.0,
                letterSpacing: 5,
                color: Colors.white,
                fontFamily: 'bluesquare',
                fontWeight: FontWeight.w600,
              ),
              child: AnimatedTextKit(
                totalRepeatCount: 1,
                animatedTexts: [
                  TypewriterAnimatedText('/Daniel/',
                      speed: Duration(milliseconds: 400)),
                ],
              ),
            ),
            SpaceH16(),
            Container(width: 250, child: Image.asset(ImagePath.LOGO2)),
            SpaceH8(),
            DefaultTextStyle(
              style: const TextStyle(
                fontSize: 16.0,
                fontFamily: StringConst.PROXIMA_NOVA,
                color: Colors.white,
              ),
              child: AnimatedTextKit(
                pause: Duration(milliseconds: 35),
                repeatForever: true,
                animatedTexts: [
                  TypewriterAnimatedText(S.TYPED_LINE_1,
                      speed: Duration(milliseconds: 90)),
                  TypewriterAnimatedText(S.TYPED_LINE_2,
                      speed: Duration(milliseconds: 90)),
                  TypewriterAnimatedText(S.TYPED_LINE_3,
                      speed: Duration(milliseconds: 90)),
                ],
              ),
            ),
            SpaceH30(),
            Socials(
              isHorizontal: true,
              color: AppColors.secondaryColor,
              barColor: AppColors.secondaryColor,
              alignment: Alignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
            ),
            Spacer(flex: 3),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, PortfolioPage.portfolioPageRoute);
              },
              child: Column(
                children: [
                  Text(
                    S.VIEW_PORTFOLIO,
                    style: theme.textTheme.bodyLarge!.copyWith(
                      color: AppColors.secondaryColor,
                      fontSize: Sizes.TEXT_SIZE_18,
                    ),
                  ),
                  SpaceH12(),
                  CircularContainer(
                    width: Sizes.WIDTH_24,
                    height: Sizes.HEIGHT_24,
                    color: AppColors.secondaryColor,
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            SpaceH30(),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Sizes.PADDING_16,
        vertical: Sizes.PADDING_16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              if (_scaffoldKey.currentState!.isEndDrawerOpen) {
                _scaffoldKey.currentState!.openEndDrawer();
              } else {
                _scaffoldKey.currentState!.openDrawer();
              }
            },
            icon: Icon(Icons.menu, color: AppColors.secondaryColor),
          ),
          Row(
            children: [
              LanguageToggle(),
              SpaceW16(),
              CircularContainer(
                color: AppColors.secondaryColor,
                child: InkWell(
                  onTap: () {
                    Functions.launchUrl(StringConst.EMAIL_URL);
                  },
                  child: Icon(
                    Icons.email,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
