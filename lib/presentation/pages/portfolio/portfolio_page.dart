import 'package:flutter/material.dart';
import 'package:portfolio_daniel/presentation/pages/portfolio/portfolio_page_desktop.dart';
import 'package:portfolio_daniel/presentation/pages/portfolio/portfolio_page_mobile.dart';
import 'package:portfolio_daniel/values/values.dart';
import 'package:responsive_builder/responsive_builder.dart';

//TODO:: Add elevation and shadow to portfolio cards..
class PortfolioPage extends StatelessWidget {
  static const String portfolioPageRoute = StringConst.PORTFOLIO_PAGE;

  const PortfolioPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenTypeLayout.builder(
        mobile: (_) => PortfolioPageMobile(),
        tablet: (_) => PortfolioPageDesktop(),
        desktop: (_) => PortfolioPageDesktop(),
      ),
    );
  }
}
