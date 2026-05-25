import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../app_theme.dart';
import 'v2_widgets.dart';

class V2CtaSection extends StatelessWidget {
  const V2CtaSection({super.key});

  @override
  Widget build(BuildContext context) {
    final m = isMobile(context);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: sectionPad(context).horizontal / 2,
        vertical: m ? 80 : 120,
      ),
      color: C.bg,
      child: FadeSlideIn(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
              decoration: BoxDecoration(
                color: C.gold.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'HEART OF THE MESSAGE',
                style: TextStyle(
                  color: C.gold,
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 2,
                ),
              ),
            ),
            const SizedBox(height: 24),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 640),
              child: Text(
                'Believe & accept that there is only One God, with no images or idols.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: C.heading,
                  fontSize: m ? 28 : 48,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -1.5,
                  height: 1.1,
                ),
              ),
            ),
            const SizedBox(height: 16),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
              child: Text(
                'Prophet Muhammad (PBUH) is the Messenger & Servant of God.\nRead the Quran with an open heart.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: C.body,
                  fontSize: m ? 15 : 17,
                  height: 1.6,
                ),
              ),
            ),
            const SizedBox(height: 44),
            Wrap(
              spacing: 16,
              runSpacing: 12,
              alignment: WrapAlignment.center,
              children: [
                _CtaBtn(
                  label: 'Read Quran Translation',
                  url: 'https://islamic1articles.home.blog',
                  filled: true,
                ),
                _CtaBtn(
                  label: 'Watch Proofs',
                  url: 'https://alhidaayah.com/live/',
                  filled: false,
                ),
                _CtaBtn(
                  label: 'Download PDF',
                  url: 'https://github.com/PeaceQueries/Peace_PDF',
                  filled: false,
                ),
              ],
            ),
            const SizedBox(height: 32),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
              decoration: BoxDecoration(
                color: C.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: C.border),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.alternate_email, color: C.caption, size: 14),
                  const SizedBox(width: 6),
                  Text(
                    'Instagram: @Peace_Can_Heal',
                    style: TextStyle(
                      color: C.body,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CtaBtn extends StatefulWidget {
  final String label;
  final String url;
  final bool filled;

  const _CtaBtn({
    required this.label,
    required this.url,
    required this.filled,
  });

  @override
  State<_CtaBtn> createState() => _CtaBtnState();
}

class _CtaBtnState extends State<_CtaBtn> {
  bool _h = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _h = true),
      onExit: (_) => setState(() => _h = false),
      child: GestureDetector(
        onTap: () => launchUrl(Uri.parse(widget.url)),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
          decoration: BoxDecoration(
            color: widget.filled
                ? (_h ? C.accent.withValues(alpha: 0.9) : C.accent)
                : (_h ? C.bg : Colors.transparent),
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              color: widget.filled ? C.accent : C.border,
              width: 1.5,
            ),
          ),
          child: Text(
            widget.label,
            style: TextStyle(
              color: widget.filled ? Colors.white : C.heading,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
