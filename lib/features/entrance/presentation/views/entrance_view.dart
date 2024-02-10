import 'package:career_craft/core/utils/components.dart';
import 'package:career_craft/features/entrance/presentation/views/widgets/entrance_body.dart';
import 'package:flutter/material.dart';

class EntranceView extends StatelessWidget {
  const EntranceView({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context),
      body: EntranceBody(),
    );
  }
}
