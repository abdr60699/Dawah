import 'package:flutter/material.dart';
import '../app_theme.dart';

/// Full-width section wrapper
class Sec extends StatelessWidget {
  final Color bg;
  final Widget child;
  final EdgeInsetsGeometry? padding;

  const Sec({super.key, this.bg = C.bg, required this.child, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: bg,
      padding: padding ?? sectionPad(context),
      child: child,
    );
  }
}

/// Large section title
class Headline extends StatelessWidget {
  final String text;
  final String? sub;
  final Color? color;
  final CrossAxisAlignment align;

  const Headline(this.text,
      {super.key,
      this.sub,
      this.color,
      this.align = CrossAxisAlignment.center});

  @override
  Widget build(BuildContext context) {
    final m = isMobile(context);
    final c = color ?? C.heading;
    return Column(
      crossAxisAlignment: align,
      children: [
        Text(
          text,
          textAlign:
              align == CrossAxisAlignment.center ? TextAlign.center : TextAlign.start,
          style: TextStyle(
            fontSize: m ? 32 : 52,
            fontWeight: FontWeight.w800,
            color: c,
            letterSpacing: m ? -0.8 : -2,
            height: 1.08,
          ),
        ),
        if (sub != null) ...[
          const SizedBox(height: 12),
          Text(
            sub!,
            textAlign:
                align == CrossAxisAlignment.center ? TextAlign.center : TextAlign.start,
            style: TextStyle(
              fontSize: m ? 16 : 20,
              fontWeight: FontWeight.w400,
              color: c.withValues(alpha: 0.6),
              height: 1.45,
            ),
          ),
        ],
      ],
    );
  }
}

/// Body paragraph
class Body extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final double? maxWidth;
  final Color? color;

  const Body(this.text,
      {super.key,
      this.textAlign = TextAlign.start,
      this.maxWidth,
      this.color});

  @override
  Widget build(BuildContext context) {
    final w = Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: color ?? C.body,
        fontSize: isMobile(context) ? 15 : 17,
        height: 1.65,
        fontWeight: FontWeight.w400,
      ),
    );
    return maxWidth != null
        ? ConstrainedBox(constraints: BoxConstraints(maxWidth: maxWidth!), child: w)
        : w;
  }
}

/// Quote block with left accent bar
class Quote extends StatelessWidget {
  final String text;
  final String? source;
  final Color accent;

  const Quote(this.text, {super.key, this.source, this.accent = C.accent});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.fromLTRB(20, 20, 24, 20),
      decoration: BoxDecoration(
        color: accent.withValues(alpha: 0.04),
        border: Border(left: BorderSide(color: accent, width: 3)),
        borderRadius: const BorderRadius.horizontal(right: Radius.circular(12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(
              color: C.heading,
              fontSize: isMobile(context) ? 14 : 16,
              height: 1.65,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w400,
            ),
          ),
          if (source != null) ...[
            const SizedBox(height: 10),
            Text(
              '— $source',
              style: TextStyle(
                color: accent,
                fontSize: 13,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// "Learn more >" link
class LearnMore extends StatefulWidget {
  final String text;
  final VoidCallback? onTap;
  final Color color;

  const LearnMore(this.text, {super.key, this.onTap, this.color = C.accent});

  @override
  State<LearnMore> createState() => _LearnMoreState();
}

class _LearnMoreState extends State<LearnMore> {
  bool _h = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _h = true),
      onExit: (_) => setState(() => _h = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.text,
              style: TextStyle(
                color: widget.color,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                decoration: _h ? TextDecoration.underline : TextDecoration.none,
                decorationColor: widget.color,
              ),
            ),
            const SizedBox(width: 3),
            Icon(Icons.east_rounded, color: widget.color, size: 16),
          ],
        ),
      ),
    );
  }
}
