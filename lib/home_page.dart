import 'package:flutter/material.dart';
import 'app_theme.dart';
import 'widgets/apple_nav.dart';
import 'widgets/apple_hero.dart';
import 'widgets/apple_footer.dart';
import 'sections/s1_intro.dart';
import 'sections/s2_one_god.dart';
import 'sections/s3_why_religion.dart';
import 'sections/s4_guidance.dart';
import 'sections/s5_god_table.dart';
import 'sections/s6_prophet_table.dart';
import 'sections/s7_misconceptions.dart';
import 'sections/s8_science.dart';
import 'sections/s9_life_test.dart';
import 'sections/s10_kalki.dart';
import 'sections/s11_heart.dart';
import 'v2/v2_home_page.dart';
import 'v3/v3_home_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _sc = ScrollController();
  int _version = 1;

  final _keys = <String, GlobalKey>{
    'home': GlobalKey(),
    'onegod': GlobalKey(),
    'prophet': GlobalKey(),
    'why': GlobalKey(),
    'science': GlobalKey(),
    'life': GlobalKey(),
  };

  void _scrollTo(String id) {
    final k = _keys[id];
    if (k?.currentContext != null) {
      Scrollable.ensureVisible(k!.currentContext!,
          duration: const Duration(milliseconds: 600), curve: Curves.easeInOut);
    }
  }

  @override
  void dispose() {
    _sc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: C.bg,
      body: Stack(
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            child: _version == 1
                ? _buildV1()
                : _version == 2
                    ? const V2HomePage(key: ValueKey('v2'))
                    : const V3HomePage(key: ValueKey('v3')),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppleNav(
              onTap: _scrollTo,
              activeVersion: _version,
              onVersionChanged: (v) => setState(() => _version = v),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildV1() {
    return SingleChildScrollView(
      key: const ValueKey('v1'),
      controller: _sc,
      child: Column(
        children: [
          const SizedBox(height: 48), // nav height offset
          AppleHero(key: _keys['home']),
          const S1Intro(),
          S2OneGod(key: _keys['onegod']),
          const S3WhyReligion(),
          const S4Guidance(),
          S5GodTable(key: _keys['why']),
          S6ProphetTable(key: _keys['prophet']),
          const S7Misconceptions(),
          S8Science(key: _keys['science']),
          S9LifeTest(key: _keys['life']),
          const S10Kalki(),
          const S11Heart(),
          const AppleFooter(),
        ],
      ),
    );
  }
}
