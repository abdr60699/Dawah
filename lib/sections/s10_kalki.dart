import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../widgets/apple_section.dart';

class S10Kalki extends StatelessWidget {
  const S10Kalki({super.key});

  @override
  Widget build(BuildContext context) {
    return Sec(
      bg: const Color(0xFF0F172A),
      child: Column(
        children: [
          Text(
            'PROPHECY',
            style: TextStyle(
              color: C.onDarkSub,
              fontSize: 13,
              fontWeight: FontWeight.w700,
              letterSpacing: 3,
            ),
          ),
          const SizedBox(height: 10),
          Headline(
            'Muhammad (PBUH)\nin Kalki Purana.',
            sub: 'The name of the father & mother of prophet Muhammad (PBUH) prophesied.',
            color: C.onDark,
          ),
          const SizedBox(height: 44),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 640),
            child: Column(
              children: [
                _p('Kalki Purana 2:4',
                    '"He (Kalki) will be born to Vishnuyash (Servant of God).',
                    'In Arabic, Abdullah means Servant of God. The name of the father of Prophet Muhammad (PBUH) is Abdullah.',
                    C.gold),
                _p('Kalki Purana 2:4',
                    '"He will be born at "Shambala" in the house of the chief of the village/city.',
                    'Shambala means peace i.e. Makkah.',
                    C.accent),
                _p('Kalki Purana 2:11',
                    '"He (Kalki) will be born to his mother Sumati."',
                    'Sumati – meaning gentle & wise i.e Amina – meaning peaceful. Mother of Prophet Muhammad (PBUH) was Amina.',
                    C.green),
                _p('Kalki Purana 2:5',
                    '"He will be born on the 12th day of the month of Madhav."',
                    'Madhav is the month of spring. In the Arabic calendar, Rabi-ul-Awwal. Prophet Muhammad (PBUH) was born on the 12th of Rabi-ul-Awwal.',
                    C.red),
                _p('Kalki Purana 2:15',
                    '"Kalki will be given a horse that is swift. Riding on it he will go around the earth and the seven skies."',
                    'This refers to Buraaq which was given to the Prophet (PBUH). Helper — Parshuram (Sanskrit for Axe) = Umar (Arabic for Axe).',
                    C.gold),
              ],
            ),
          ),
          const SizedBox(height: 28),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560),
            child: Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: C.white.withValues(alpha: 0.04),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: C.white.withValues(alpha: 0.06)),
              ),
              child: const Text(
                'Deva (God/One God) alone is praiseworthy. The name of his teacher (spiritual guide) is "Deva" meaning God alone. Prophet had 4 main companions. In Kalki Purana he had helpers of different castes like Brahmin, Kshatriya, etc.',
                textAlign: TextAlign.center,
                style: TextStyle(color: C.onDarkSub, fontSize: 14, height: 1.6),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _p(String title, String verse, String explanation, Color c) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: C.white.withValues(alpha: 0.03),
        borderRadius: BorderRadius.circular(14),
        border: Border(left: BorderSide(color: c, width: 3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(
                  color: c,
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                  letterSpacing: 0.5)),
          const SizedBox(height: 10),
          Text(verse,
              style: const TextStyle(
                  color: C.onDark,
                  fontSize: 15,
                  height: 1.55,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w400)),
          const SizedBox(height: 10),
          Text(explanation,
              style: const TextStyle(
                  color: C.onDarkSub, fontSize: 13, height: 1.5)),
        ],
      ),
    );
  }
}
