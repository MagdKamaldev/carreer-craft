import 'package:career_craft/core/constants.dart';
import 'package:career_craft/core/utils/app_bars.dart';
import 'package:career_craft/core/utils/components.dart';
import 'package:career_craft/core/utils/locale.dart';
import 'package:career_craft/features/settings/categories/language/presentation/widgets/language_options.dart';
import 'package:career_craft/generated/l10n.dart';
import 'package:flutter/material.dart';


class LanguageView extends StatefulWidget {
  const LanguageView({super.key});

  @override
  State<LanguageView> createState() => _LanguageViewState();
}

class _LanguageViewState extends State<LanguageView> {
  @override
  Widget build(BuildContext context) {
    bool isEnglishSelected = langCode == 'en';
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: settingsAppBar(context, S.of(context).language),
      body: Padding(
        padding: EdgeInsets.all(size.height * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 0.1),
            Text(
              S.of(context).selectLanguage,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: size.height * 0.1),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                children: [
                  LanguageOption(
                    title: S.of(context).english,
                    value: 'en',
                    isSelected: isEnglishSelected,
                    onTap: () {
                      setState(() {
                        langCode = "en";
                        isEnglishSelected = true;
                        kLangBox.put('lang', langCode);
                      });
                    },
                  ),
                  LanguageOption(
                    title: S.of(context).arabic,
                    value: 'ar',
                    isSelected: !isEnglishSelected,
                    onTap: () {
                      setState(() {
                        isEnglishSelected = false;
                        langCode = "ar";
                        kLangBox.put('lang', langCode);
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
            Text(
              S.of(context).restartToNotice,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.grey),
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
            defaultButton(
                function: () {
                  Navigator.pop(context);
                },
                context: context,
                text: S.of(context).save)
          ],
        ),
      ),
    );
  }
}
