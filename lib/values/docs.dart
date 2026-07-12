part of values;

class DocumentPath {
  //Docs
  static const String CV_PT = "cv/daniel_pimenta_cv.pdf";
  static const String CV_EN = "cv/daniel_pimenta_cv_en.pdf";

  /// CV no idioma ativo do site.
  static String get CV => I18n.locale.value == "en" ? CV_EN : CV_PT;
}
