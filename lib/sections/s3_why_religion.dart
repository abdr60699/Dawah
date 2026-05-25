import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../widgets/apple_section.dart';
import '../widgets/apple_card_grid.dart';

class S3WhyReligion extends StatelessWidget {
  const S3WhyReligion({super.key});

  @override
  Widget build(BuildContext context) {
    return Sec(
      bg: C.bg,
      child: Column(
        children: [
          const Headline(
            'Why Follow\nReligion?',
            sub: 'Isn\'t being kind to all sufficient?',
          ),
          const SizedBox(height: 40),
          CardGrid(
            children: [
              PCard(
                title: 'The Instruction Manual',
                subtitle: 'What is the definition of kindness?',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Body(
                      'So, as religion (Islam) basically means a way of life. If you get a complicated machine, you receive an instruction manual to understand it. Similarly, as humans are the most complex machines on Earth, So Don\'t you think this requires an instruction manual?',
                    ),
                    SizedBox(height: 12),
                    Body(
                      'The Quran serves as this instruction manual because we know our creator(God) knows what is good and bad for us. Almighty God has sent only one religion.',
                    ),
                    SizedBox(height: 12),
                    Quote(
                      'The only religion acceptable in the sight of Almighty God is Islam.',
                      source: 'Quran Chapter 3 verse 19',
                      accent: C.green,
                    ),
                  ],
                ),
              ),
              PCard(
                title: 'The Final Message',
                subtitle: 'Why follow the Quran?',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Body(
                      'Whenever the almighty god sent an instruction manual, the manual changed over the passage of time. Allah (SWT) knew that the human being may not be able to grasp the complete message of the Quran.',
                    ),
                    SizedBox(height: 10),
                    Quote(
                      'Jesus (PBUH) said, I still have many things to say to you, but you can\'t bear them now. However, when He, the Spirit of truth, has come, He will guide you into all truth; for he shall not speak of himself; but whatsoever he shall hear, that shall he speak... he shall glorify me.',
                      source: 'Bible Gospel of John, ch-16:ver:12-14',
                    ),
                    SizedBox(height: 10),
                    Body('Note: No Muslim is a muslim if he/she doesn\'t believe in Jesus (PBUH).'),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 28),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: const Body(
              '"Allah (SWT) at this time, now the human beings can grasp the last and final message, the Quran. That\'s why everyone in the world today should follow the final messenger, Prophet Muhammad(PBUH) & the Quran.\n\nSo Islam came in its complete form 1400 years ago. All the previous revelations, the basic message was the same, believing in one God (No Idols Or Images). All the scriptures that came before were time-bound. They were meant only for a particular group of people. The message was supposed to be followed until the new message came. When the last and final revelation was revealed and no other revelations are going to come. Allah takes it upon himself to preserve it. It is not only meant for the Muslims of the Arabs, it\'s meant for the whole of humanity.',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
