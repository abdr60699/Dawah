import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../widgets/apple_section.dart';
class S2OneGod extends StatelessWidget {
  const S2OneGod({super.key});

  @override
  Widget build(BuildContext context) {
    final m = isMobile(context);
    return Sec(
      bg: C.bgDark,
      child: Column(
        children: [
          Headline(
            'The Definition\nof God.',
            sub: 'We Muslims accept anyone as God who fits below four-line definition.\nIt\'s logical & it\'s fair too. Kindly rethink and check it with your god.',
            color: C.onDark,
          ),
          const SizedBox(height: 48),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Column(
              children: [
                _line(context, '1', 'Say: He is God, The One and Only'),
                _line(context, '2', 'God, the Eternal, Absolute'),
                _line(context, '3', 'He neither begets nor is born'),
                _line(context, '4', 'And there is none Like unto Him'),
              ],
            ),
          ),
          const SizedBox(height: 28),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: C.white.withValues(alpha: 0.06),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Text(
              'Quran Chapter 112 — Surah Al-Ikhlas',
              style: TextStyle(
                color: C.onDarkSub,
                fontSize: m ? 13 : 15,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _line(BuildContext context, String n, String t) {
    final m = isMobile(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: C.accent.withValues(alpha: 0.15),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(n,
                  style: const TextStyle(
                      color: C.accent, fontWeight: FontWeight.w800, fontSize: 17)),
            ),
          ),
          const SizedBox(width: 18),
          Expanded(
            child: Text(t,
                style: TextStyle(
                  color: C.onDark,
                  fontSize: m ? 18 : 22,
                  fontWeight: FontWeight.w600,
                  height: 1.3,
                )),
          ),
        ],
      ),
    );
  }
}
