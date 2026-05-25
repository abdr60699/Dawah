import 'package:flutter/material.dart';
import '../app_theme.dart';

/// 2-column grid with equal-height cards using IntrinsicHeight
class CardGrid extends StatelessWidget {
  final List<Widget> children;
  final double gap;

  const CardGrid({super.key, required this.children, this.gap = 16});

  @override
  Widget build(BuildContext context) {
    if (isMobile(context)) {
      return Column(
        children: [
          for (var i = 0; i < children.length; i++) ...[
            children[i],
            if (i < children.length - 1) SizedBox(height: gap),
          ],
        ],
      );
    }
    final rows = <Widget>[];
    for (var i = 0; i < children.length; i += 2) {
      final has2 = i + 1 < children.length;
      rows.add(
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: children[i]),
              if (has2) ...[
                SizedBox(width: gap),
                Expanded(child: children[i + 1]),
              ] else
                Expanded(child: Container()),
            ],
          ),
        ),
      );
      if (i + 2 < children.length) rows.add(SizedBox(height: gap));
    }
    return Column(children: rows);
  }
}

/// Premium card with shadow, consistent sizing
class PCard extends StatefulWidget {
  final String? title;
  final String? subtitle;
  final Widget child;
  final Color bg;
  final Color? titleColor;
  final double radius;
  final EdgeInsetsGeometry? padding;

  const PCard({
    super.key,
    this.title,
    this.subtitle,
    required this.child,
    this.bg = C.white,
    this.titleColor,
    this.radius = 16,
    this.padding,
  });

  @override
  State<PCard> createState() => _PCardState();
}

class _PCardState extends State<PCard> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final m = isMobile(context);
    final isDark = widget.bg == C.bgDark || widget.bg == C.bgDark2;
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        padding: widget.padding ?? EdgeInsets.all(m ? 24 : 32),
        decoration: BoxDecoration(
          color: widget.bg,
          borderRadius: BorderRadius.circular(widget.radius),
          border: isDark ? null : Border.all(color: C.border.withValues(alpha: 0.8)),
          boxShadow: _hover ? C.elevatedShadow : C.cardShadow,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.title != null) ...[
              Text(
                widget.title!,
                style: TextStyle(
                  fontSize: m ? 22 : 26,
                  fontWeight: FontWeight.w800,
                  color: widget.titleColor ?? (isDark ? C.onDark : C.heading),
                  letterSpacing: -0.5,
                  height: 1.15,
                ),
              ),
              if (widget.subtitle != null) ...[
                const SizedBox(height: 6),
                Text(
                  widget.subtitle!,
                  style: TextStyle(
                    fontSize: m ? 14 : 16,
                    color: isDark ? C.onDarkSub : C.body,
                    height: 1.4,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
              const SizedBox(height: 20),
            ],
            Expanded(child: widget.child),
          ],
        ),
      ),
    );
  }
}

/// Simple flat card (no hover effect, no expand)
class FlatCard extends StatelessWidget {
  final Widget child;
  final Color bg;
  final double radius;
  final EdgeInsetsGeometry? padding;

  const FlatCard({
    super.key,
    required this.child,
    this.bg = C.white,
    this.radius = 16,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = bg == C.bgDark || bg == C.bgDark2;
    return Container(
      width: double.infinity,
      padding: padding ?? EdgeInsets.all(isMobile(context) ? 24 : 32),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(radius),
        border: isDark ? null : Border.all(color: C.border.withValues(alpha: 0.8)),
        boxShadow: C.cardShadow,
      ),
      child: child,
    );
  }
}

/// Numbered circle + text
class NumPoint extends StatelessWidget {
  final String num;
  final String text;
  final Color color;

  const NumPoint(this.num, this.text, {super.key, this.color = C.accent});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(num,
                  style: TextStyle(
                      color: color, fontWeight: FontWeight.w800, fontSize: 14)),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(text,
                  style: TextStyle(
                      color: C.heading,
                      fontSize: 16,
                      height: 1.5,
                      fontWeight: FontWeight.w500)),
            ),
          ),
        ],
      ),
    );
  }
}
