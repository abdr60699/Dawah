import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../widgets/apple_section.dart';

class S9LifeTest extends StatelessWidget {
  const S9LifeTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Sec(
          bg: C.white,
          child: Column(
            children: [
              const Headline(
                'Is There Life\nAfter Death?',
                sub: 'Who would like to undergo this test?',
              ),
              const SizedBox(height: 36),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 720),
                child: Column(
                  children: const [
                    Body(
                      'Allah SWT asked us, "Who would like to undergo this test?" Of course, you and I don\'t remember, on the Day of Judgment again, we will remember. So Allah says in the Quran that the mountains shuddered. We, human beings, were fools. We accepted the challenge. If we pass, we become higher than the angels. You know, angels are creations of Allah who follow everything that Allah says. They have no option and they can\'t go against Allah. However, we human beings have free will and we have the option to go against Allah or follow the commandment of Allah.',
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    Quote(
                      'If we follow the commandment of Allah after being given the free will, we become higher than the Angels and live in Paradise forever. If we don\'t follow, we go below.',
                      accent: C.green,
                    ),
                    SizedBox(height: 12),
                    Body(
                      'so Allah asked us, do you want to undergo the test where all the others are Muslims? The trees and mountains are Muslim. So we were human beings who said we wanted to undergo the test. so Allah created a new creation "human beings" who had a free will of their own and we were the people who opted and now we are undergoing the test, and guide is the Quran. The instruction manual of the human being is the Quran.',
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 12),
                    Body(
                      'When you appear for an examination, there\'s a textbook right? The textbook of the examination is the Quran and the guide of the Quran is the sahih Hadith.',
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 12),
                    Body(
                      'Now we are undergoing the test in this world. A test for the hereafter and that\'s the reason we are trying to score higher marks. If we pass, we go to heaven. If we fail, we go to hell. That is the reason we say that the minimum thing to come just pass marks is to believe in one God and believe Prophet Muhammad is the messenger & servant of god.',
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    Quote(
                      'We did indeed offer the Trust to the Heavens and the Earth and the Mountains; but they refused to undertake it, being afraid thereof: but man undertook it;- He was indeed unjust and foolish.',
                      source: 'Quran Chapter 33 : Verse 72',
                      accent: C.red,
                    ),
                    Quote(
                      'He Who created Death and Life, that He may try which of you is best in deed: and He is the Exalted in Might, Oft-Forgiving.',
                      source: 'Quran Chapter 67 : Verse 2',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // Why Islam best way
        Sec(
          bg: C.bg,
          child: Column(
            children: [
              const Headline(
                'Why is Islam the\nBest Way of Life?',
                sub: 'Most religions say good things and discourage crimes.',
              ),
              const SizedBox(height: 36),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 720),
                child: Column(
                  children: const [
                    Body(
                      'Islam uniquely provides a practical way to achieve a state in which people will not rob or molest, etc. The USA is an advanced country, but it has the highest rates of robbery in the world.',
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16),
                    Body(
                      'In Islam we have System Called Zakat. if you implement Islamic Sharia in the USA, where every rich man with savings of more than 85 grams of gold should give 2.5% of that excess wealth in charity, which is zakat, and if any person robs, chop off his or her hand as punishment. Surely the rate of robbery will decrease. It\'s a practical law. Implement Sharia and you get results. In Saudi Arabia, the rate of robbery is very low.',
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16),
                    Quote(
                      'if any one kill a person - unless it be for murder or for spreading mischief in the land - it would be as if he kill the whole humanity and if any one saved a life, it would be as if he saved the life of the whole humanity.',
                      source: 'Quran Chapter 5 Verse 32',
                      accent: C.green,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
