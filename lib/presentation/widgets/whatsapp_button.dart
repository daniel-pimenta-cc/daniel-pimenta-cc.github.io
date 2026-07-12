import 'package:flutter/material.dart';
import 'package:portfolio_daniel/core/utils/functions.dart';
import 'package:portfolio_daniel/values/values.dart';

/// Botão flutuante de WhatsApp, exibido em todas as páginas via
/// MaterialApp.builder (fora do Navigator — por isso não usa Theme).
class WhatsAppButton extends StatelessWidget {
  const WhatsAppButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFF25D366),
      shape: const CircleBorder(),
      elevation: 6,
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: () => Functions.launchUrl(StringConst.WHATSAPP_URL),
        child: const Padding(
          padding: EdgeInsets.all(14),
          child: Icon(FaIcons.whatsapp, color: Colors.white, size: 28),
        ),
      ),
    );
  }
}
