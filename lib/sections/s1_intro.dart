import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../widgets/apple_section.dart';
import '../widgets/apple_card_grid.dart';

class S1Intro extends StatelessWidget {
  const S1Intro({super.key});

  @override
  Widget build(BuildContext context) {
    return Sec(
      bg: C.white,
      child: Column(
        children: [
          const Headline(
            'Think About\nLife\'s Purpose',
            sub: 'We\'re born, work hard to save money, then we die. Why?',
          ),
          const SizedBox(height: 40),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: const Body(
              'Ever think about life\'s cycle? Sometimes it Seems pointless, especially if we can\'t enjoy what we save. Ever wonder about not being born? Are You an Atheist? Why Should a Human Being Follow a Religion? We, as human beings, were fools. We accept the test of this world? Answers are there on the next pages.',
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 36),
          // Common ground card
          FlatCard(
            bg: const Color(0xFFF0FDF4),
            child: Column(
              children: [
                Text(
                  '* Kindly follow what is common between us & you at least *',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: C.green,
                    fontSize: isMobile(context) ? 16 : 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 16),
                const Body(
                  'All religious [ Christianity = Hinduism = Islam = Judaism = Sikhism = Zoroastrianism or Parsism ] scriptures confirm that there is only One God (without Images & idols) and acknowledge the arrival of Prophet MUHAMMAD (PBUH)',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  'However, Many do not know this because their preachers/scholars are hiding the facts for their worldly benefits.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: C.caption, fontSize: 14, height: 1.5),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: Column(
              children: const [
                Quote(
                  'Say, "O People of the Scripture, come to a word that is equitable between us and you - that we will not worship except Allah and not associate anything with Him and not take one another as lords instead of Allah." But if they turn away, then say, "Bear witness that we are Muslims [submitting to Him].',
                  source: 'Quran Chapter 3 : Verse 64 — One of the Master Key for Success',
                  accent: C.green,
                ),
                SizedBox(height: 8),
                Quote(
                  'Science without religion is lame, religion without science is blind.',
                  source: 'Albert Einstein',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
