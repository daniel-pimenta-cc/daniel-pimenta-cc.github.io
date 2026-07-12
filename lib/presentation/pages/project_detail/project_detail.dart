import 'package:flutter/material.dart';
import 'package:portfolio_daniel/presentation/pages/project_detail/project_detail_desktop.dart';
import 'package:portfolio_daniel/presentation/pages/project_detail/project_detail_mobile.dart';
import 'package:portfolio_daniel/values/values.dart';
import 'package:responsive_builder/responsive_builder.dart';

//TODO:: Add elevation and shadow to project covers cards..
class ProjectDetailPage extends StatelessWidget {
  static const String projectDetailPageRoute = StringConst.PROJECT_DETAIL_PAGE;

  const ProjectDetailPage({
    this.projectDetails,
    Key? key,
  }) : super(key: key);

  final ProjectDetails? projectDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenTypeLayout.builder(
        mobile: (_) => ProjectDetailMobile(
          projectDetails: projectDetails,
        ),
        tablet: (_) => ProjectDetailDesktop(
          projectDetails: projectDetails,
        ),
        desktop: (_) => ProjectDetailDesktop(
          projectDetails: projectDetails,
        ),
      ),
    );
  }
}
