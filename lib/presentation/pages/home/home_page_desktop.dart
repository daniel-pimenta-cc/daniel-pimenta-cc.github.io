import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:portfolio_daniel/core/layout/adaptive.dart';
import 'package:portfolio_daniel/core/utils/functions.dart';
import 'package:portfolio_daniel/presentation/pages/home/home_page.dart';
import 'package:portfolio_daniel/presentation/pages/portfolio/portfolio_page.dart';
import 'package:portfolio_daniel/presentation/widgets/circular_container.dart';
import 'package:portfolio_daniel/presentation/widgets/content_wrapper.dart';
import 'package:portfolio_daniel/presentation/widgets/menu_list.dart';
import 'package:portfolio_daniel/presentation/widgets/spaces.dart';
import 'package:portfolio_daniel/presentation/widgets/trailing_info.dart';
import 'package:portfolio_daniel/values/values.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HomePageDesktop extends StatefulWidget {
  @override
  _HomePageDesktopState createState() => _HomePageDesktopState();
}

class _HomePageDesktopState extends State<HomePageDesktop> {
//  GlobalKey imageKey = GlobalKey();
//  double offsetRoleLeaf;
//
//  @override
//  void initState() {
//    WidgetsBinding.instance.addPostFrameCallback((_) {
//      _getSizeOfImage();
//    });
//    super.initState();
//  }
//
//  _getSizeOfImage() {
//    final RenderBox imageRenderBox = imageKey.currentContext.findRenderObject();
//    final imageSize = imageRenderBox.size.height;
//    setState(() {
//      print("Size ${imageRenderBox.size}");
//      offsetRoleLeaf = 0;
//    });
//  }

  Future<ui.Image> _getImage() {
    Completer<ui.Image> completer = new Completer<ui.Image>();
    AssetImage(ImagePath.DEV).resolve(ImageConfiguration()).addListener(
      ImageStreamListener(
        (ImageInfo image, bool _) {
          completer.complete(image.image);
        },
      ),
    );
    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    double widthOfImage = assignWidth(context: context, fraction: 0.4);

    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    ContentWrapper(
                      width: assignWidth(context: context, fraction: 0.4),
                      color: AppColors.primaryColor,
                      child: Container(
                        margin: EdgeInsets.only(
                          left: Sizes.MARGIN_20,
                          top: Sizes.MARGIN_20,
                          bottom: Sizes.MARGIN_20,
                        ),
                        child: MenuList(
                          menuList: Data.menuList,
                          selectedItemRouteName: HomePage.homePageRoute,
                        ),
                      ),
                    ),
                    ContentWrapper(
                      width: assignWidth(context: context, fraction: 0.6),
                      color: AppColors.secondaryColor,
                      child: TrailingInfo(
                        onLeadingWidgetPressed: () {
                          Functions.launchUrl(StringConst.EMAIL_URL);
//                          Navigator.pushNamed(
//                            context,
//                            ContactPage.contactPageRoute,
//                          );
                        },
                        leadingWidget: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              S.SEND_ME_A_MESSAGE,
                              style: theme.textTheme.bodyLarge!.copyWith(
                                color: AppColors.primaryColor,
                              ),
                            ),
                            SpaceW8(),
                            CircularContainer(
                              width: Sizes.WIDTH_24,
                              height: Sizes.HEIGHT_24,
                              color: AppColors.primaryColor,
                              child: Icon(
                                Icons.add,
                                color: AppColors.secondaryColor,
                                size: Sizes.ICON_SIZE_20,
                              ),
                            )
                          ],
                        ),
                        onTrailingWidgetPressed: () {
                          Navigator.pushNamed(
                            context,
                            PortfolioPage.portfolioPageRoute,
                          );
                        },
                        trailingWidget: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              S.VIEW_PORTFOLIO,
                              style: theme.textTheme.bodyLarge!.copyWith(
                                color: AppColors.primaryColor,
                              ),
                            ),
                            SpaceW8(),
                            CircularContainer(
                              color: AppColors.primaryColor,
                              width: Sizes.WIDTH_24,
                              height: Sizes.HEIGHT_24,
                              child: Icon(
                                Icons.chevron_right,
                                color: AppColors.secondaryColor,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          isDisplaySmallDesktop(context)
              ? FutureBuilder<ui.Image>(
                  future: _getImage(),
                  builder:
                      (BuildContext context, AsyncSnapshot<ui.Image> snapshot) {
                    if (snapshot.hasData) {
                      ui.Image image = snapshot.data!;
                      return Positioned(
                        top: assignHeight(context: context, fraction: 0.0),
                        left: assignWidth(context: context, fraction: 0.5) -
                            (image.width + 100.0) / 2,
                        child: Container(
                          child: Image.asset(
                            ImagePath.DEV,
                            width: (image.width + 100.0),
                            height:
                                assignHeight(context: context, fraction: 1.0),
                            fit: BoxFit.cover,
                            scale: 1.0,
                          ),
                        ),
                      );
                    } else {
                      return Text('Loading...');
                    }
                  },
                )
              : Positioned(
                  top: assignHeight(context: context, fraction: 0.2),
                  left: assignWidth(context: context, fraction: 0.5) -
                      widthOfImage / 2,
                  child: Row(
                    children: [
                      Hero(
                        tag: "profilePic",
                        child: Container(
                          child: CircleAvatar(
                            radius: 150,
                            backgroundImage: AssetImage(ImagePath.DEV),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          SizedBox(
                            width: 400.0,
                            child: DefaultTextStyle(
                              style: const TextStyle(
                                  fontSize: 80.0,
                                  letterSpacing: 5,
                                  fontFamily: 'bluesquare',
                                  fontWeight: FontWeight.w600),
                              child: AnimatedTextKit(
                                totalRepeatCount: 1,
                                animatedTexts: [
                                  TypewriterAnimatedText('/Daniel/',
                                      speed: Duration(milliseconds: 400)),
                                ],
                                onTap: () {
                                  print("Tap Event");
                                },
                              ),
                            ),
                          ),
                          Container(
                              height: 150, child: Image.asset(ImagePath.LOGO)),
                          SizedBox(
                            width: 400.0,
                            child: DefaultTextStyle(
                              style: const TextStyle(
                                fontSize: 30.0,
                              ),
                              child: AnimatedTextKit(
                                pause: Duration(milliseconds: 35),
                                repeatForever: true,
                                animatedTexts: [
                                  TypewriterAnimatedText(
                                      S.TYPED_LINE_1,
                                      speed: Duration(milliseconds: 90)),
                                  TypewriterAnimatedText(
                                      S.TYPED_LINE_2,
                                      speed: Duration(milliseconds: 90)),
                                  TypewriterAnimatedText(S.TYPED_LINE_3,
                                      speed: Duration(milliseconds: 90)),
                                ],
                                onTap: () {
                                  print("Tap Event");
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}

//          Positioned(
////            key: imageKey,
//            top: assignHeight(context: context, fraction: 0.0),
//            left: assignWidth(context: context, fraction: 0.5) - 600 / 2,
//            child: Container(
////              color: Colors.red,
//              child: Image.asset(
//                ImagePath.DEV,
//                width: 600,
//                height: assignHeight(context: context, fraction: 1),
//                fit: BoxFit.cover,
//                scale: 2.0,
//              ),
//            ),
//          ),
