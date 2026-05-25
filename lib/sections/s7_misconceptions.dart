import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../widgets/apple_section.dart';

class S7Misconceptions extends StatelessWidget {
  const S7Misconceptions({super.key});

  @override
  Widget build(BuildContext context) {
    final m = isMobile(context);
    return Sec(
      bg: C.bgDark,
      child: Column(
        children: [
          Text(
            'ADDRESSING',
            style: TextStyle(
              color: C.onDarkSub,
              fontSize: 13,
              fontWeight: FontWeight.w700,
              letterSpacing: 3,
            ),
          ),
          const SizedBox(height: 8),
          Headline(
            'Terrorism &\nWomen Rights.',
            sub: 'Islam is maligned by two things.',
            color: C.onDark,
          ),
          const SizedBox(height: 36),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 680),
            child: Column(
              children: [
                Text(
                  'Many in the USA, including women, are embracing Islam. If Islam doesn\'t give rights to women, why are they accepting it?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: C.onDarkSub,
                    fontSize: m ? 15 : 18,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 28),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: C.white.withValues(alpha: 0.05),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: C.white.withValues(alpha: 0.08)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Watch on YouTube (Change Country to Malaysia):',
                        style: TextStyle(
                          color: C.accent,
                          fontSize: m ? 13 : 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _yt('1', 'WOMEN\'S RIGHTS IN ISLAM - LIBERATED OR SUBJUGATED? LECTURE + Q & A | DR ZAKIR NAIK.'),
                      _yt('2', 'ISLAM\'S VIEW ON TER-OR-ISM AND JI-HA-AD | LECTURE + Q & A | DR ZAKIR NAIK.'),
                      _yt('3', 'MISCONCEPTIONS ABOUT ISLAM|DUBAI PART 1 & 2| LECTURE + Q & A | DR ZAKIR NAIK'),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
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
    );
  }

  Widget _yt(String n, String t) => Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: C.white.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Center(
                child: Text(n,
                    style: const TextStyle(
                        color: C.onDarkSub, fontWeight: FontWeight.w700, fontSize: 12)),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(t,
                  style: const TextStyle(
                      color: C.onDarkSub, fontSize: 13, height: 1.5)),
            ),
          ],
        ),
      );
}
