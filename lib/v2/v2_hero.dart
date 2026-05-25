import 'package:flutter/material.dart';
import '../app_theme.dart';

class V2Hero extends StatefulWidget {
  const V2Hero({super.key});

  @override
  State<V2Hero> createState() => _V2HeroState();
}

class _V2HeroState extends State<V2Hero> with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _fadeTitle;
  late final Animation<double> _fadeSub;
  late final Animation<double> _fadeTag;
  late final Animation<Offset> _slideTitle;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _fadeTag = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _ctrl, curve: const Interval(0.0, 0.4, curve: Curves.easeOut)),
    );
    _fadeTitle = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _ctrl, curve: const Interval(0.15, 0.6, curve: Curves.easeOut)),
    );
    _fadeSub = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _ctrl, curve: const Interval(0.35, 0.8, curve: Curves.easeOut)),
    );
    _slideTitle = Tween(begin: const Offset(0, 30), end: Offset.zero).animate(
      CurvedAnimation(parent: _ctrl, curve: const Interval(0.15, 0.6, curve: Curves.easeOutCubic)),
    );
    _ctrl.forward();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final m = isMobile(context);
    final w = MediaQuery.of(context).size.width;

    return AnimatedBuilder(
      animation: _ctrl,
      builder: (_, _) => Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: sectionPad(context).horizontal / 2,
          vertical: m ? 80 : 120,
        ),
        color: C.white,
        child: Column(
          children: [
            // Tag
            Opacity(
              opacity: _fadeTag.value,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: C.border),
                  color: C.bg,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        color: C.green,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '11 minutes to change your perspective',
                      style: TextStyle(
                        color: C.body,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.3,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            // Title
            Opacity(
              opacity: _fadeTitle.value,
              child: Transform.translate(
                offset: _slideTitle.value,
                child: Column(
                  children: [
                    Text(
                      'Discover',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: m ? 56 : (w > 1080 ? 96 : 76),
                        fontWeight: FontWeight.w800,
                        color: C.heading,
                        letterSpacing: m ? -2 : -4,
                        height: 0.95,
                      ),
                    ),
                    ShaderMask(
                      shaderCallback: (bounds) => const LinearGradient(
                        colors: [C.accent, C.green, C.teal],
                      ).createShader(bounds),
                      child: Text(
                        'The Truth.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: m ? 56 : (w > 1080 ? 96 : 76),
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          letterSpacing: m ? -2 : -4,
                          height: 1.05,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Subtitle
            Opacity(
              opacity: _fadeSub.value,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 520),
                child: Text(
                  'Explore evidence from every major religion\'s scripture.\nWith an open mindset.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: C.body,
                    fontSize: m ? 15 : 18,
                    height: 1.6,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            // Scroll indicator
            Opacity(
              opacity: _fadeSub.value,
              child: _ScrollIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}

class _ScrollIndicator extends StatefulWidget {
  @override
  State<_ScrollIndicator> createState() => _ScrollIndicatorState();
}

class _ScrollIndicatorState extends State<_ScrollIndicator>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _ctrl,
      builder: (_, _) => Transform.translate(
        offset: Offset(0, _ctrl.value * 8),
        child: Container(
          width: 28,
          height: 44,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: C.border, width: 1.5),
          ),
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: const EdgeInsets.only(top: 8),
              width: 4,
              height: 10,
              decoration: BoxDecoration(
                color: C.caption,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
