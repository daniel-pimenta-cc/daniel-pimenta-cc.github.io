part of values;

// ponytail: IconData declarados diretamente (não via FaIcons.x)
// porque o tree-shaking de fontes do build web não detecta de forma confiável
// os consts aninhados em FaIconData — glyphs sumiam da fonte no release.
// Codepoints extraídos do font_awesome_flutter 11. Ao atualizar o pacote,
// confira se os codepoints continuam os mesmos.
class FaIcons {
  static const String _pkg = 'font_awesome_flutter';

  static const IconData bootstrap =
      IconData(0xf836, fontFamily: 'FontAwesomeBrands', fontPackage: _pkg);
  static const IconData css3Alt =
      IconData(0xf38b, fontFamily: 'FontAwesomeBrands', fontPackage: _pkg);
  static const IconData database =
      IconData(0xf1c0, fontFamily: 'FontAwesomeSolid', fontPackage: _pkg);
  static const IconData docker =
      IconData(0xf395, fontFamily: 'FontAwesomeBrands', fontPackage: _pkg);
  static const IconData github =
      IconData(0xf09b, fontFamily: 'FontAwesomeBrands', fontPackage: _pkg);
  static const IconData globe =
      IconData(0xf0ac, fontFamily: 'FontAwesomeSolid', fontPackage: _pkg);
  static const IconData html5 =
      IconData(0xf13b, fontFamily: 'FontAwesomeBrands', fontPackage: _pkg);
  static const IconData instagram =
      IconData(0xf16d, fontFamily: 'FontAwesomeBrands', fontPackage: _pkg);
  static const IconData java =
      IconData(0xf4e4, fontFamily: 'FontAwesomeBrands', fontPackage: _pkg);
  static const IconData linkedin =
      IconData(0xf08c, fontFamily: 'FontAwesomeBrands', fontPackage: _pkg);
  static const IconData php =
      IconData(0xf457, fontFamily: 'FontAwesomeBrands', fontPackage: _pkg);
  static const IconData python =
      IconData(0xf3e2, fontFamily: 'FontAwesomeBrands', fontPackage: _pkg);
  static const IconData react =
      IconData(0xf41b, fontFamily: 'FontAwesomeBrands', fontPackage: _pkg);
  static const IconData squareJs =
      IconData(0xf3b9, fontFamily: 'FontAwesomeBrands', fontPackage: _pkg);
  static const IconData telegram =
      IconData(0xf2c6, fontFamily: 'FontAwesomeBrands', fontPackage: _pkg);
  static const IconData twitter =
      IconData(0xf099, fontFamily: 'FontAwesomeBrands', fontPackage: _pkg);
  static const IconData angular =
      IconData(0xf420, fontFamily: 'FontAwesomeBrands', fontPackage: _pkg);
  static const IconData laravel =
      IconData(0xf3bd, fontFamily: 'FontAwesomeBrands', fontPackage: _pkg);
  static const IconData wordpress =
      IconData(0xf19a, fontFamily: 'FontAwesomeBrands', fontPackage: _pkg);
  static const IconData aws =
      IconData(0xf375, fontFamily: 'FontAwesomeBrands', fontPackage: _pkg);
  static const IconData flutter =
      IconData(0xe694, fontFamily: 'FontAwesomeBrands', fontPackage: _pkg);
  static const IconData whatsapp =
      IconData(0xf232, fontFamily: 'FontAwesomeBrands', fontPackage: _pkg);
}
