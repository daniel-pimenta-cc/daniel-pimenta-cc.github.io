import 'package:flutter/material.dart';
import 'package:portfolio_daniel/core/layout/adaptive.dart';
import 'package:portfolio_daniel/presentation/pages/portfolio/portfolio_page.dart';
import 'package:portfolio_daniel/presentation/pages/project_detail/project_detail.dart';
import 'package:portfolio_daniel/presentation/routes/routes.dart';
import 'package:portfolio_daniel/presentation/widgets/app_drawer.dart';
import 'package:portfolio_daniel/presentation/widgets/content_wrapper.dart';
import 'package:portfolio_daniel/presentation/widgets/custom_app_bar.dart';
import 'package:portfolio_daniel/presentation/widgets/portfolio_card.dart';
import 'package:portfolio_daniel/presentation/widgets/spaces.dart';
import 'package:portfolio_daniel/values/values.dart';

class PortfolioPageMobile extends StatefulWidget {
  @override
  _PortfolioPageMobileState createState() => _PortfolioPageMobileState();
}

class _PortfolioPageMobileState extends State<PortfolioPageMobile>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  late AnimationController _portfolioController;

  @override
  void initState() {
    _portfolioController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _playPortfolioAnimation();
    super.initState();
  }

  Future<void> _playPortfolioAnimation() async {
    try {
      await _portfolioController.forward().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because it was disposed of
    }
  }

  @override
  void dispose() {
    _portfolioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double duration =
        _portfolioController.duration!.inMilliseconds.roundToDouble();
    double durationForEachPortfolio =
        _portfolioController.duration!.inMilliseconds.roundToDouble() /
            Data.portfolioData.length;

    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.0),
        child: CustomAppBar(
          title: S.PORTFOLIO,
          onLeadingPressed: () {
            if (_scaffoldKey.currentState!.isEndDrawerOpen) {
              _scaffoldKey.currentState!.openEndDrawer();
            } else {
              _scaffoldKey.currentState!.openDrawer();
            }
          },
        ),
      ),
      drawer: AppDrawer(
        menuList: Data.menuList,
        selectedItemRouteName: PortfolioPage.portfolioPageRoute,
      ),
      body: ContentWrapper(
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.PADDING_24,
            vertical: Sizes.PADDING_16,
          ),
          itemCount: Data.portfolioData.length,
          separatorBuilder: (BuildContext context, index) {
            return SpaceH20();
          },
          itemBuilder: (BuildContext context, index) {
            double start = durationForEachPortfolio * index;
            double end = durationForEachPortfolio * (index + 1);
            return AnimatedBuilder(
              animation: _portfolioController,
              child: PortfolioCard(
                imageUrl: Data.portfolioData[index].image,
                title: Data.portfolioData[index].title,
                subtitle: Data.portfolioData[index].subtitle,
                actionTitle: S.VIEW,
                height: assignHeight(context: context, fraction: 0.35),
                width: widthOfScreen(context),
                onTap: () {
                  _navigateToProjectDetail(
                    projectDetails: ProjectDetails(
                      projectImage: Data.portfolioData[index].image,
                      projectName: Data.portfolioData[index].title,
                      projectDescription:
                          Data.portfolioData[index].portfolioDescription,
                      isPublic: Data.portfolioData[index].isPublic,
                      isLive: Data.portfolioData[index].isLive,
                      python: Data.portfolioData[index].python,
                      database: Data.portfolioData[index].database,
                      flutter: Data.portfolioData[index].flutter,
                      docker: Data.portfolioData[index].docker,
                      react: Data.portfolioData[index].react,
                      css: Data.portfolioData[index].css,
                      html: Data.portfolioData[index].html,
                      javascript: Data.portfolioData[index].javascript,
                      bootstrap: Data.portfolioData[index].bootstrap,
                      php: Data.portfolioData[index].php,
                      java: Data.portfolioData[index].java,
                      wordpress: Data.portfolioData[index].wordpress,
                      isOnPlayStore: Data.portfolioData[index].isOnPlayStore,
                      gitHubUrl: Data.portfolioData[index].gitHubUrl,
                      hasBeenReleased:
                          Data.portfolioData[index].hasBeenReleased,
                      technologyUsed: Data.portfolioData[index].technologyUsed,
                      playStoreUrl: Data.portfolioData[index].playStoreUrl,
                      webUrl: Data.portfolioData[index].webUrl,
                    ),
                  );
                },
              ),
              builder: (BuildContext context, Widget? child) {
                return FadeTransition(
                  opacity: Tween<double>(
                    begin: 0,
                    end: 1,
                  ).animate(
                    CurvedAnimation(
                      parent: _portfolioController,
                      curve: Interval(
                        start > 0.0 ? start / duration : 0.0,
                        end > 0.0 ? end / duration : 1.0,
                        curve: Curves.easeIn,
                      ),
                    ),
                  ),
                  child: child,
                );
              },
            );
          },
        ),
      ),
    );
  }

  void _navigateToProjectDetail({
    required ProjectDetails projectDetails,
  }) {
    Navigator.push(
      context,
      NoAnimationMaterialPageRoute(
        builder: (context) => ProjectDetailPage(
          projectDetails: projectDetails,
        ),
      ),
    );
  }
}
