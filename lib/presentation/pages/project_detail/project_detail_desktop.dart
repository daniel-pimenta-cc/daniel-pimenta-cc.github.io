import 'package:flutter/material.dart';
import 'package:portfolio_daniel/core/layout/adaptive.dart';
import 'package:portfolio_daniel/presentation/pages/portfolio/portfolio_page.dart';
import 'package:portfolio_daniel/presentation/widgets/circular_container.dart';
import 'package:portfolio_daniel/presentation/widgets/content_wrapper.dart';
import 'package:portfolio_daniel/presentation/widgets/flicker_text_animation.dart';
import 'package:portfolio_daniel/presentation/widgets/menu_list.dart';
import 'package:portfolio_daniel/presentation/widgets/project_cover_2.dart';
import 'package:portfolio_daniel/presentation/widgets/socials.dart';
import 'package:portfolio_daniel/presentation/widgets/spaces.dart';
import 'package:portfolio_daniel/presentation/widgets/trailing_info.dart';
import 'package:portfolio_daniel/presentation/widgets/void.dart';
import 'package:portfolio_daniel/values/values.dart';

class ProjectDetailDesktop extends StatefulWidget {
  ProjectDetailDesktop({
    required this.projectDetails,
  });

  final ProjectDetails? projectDetails;

  @override
  _ProjectDetailDesktopState createState() => _ProjectDetailDesktopState();
}

