import 'package:flutter/material.dart';
import 'package:portfolio_daniel/values/values.dart';

/// "PT | EN" com o idioma ativo em destaque; clicar alterna o idioma do site.
class LanguageToggle extends StatelessWidget {
  const LanguageToggle({this.color, Key? key}) : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    final c = color ?? AppColors.secondaryColor;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _option(context, "PT", "pt", c),
        Text(" | ", style: TextStyle(color: c)),
        _option(context, "EN", "en", c),
      ],
    );
  }

  Widget _option(BuildContext context, String label, String code, Color c) {
    final active = I18n.locale.value == code;
    return InkWell(
      onTap: active
          ? null
          : () => I18n.toggleFrom(ModalRoute.of(context)?.settings.name),
      child: Text(
        label,
        style: TextStyle(
          color: c,
          fontSize: Sizes.TEXT_SIZE_14,
          letterSpacing: 1.5,
          fontWeight: active ? FontWeight.w700 : FontWeight.w300,
          decoration: active ? TextDecoration.underline : TextDecoration.none,
        ),
      ),
    );
  }
}
