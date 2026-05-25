import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../widgets/apple_section.dart';
import '../widgets/apple_card_grid.dart';

class S4Guidance extends StatelessWidget {
  const S4Guidance({super.key});

  @override
  Widget build(BuildContext context) {
    return Sec(
      bg: C.white,
      child: Column(
        children: [
          const Headline(
            'Why We Need\nGuidance.',
            sub: 'Allah shows you from the start what is good & bad for us.',
          ),
          const SizedBox(height: 40),
          CardGrid(
            children: [
              PCard(
                title: 'The Forest Analogy',
                bg: C.bg,
                child: const Body(
                  'It\'s like walking in a forest without knowing which fruits are safe to eat. If you pick the wrong one, you might get sick. So, it\'s smart to ask someone who knows about the forest and its fruits. Similarly, in life, it\'s wise to seek guidance from someone who knows what\'s best for you. If you behave like a person, not asking anyone, you may stumble.',
                ),
              ),
              PCard(
                title: 'Morality Needs Religion',
                bg: C.bg,
                child: const Body(
                  'You can\'t prove logically & scientifically why robbing is bad for me. If you argue that the police will catch you, I can assure you that I have influence over them. The only way I see it as wrong is because of religion. That even if I robbed and if I go without punishment in this world, In the hereafter, I will be punished. If I don\'t follow religion, I can be a robber.',
                ),
              ),
              PCard(
                title: 'Justice in the Hereafter',
                bg: C.bg,
                child: const Body(
                  'Imagine if a person kills 100 people. We can only kill (punish) him once. But what about the rest of the 99 people? So, logically, we can\'t give any punishment. But Almighty God can punish him in the hereafter, He can kill him 99 times. Here, we cannot. Therefore, to be a good human being, you have to believe in religion. You have to identify who our God is and understand what is considered good and bad for human beings according to religious teachings. Only then will you be on the straight path.',
                ),
              ),
              PCard(
                title: 'Purpose of Our Life',
                bg: C.bg,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Body(
                      'Note: Only Quran is in its 100% pure form & passes scientific tests where other holy books do not.',
                    ),
                    SizedBox(height: 12),
                    Quote(
                      'And I (Allah) created not the jinns & humans except they should worship Me (Alone).',
                      source: 'Quran Chapter 51 Verse 56',
                      accent: C.green,
                    ),
                    Quote(
                      'Do they not consider the Qur\'an (with care)? Had it been from other Than Allah, they would surely have found therein Much contradiction.',
                      source: 'Quran Chapter 4 Verse 82',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
