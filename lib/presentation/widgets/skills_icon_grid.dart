import 'package:flutter/material.dart';
import 'package:portfolio_daniel/values/values.dart';

// Ordenados por demanda de mercado. Ícones de FaIcons (IconData diretos,
// à prova do tree-shaking de fontes — ver lib/values/fa_icons.dart).
const List<(String, IconData)> _skills = [
  ('Python', FaIcons.python),
  ('JavaScript', FaIcons.squareJs),
  ('Flutter', FaIcons.flutter),
  ('AWS', FaIcons.aws),
  ('Docker', FaIcons.docker),
  ('Java', FaIcons.java),
  ('Angular', FaIcons.angular),
  ('PHP', FaIcons.php),
  ('Laravel', FaIcons.laravel),
  ('HTML', FaIcons.html5),
  ('CSS', FaIcons.css3Alt),
  ('Bootstrap', FaIcons.bootstrap),
  ('Wordpress', FaIcons.wordpress),
];

class SkillsIconGrid extends StatelessWidget {
  const SkillsIconGrid({this.color, Key? key}) : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    final c = color ?? AppColors.accentColor2;
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 4,
      children: [
        for (final (name, icon) in _skills)
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: Sizes.ICON_SIZE_40, color: c),
              const SizedBox(height: 8),
              Text(
                name,
                style: TextStyle(
                  fontSize: Sizes.TEXT_SIZE_12,
                  color: c,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
      ],
    );
  }
}
