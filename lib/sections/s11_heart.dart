import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../app_theme.dart';
import '../widgets/apple_section.dart';

class S11Heart extends StatelessWidget {
  const S11Heart({super.key});

  @override
  Widget build(BuildContext context) {
    final m = isMobile(context);
    return Sec(
      bg: C.white,
      child: Column(
        children: [
          Text(
            'HEART OF THE CONTENT',
            style: TextStyle(
              color: C.gold,
              fontSize: 13,
              fontWeight: FontWeight.w700,
              letterSpacing: 3,
            ),
          ),
          const SizedBox(height: 16),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 660),
            child: Text(
              'Believe & accept 100% that there is only One God, with no images or idols & Prophet MUHAMMAD (PBUH) is Messenger & Servant of God.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: C.heading,
                fontSize: m ? 28 : 44,
                fontWeight: FontWeight.w800,
                letterSpacing: -1.2,
                height: 1.12,
              ),
            ),
          ),
          const SizedBox(height: 20),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560),
            child: Text(
              'First, read the authentic Quran Translation. Just type the link into Google => English => Yusuf Ali.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: C.body,
                fontSize: m ? 15 : 18,
                height: 1.5,
              ),
            ),
          ),
          const SizedBox(height: 36),
          Wrap(
            spacing: 14,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              _btn('Read Quran Translation',
                  'https://islamic1articles.home.blog', C.accent, true),
              _btn('Watch Proofs',
                  'https://alhidaayah.com/live/', C.green, false),
              _btn('Download PDF',
                  'https://github.com/PeaceQueries/Peace_PDF', C.heading, false),
            ],
          ),
          const SizedBox(height: 32),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: C.bg,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.alternate_email, color: C.caption, size: 16),
                const SizedBox(width: 6),
                Text(
                  'Instagram → Peace_Can_Heal',
                  style: TextStyle(color: C.body, fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _btn(String label, String url, Color c, bool filled) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => launchUrl(Uri.parse(url)),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: BoxDecoration(
            color: filled ? c : Colors.transparent,
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: c, width: 1.5),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: filled ? C.white : c,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
