import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_daniel/app_theme.dart';
import 'package:portfolio_daniel/presentation/routes/routes.dart';
import 'package:portfolio_daniel/presentation/widgets/whatsapp_button.dart';
import 'package:portfolio_daniel/values/values.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GoogleFonts.config.allowRuntimeFetching = false;
  I18n.init(WidgetsBinding.instance.platformDispatcher.locale.languageCode);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: I18n.locale,
      builder: (context, locale, _) => MaterialApp(
        // ponytail: key troca o Navigator inteiro no toggle de idioma; a rota
        // atual é preservada pela URL do navegador
        key: ValueKey(locale),
        title: StringConst.APP_TITLE,
        theme: AppTheme.lightThemeData,
        debugShowCheckedModeBanner: false,
        initialRoute: I18n.initialRoute,
        onGenerateRoute: RouteConfiguration.onGenerateRoute,
        builder: (context, child) => Stack(
          textDirection: TextDirection.ltr,
          children: [
            if (child != null) child,
            const Positioned(
              right: 20,
              bottom: 20,
              child: WhatsAppButton(),
            ),
          ],
        ),
      ),
    );
  }
}