class _ProjectDetailDesktopState extends State<ProjectDetailDesktop>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _flickerAnimationController;
  late AnimationController _contentAnimationController;
  late Animation<double> _projectCoverScaleAnimation;
  late Animation<double> _projectBackgroundScaleAnimation;
  late Animation<double> _projectContentAnimation;
  bool _isHeadingVisible = false;
  bool _isContentVisible = false;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _flickerAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _contentAnimationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    initTweens();
    _playAnimation();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _isHeadingVisible = true;
        });
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _playFlickerAnimation();
        });
      }
    });
    _flickerAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _isContentVisible = true;
        });
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _playProjectContentAnimation();
        });
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _flickerAnimationController.dispose();
    _contentAnimationController.dispose();
  }

  initTweens() {
    _projectCoverScaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.0,
          0.5,
          curve: Curves.easeIn,
        ),
      ),
    );
    _projectBackgroundScaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.5,
          1.0,
          curve: Curves.easeIn,
        ),
      ),
    );
    _projectContentAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _contentAnimationController,
        curve: Interval(
          0.0,
          1.0,
          curve: Curves.easeIn,
        ),
      ),
    );
  }

  Future<void> _playAnimation() async {
    try {
      await _controller.forward().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because it was disposed of
    }
  }

  Future<void> _playFlickerAnimation() async {
    try {
      await _flickerAnimationController.forward().orCancel;
      await _flickerAnimationController.reverse().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because it was disposed of
    }
  }

  Future<void> _playProjectContentAnimation() async {
    try {
      await _contentAnimationController.forward().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because it was disposed of
    }
  }

  Widget _buildAnimation(BuildContext context, Widget? child) {
    return Stack(
      children: [
        Container(
          child: Column(
            children: [
              Row(
                children: <Widget>[
                  ContentWrapper(
                    width: assignWidth(
                      context: context,
                      fraction: 0.2,
                    ),
                    color: AppColors.primaryColor,
                    child: Container(
                      margin: EdgeInsets.only(
                        left: Sizes.MARGIN_20,
                        top: Sizes.MARGIN_20,
                        bottom: Sizes.MARGIN_20,
                      ),
                      child: MenuList(
                        menuList: Data.menuList,
                        selectedItemRouteName: PortfolioPage.portfolioPageRoute,
                      ),
                    ),
                  ),
                  ContentWrapper(
                    width: assignWidth(
                      context: context,
                      fraction: 0.8,
                    ),
                    color: AppColors.grey100,
                    child: Row(
                      children: [
                        Container(
                          width: assignWidth(
                            context: context,
                            fraction: 0.7,
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal:
                                assignWidth(context: context, fraction: 0.04),
                            vertical:
                                assignHeight(context: context, fraction: 0.04),
                          ),
                          child: _buildProjectDetailContent(),
                        ),
                        SizedBox(
                          width: assignWidth(
                            context: context,
                            fraction: 0.025,
                          ),
                        ),
                        TrailingInfo(
                          trailingWidget: CircularContainer(
                            color: AppColors.primaryColor,
                            width: Sizes.WIDTH_24,
                            height: Sizes.HEIGHT_24,
                            child: Icon(
                              Icons.chevron_left,
                              color: AppColors.secondaryColor,
                            ),
                          ),
                          onTrailingWidgetPressed: () {
                            Navigator.pushNamed(
                              context,
                              PortfolioPage.portfolioPageRoute,
                            );
                          },
                          width: assignWidth(
                            context: context,
                            fraction: 0.075,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: _buildAnimation,
    );
  }

  Widget _buildProjectDetailContent() {
    double offset = 40.0;
    ThemeData theme = Theme.of(context);
    String? database = widget.projectDetails!.database;

    return Row(
      children: [
        ProjectCover2(
          width: assignWidth(context: context, fraction: 0.30),
          height: heightOfScreen(context),
          offset: offset,
          projectCoverScale: _projectCoverScaleAnimation.value,
          backgroundScale: _projectBackgroundScaleAnimation.value,
          projectCoverBackgroundColor: AppColors.primaryColor,
          projectCoverUrl: widget.projectDetails!.projectImage,
        ),
        SizedBox(
          width: assignWidth(context: context, fraction: 0.03),
        ),
        Container(
          width: assignWidth(context: context, fraction: 0.29),
          padding: EdgeInsets.only(top: offset),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _isHeadingVisible
                  ? FlickerTextAnimation(
                      text: widget.projectDetails!.projectName,
                      textColor: AppColors.primaryColor,
                      fadeInColor: AppColors.primaryColor,
                      fontSize: Sizes.TEXT_SIZE_34,
                      controller: _flickerAnimationController.view,
                    )
                  : Container(),
              SpaceH16(),
              _isContentVisible
                  ? FadeTransition(
                      opacity: _projectContentAnimation,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.projectDetails!.projectDescription,
                            style: theme.textTheme.bodyLarge!.copyWith(
                              color: AppColors.primaryColor,
                              fontSize: Sizes.TEXT_SIZE_16,
                            ),
                          ),
                          SpaceH8(),
                          Text(
                            "Stack:",
                            style: theme.textTheme.titleLarge!.copyWith(
                              color: AppColors.primaryColor,
                              fontSize: Sizes.TEXT_SIZE_14,
                            ),
                          ),
                          SpaceH8(),
                          !widget.projectDetails!.hasBeenReleased!
                              ? Text(
                                  StringConst.COMING_SOON,
                                  style: theme.textTheme.titleLarge!.copyWith(
                                    color: AppColors.primaryColor,
                                    fontSize: Sizes.TEXT_SIZE_16,
                                  ),
                                )
                              : Container(),
                          !widget.projectDetails!.hasBeenReleased!
                              ? SpaceH8()
                              : Container(),
                          Wrap(
                            direction: Axis.horizontal,
                            spacing: 4,
                            runSpacing: 4,
                            children: [
                              widget.projectDetails!.html!
                                  ? SocialButton(
                                      tooltip: "HTML",
                                      icon: FaIcons.html5,
                                      disableMouse: true,
                                    )
                                  : Emptiness(),
                              widget.projectDetails!.css!
                                  ? SocialButton(
                                      tooltip: "CSS",
                                      icon: FaIcons.css3Alt,
                                      disableMouse: true,
                                    )
                                  : Emptiness(),
                              widget.projectDetails!.javascript!
                                  ? SocialButton(
                                      tooltip: "JavaScript",
                                      icon: FaIcons.squareJs,
                                      disableMouse: true,
                                    )
                                  : Emptiness(),
                              widget.projectDetails!.bootstrap!
                                  ? SocialButton(
                                      tooltip: "Bootstrap",
                                      icon: FaIcons.bootstrap,
                                      disableMouse: true,
                                    )
                                  : Emptiness(),
                              widget.projectDetails!.php!
                                  ? SocialButton(
                                      tooltip: "PHP",
                                      icon: FaIcons.php,
                                      disableMouse: true,
                                    )
                                  : Emptiness(),
                              widget.projectDetails!.java!
                                  ? SocialButton(
                                      tooltip: "Java",
                                      icon: FaIcons.java,
                                      disableMouse: true,
                                    )
                                  : Emptiness(),
                              widget.projectDetails!.python!
                                  ? SocialButton(
                                      icon: FaIcons.python,
                                      tooltip: "Python",
                                      disableMouse: true,
                                    )
                                  : Emptiness(),
                              widget.projectDetails!.react!
                                  ? SocialButton(
                                      tooltip: "React",
                                      icon: FaIcons.react,
                                      disableMouse: true,
                                    )
                                  : Emptiness(),
                              widget.projectDetails!.docker!
                                  ? SocialButton(
                                      tooltip: "Docker",
                                      icon: FaIcons.docker,
                                      disableMouse: true,
                                    )
                                  : Emptiness(),
                              widget.projectDetails!.flutter!
                                  ? SocialButton(
                                      tooltip: "Flutter",
                                      icon: FaIcons.flutter,
                                      disableMouse: true,
                                    )
                                  : Emptiness(),
                            ],
                          ),
                          if (database != null && database.isNotEmpty)
                            Row(
                              children: [
                                SocialButton(
                                  icon: FaIcons.database,
                                  iconSize: Sizes.ICON_SIZE_18,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    "Database: ",
                                    style: theme.textTheme.titleLarge!.copyWith(
                                      color: AppColors.primaryColor,
                                      fontSize: Sizes.TEXT_SIZE_12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    "$database",
                                    style: theme.textTheme.titleLarge!.copyWith(
                                      color: AppColors.primaryColor,
                                      fontSize: Sizes.TEXT_SIZE_12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ],
    );
  }
}
