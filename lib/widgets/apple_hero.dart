import 'package:flutter/material.dart';
import '../app_theme.dart';

class AppleHero extends StatelessWidget {
  const AppleHero({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final m = isMobile(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: sectionPad(context).horizontal / 2,
        vertical: m ? 72 : 110,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF0F172A),
            Color(0xFF1E1B4B),
            Color(0xFF0F172A),
          ],
        ),
      ),
      child: Column(
        children: [
          // Tag
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: C.white.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: C.white.withValues(alpha: 0.12)),
            ),
            child: const Text(
              '11 minutes to change your perspective',
              style: TextStyle(
                color: C.onDarkSub,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 28),
          Text(
            'Discover\nThe Truth.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: m ? 52 : (w > 1080 ? 88 : 72),
              fontWeight: FontWeight.w800,
              color: C.onDark,
              letterSpacing: m ? -1.5 : -3,
              height: 1.0,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'With an open mindset.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: m ? 20 : 28,
              fontWeight: FontWeight.w400,
              color: C.onDarkSub,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 24),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Text(
              'Respected Sir/Madam, kindly read fully with an open mindset & rethink about your purpose of life & Prophet Muhammad (PBUH).',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: C.onDarkSub.withValues(alpha: 0.7),
                fontSize: m ? 15 : 17,
                height: 1.55,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(height: 36),
          Wrap(
            spacing: 14,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              _pill('Start Reading', true),
              _pill('Watch Proofs', false),
            ],
          ),
        ],
      ),
    );
  }

  Widget _pill(String text, bool filled) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 13),
        decoration: BoxDecoration(
          color: filled ? C.accent : Colors.transparent,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: filled ? C.accent : C.white.withValues(alpha: 0.25),
            width: 1.5,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: filled ? C.white : C.onDarkSub,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
