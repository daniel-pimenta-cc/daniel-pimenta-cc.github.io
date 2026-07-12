import 'package:flutter/material.dart';
import 'package:portfolio_daniel/core/utils/functions.dart';
import 'package:portfolio_daniel/presentation/widgets/socials.dart';
import 'package:portfolio_daniel/presentation/widgets/spaces.dart';
import 'package:portfolio_daniel/values/values.dart';
import 'language_toggle.dart';
import 'menu_item.dart';

class MenuList extends StatelessWidget {
  MenuList({
    required this.menuList,
    this.selectedItemRouteName,
  });

  final List<MenuData> menuList;
  final String? selectedItemRouteName;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ..._buildMenuList(menuList: menuList, context: context),
        SpaceH20(),
        LanguageToggle(),
        Spacer(
          flex: 1,
        ),
        Socials(
          isVertical: true,
          alignment: Alignment.centerLeft,
          color: AppColors.secondaryColor,
          barColor: AppColors.secondaryColor,
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
        Spacer(
          flex: 1,
        ),
        Text(
          StringConst.DEV_NAME,
          style: theme.textTheme.headlineMedium!.copyWith(
            color: AppColors.secondaryColor,
          ),
        ),
        Text(
          S.SPECIALITY,
          style: theme.textTheme.titleLarge!.copyWith(
            color: AppColors.secondaryColor,
          ),
        ),
        SpaceH20(),
      ],
    );
  }

  List<Widget> _buildMenuList({
    required BuildContext context,
    required List<MenuData> menuList,
  }) {
    List<Widget> menuItems = [];
    for (var i = 0; i < menuList.length; i++) {
      menuItems.add(
        MenuItems(
          onTap: () {
            if (menuList[i].title == S.RESUME) {
              Functions.launchUrl(DocumentPath.CV);
            } else if (menuList[i].title == StringConst.CONTACT) {
              Functions.launchUrl(StringConst.EMAIL_URL);
            } else {
              Navigator.of(context).pushNamed(menuList[i].routeName);
            }
          },
          title: menuList[i].title,
          selected:
              selectedItemRouteName == menuList[i].routeName ? true : false,
        ),
      );
      menuItems.add(SpaceH4());
    }
    return menuItems;
  }
}
