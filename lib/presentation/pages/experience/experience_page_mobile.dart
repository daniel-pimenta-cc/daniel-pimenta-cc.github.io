import 'package:flutter/material.dart';
import 'package:portfolio_daniel/presentation/pages/experience/experience_page.dart';
import 'package:portfolio_daniel/presentation/widgets/app_drawer.dart';
import 'package:portfolio_daniel/presentation/widgets/custom_app_bar.dart';
import 'package:portfolio_daniel/presentation/widgets/experience_section.dart';
import 'package:portfolio_daniel/presentation/widgets/spaces.dart';
import 'package:portfolio_daniel/values/values.dart';

class ExperiencePageMobile extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.secondaryColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.0),
        child: CustomAppBar(
          title: S.WORK,
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
        selectedItemRouteName: ExperiencePage.experiencePageRoute,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.PADDING_16,
          vertical: Sizes.PADDING_24,
        ),
        itemCount: Data.experienceData.length,
        separatorBuilder: (context, index) => SpaceH24(),
        itemBuilder: (context, index) {
          final experience = Data.experienceData[index];
          return Container(
            padding: const EdgeInsets.all(Sizes.PADDING_16),
            decoration: BoxDecoration(
              color: AppColors.secondaryColor,
              border: Border.all(color: AppColors.primaryColor, width: 1.5),
              borderRadius: BorderRadius.circular(8),
            ),
            child: ExperienceSection(
              position: experience.position,
              company: experience.company,
              duration: experience.duration,
              location: experience.location,
              roles: experience.roles,
              companyUrl: experience.companyUrl,
            ),
          );
        },
      ),
    );
  }
}
