import 'package:flutter/material.dart';
import 'package:portfolio_daniel/core/utils/functions.dart';
import 'package:portfolio_daniel/presentation/widgets/horizontal_bar.dart';
import 'package:portfolio_daniel/values/values.dart';

class Socials extends StatelessWidget {
  Socials({
    this.isHorizontal = false,
    this.isVertical = false,
    this.alignment,
    this.color = AppColors.accentColor2,
    this.barColor = AppColors.accentColor2,
    this.crossAxisAlignment,
  }) : assert(isHorizontal == false || isVertical == false,
            'Both isHorizontal and isVertical cannot be true');

  final bool isVertical;
  final bool isHorizontal;
  final Color color;
  final Color barColor;
  final Alignment? alignment;
  final CrossAxisAlignment? crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return isVertical
        ? Container(
            child: Column(
              crossAxisAlignment: crossAxisAlignment!,
              children: [
                SocialButton(
                  icon: FaIcons.github,
                  alignment: alignment,
                  onPressed: () {
                    Functions.launchUrl(StringConst.GITHUB_URL);
                  },
                  color: color,
                ),
                HorizontalBar(
                  width: Sizes.WIDTH_32,
                  color: barColor,
                  margin: EdgeInsets.symmetric(vertical: Sizes.MARGIN_4),
                ),
                SocialButton(
                  icon: FaIcons.linkedin,
                  alignment: alignment,
                  onPressed: () {
                    Functions.launchUrl(StringConst.LINKED_IN_URL);
                  },
                  color: color,
                ),

              ],
            ),
          )
        : IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialButton(
                  icon: FaIcons.github,
                  alignment: alignment,
                  onPressed: () {
                    Functions.launchUrl(StringConst.GITHUB_URL);
                  },
                  color: color,
                ),
                VerticalDivider(
                  width: Sizes.WIDTH_8,
                  thickness: 2,
                  color: barColor,
                ),
                SocialButton(
                  icon: FaIcons.linkedin,
                  alignment: alignment,
                  onPressed: () {
                    Functions.launchUrl(StringConst.LINKED_IN_URL);
                  },
                  color: color,
                ),

              ],
            ),
          );
  }
}

class SocialButton extends StatelessWidget {
  SocialButton(
      {this.padding = const EdgeInsets.all(Sizes.PADDING_0),
      this.onPressed,
      this.color = AppColors.accentColor2,
      this.icon = Icons.public,
      this.iconSize = Sizes.ICON_SIZE_24,
      this.alignment = Alignment.center,
      this.disableMouse = false,
      this.tooltip = ""});

  final EdgeInsetsGeometry padding;
  final VoidCallback? onPressed;
  final Color color;
  final IconData icon;
  final double iconSize;
  final Alignment? alignment;
  final String? tooltip;
  final bool disableMouse;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      mouseCursor:
          disableMouse ? SystemMouseCursors.basic : SystemMouseCursors.click,
      tooltip: tooltip,
      padding: padding,
      onPressed: onPressed,
      alignment: alignment!,
      icon: Icon(
        icon,
        color: color,
        size: iconSize,
      ),
    );
  }
}
