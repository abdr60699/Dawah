import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../widgets/apple_section.dart';
import '../widgets/apple_card_grid.dart';

class S8Science extends StatelessWidget {
  const S8Science({super.key});

  @override
  Widget build(BuildContext context) {
    final m = isMobile(context);
    return Column(
      children: [
        // Intro
        Sec(
          bg: C.bg,
          child: Column(
            children: [
              const Headline(
                'Science &\nThe Quran.',
                sub: 'An educated atheist believes that scientific knowledge is the ultimate test.',
              ),
              const SizedBox(height: 8),
              Text(
                'Video: Is the Qur\'an God\'s Word? by Dr Zakir Naik Full Lecture',
                textAlign: TextAlign.center,
                style: TextStyle(color: C.caption, fontSize: 13),
              ),
              const SizedBox(height: 32),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 720),
                child: const Body(
                  'Aforementioned are just a few Scientific facts mentioned in the QURAN that are 100% correct. how can a man state these things 1400 years ago, considering that many technologies were invented after that? Let\'s take some scientists as examples - Albert Einstein and Isaac Newton are mainly known for physics. They were known for their respective subjects, and most of them spent the majority of their time in those fields. However, Prophet Muhammad PBUH lived for 23 years as a prophet in the world, and the QURAN described him as an unlettered Prophet.',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        // Probability
        Sec(
          bg: C.white,
          child: Column(
            children: [
              const Headline(
                'Theory of\nProbability.',
                sub: 'If you have two options, one right and one wrong, the chance is 50%.',
              ),
              const SizedBox(height: 40),
              CardGrid(
                children: [
                  _probCard('Moonlight', 'MOONLIGHT IS EITHER REFLECTED LIGHT OR ITS OWN LIGHT?',
                      'The chance to be right is 50%, which is 1/2.', '1/2', C.accent),
                  _probCard('Shape of Earth', 'It can be a TRIANGLE, RECTANGLE, SQUARE, etc.',
                      'So, let\'s take 10 shapes. The chance to be right is 1/10.', '1/10', C.green),
                  _probCard('Human Creation', 'THE MATERIAL CAN BE GOLD, IRON, PLASTIC, etc.',
                      'Let\'s take 1000 items. The chance to be right is 1/1000.', '1/1000', C.red),
                  PCard(
                    title: 'The Result',
                    bg: const Color(0xFFFFFBEB),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '(1/2) × (1/10) × (1/1000) = 0.00005',
                          style: TextStyle(
                            color: C.gold,
                            fontSize: m ? 20 : 24,
                            fontWeight: FontWeight.w800,
                            letterSpacing: -0.5,
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Body(
                          'According to MATHEMATICS, it is nearly zero. With these three things alone, it\'s enough to prove that QURAN is from GOD. It is beyond human capacity to make all the guesses correct without a single mistake.',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        // Conclusion
        Sec(
          bg: C.bg,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: Column(
              children: const [
                Body(
                  'The only logical answer to the 2nd question, who could have mentioned all these scientific facts 1400 years ago before they were discovered is exactly the same answer initially given by the atheist or any person, for the question who will be the first person to be able to tell the mechanism of the unknown object. It is the \'Creator\'. Another name for this \'Creator, of the whole universe and its contents, in the English language is \'God\', or more appropriate in the Arabic language is \'ALLAH.\'',
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24),
                Quote(
                  'A famous scientist, Francis Bacon has rightly said, a little knowledge of science makes you an atheist, but in-depth study of science makes you a believer in God.',
                  source: 'Francis Bacon',
                ),
                SizedBox(height: 8),
                Body(
                  'Scientists today are eliminating models of God, but they are not eliminating God. Prof Tejasen conducted research on pain receptors and was impressed by the scientific accuracy of the Qur\'anic verse and He publicly accepted Islam.',
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                Quote(
                  'Soon will We show them our Signs in the (furthest) regions (of the earth), and in their own souls, until it becomes clear to them that this is the Truth. Is it not enough that thy Lord doth witness all things?',
                  source: 'Quran 41:53',
                  accent: C.gold,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _probCard(String title, String q, String a, String odds, Color c) {
    return PCard(
      title: title,
      bg: C.bg,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(q,
              style: TextStyle(
                  color: c, fontSize: 13, fontWeight: FontWeight.w700, height: 1.5)),
          const SizedBox(height: 8),
          Body(a),
          const Spacer(),
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: c.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Text(odds,
                style: TextStyle(color: c, fontWeight: FontWeight.w800, fontSize: 18)),
          ),
        ],
      ),
    );
  }
}
