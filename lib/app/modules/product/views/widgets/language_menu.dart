import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nano_shop/app/modules/product/controllers/language_controller.dart';
import 'package:nano_shop/app/modules/product/controllers/theme_controller.dart';

class LanguageMenu extends StatelessWidget {
  const LanguageMenu({super.key, required this.languageController});

  final LanguageController languageController;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (_) {
        return PopupMenuButton<String>(
          tooltip: 'language'.tr,
          icon: Icon(Icons.language),
          onSelected: (String value) {
            switch (value) {
              case 'ar':
                languageController.changeLanguage('ar');
                break;
              case 'zh':
                languageController.changeLanguage('zh');
                break;
              case 'en':
                languageController.changeLanguage('en');
                break;
              case 'fr':
                languageController.changeLanguage('fr');
                break;
              case 'de':
                languageController.changeLanguage('de');
                break;
              case 'hi':
                languageController.changeLanguage('hi');
                break;
              case 'ja':
                languageController.changeLanguage('ja');
                break;
              case 'pt':
                languageController.changeLanguage('pt');
                break;
              case 'es':
                languageController.changeLanguage('es');
                break;
            }
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            PopupMenuItem<String>(value: 'ar', child: Text('arabic')),
            PopupMenuItem<String>(value: 'en', child: Text('english')),
            PopupMenuItem<String>(value: 'zh', child: Text('chinese')),
            PopupMenuItem<String>(value: 'fr', child: Text('french')),
            PopupMenuItem<String>(value: 'de', child: Text('german')),
            PopupMenuItem<String>(value: 'hi', child: Text('hindi')),
            PopupMenuItem<String>(value: 'ja', child: Text('japanese')),
            PopupMenuItem<String>(value: 'pt', child: Text('portuguese')),
            PopupMenuItem<String>(value: 'es', child: Text('spanish')),
          ],
        );
      },
    );
  }
}
