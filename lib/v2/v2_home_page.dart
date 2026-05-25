import 'package:flutter/material.dart';
import 'v2_hero.dart';
import 'v2_card_section.dart';
import 'v2_cta_section.dart';
import 'v2_footer.dart';

class V2HomePage extends StatelessWidget {
  const V2HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 56),
          V2Hero(),
          V2CardSection(),
          V2CtaSection(),
          V2Footer(),
        ],
      ),
    );
  }
}
