import 'package:flutter/material.dart';
import '../app_theme.dart';
import 'v2_widgets.dart';

/// A dark horizontal quote strip with auto-scrolling feel
class V2QuoteStrip extends StatelessWidget {
  const V2QuoteStrip({super.key});

  static const _quotes = [
    (
      'Say: He is God, The One and Only. God, the Eternal, Absolute. He neither begets nor is born. And there is none Like unto Him.',
      'Quran Chapter 112',
      C.green,
    ),
    (
      'Hear, O Israel: The Lord our God is one Lord.',
      'Bible Mark 12:29',
      C.accent,
    ),
    (
      'There is only one God, not the second; not at all, not at all, not in the least bit.',
      'Brahma Sutra — Hindu Vedanta',
      Color(0xFF059669),
    ),
    (
      'Science without religion is lame, religion without science is blind.',
      'Albert Einstein',
      C.gold,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final m = isMobile(context);
    return Container(
      width: double.infinity,
      color: const Color(0xFF0A0A0A),
      padding: EdgeInsets.symmetric(
        horizontal: sectionPad(context).horizontal / 2,
        vertical: m ? 60 : 80,
      ),
      child: Column(
        children: [
          FadeSlideIn(
            child: Text(
              'WHAT SCRIPTURES SAY',
              style: TextStyle(
                color: const Color(0xFF555555),
                fontSize: 11,
                fontWeight: FontWeight.w800,
                letterSpacing: 3,
              ),
            ),
          ),
          const SizedBox(height: 40),
          for (var i = 0; i < _quotes.length; i++) ...[
            FadeSlideIn(
              delay: Duration(milliseconds: i * 150),
              child: _QuoteCard(
                text: _quotes[i].$1,
                source: _quotes[i].$2,
                accent: _quotes[i].$3,
              ),
            ),
            if (i < _quotes.length - 1) const SizedBox(height: 16),
          ],
        ],
      ),
    );
  }
}

class _QuoteCard extends StatefulWidget {
  final String text;
  final String source;
  final Color accent;

  const _QuoteCard({
    required this.text,
    required this.source,
    required this.accent,
  });

  @override
  State<_QuoteCard> createState() => _QuoteCardState();
}

class _QuoteCardState extends State<_QuoteCard> {
  bool _h = false;

  @override
  Widget build(BuildContext context) {
    final m = isMobile(context);
    return MouseRegion(
      onEnter: (_) => setState(() => _h = true),
      onExit: (_) => setState(() => _h = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: double.infinity,
        constraints: const BoxConstraints(maxWidth: 720),
        padding: EdgeInsets.all(m ? 20 : 28),
        decoration: BoxDecoration(
          color: _h
              ? widget.accent.withValues(alpha: 0.06)
              : const Color(0xFF141414),
          borderRadius: BorderRadius.circular(16),
          border: Border(
            left: BorderSide(
              color: _h ? widget.accent : widget.accent.withValues(alpha: 0.3),
              width: 3,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.text,
              style: TextStyle(
                color: const Color(0xFFCCCCCC),
                fontSize: m ? 14 : 17,
                height: 1.6,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              '— ${widget.source}',
              style: TextStyle(
                color: widget.accent,
                fontSize: 13,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
