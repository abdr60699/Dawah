import 'package:flutter/material.dart';
import '../app_theme.dart';
import 'v3_animations.dart';
import 'v3_sections.dart';

class V3HomePage extends StatelessWidget {
  const V3HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final m = isMobile(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 56), // nav offset
          // ─── Hero Section ───
          _V3Hero(m: m),
          // ─── All 9 Sections ───
          const V3S1Purpose(),
          const V3S2WhyReligion(),
          const V3S3Guidance(),
          const V3S4GodInScriptures(),
          const V3S5ProphetMuhammad(),
          const V3S6Science(),
          const V3S7LifeAfterDeath(),
          const V3S8Kalki(),
          const V3S9Heart(),
        ],
      ),
    );
  }
}

// ─── V3 Cinematic Hero ───
class _V3Hero extends StatefulWidget {
  final bool m;
  const _V3Hero({required this.m});

  @override
  State<_V3Hero> createState() => _V3HeroState();
}

class _V3HeroState extends State<_V3Hero> with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _fadeIn;
  late Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    _fadeIn = CurvedAnimation(
      parent: _ctrl,
      curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
    );
    _scaleAnim = Tween<double>(begin: 0.9, end: 1.0).animate(
      CurvedAnimation(
        parent: _ctrl,
        curve: const Interval(0.0, 0.8, curve: Curves.easeOutCubic),
      ),
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
    final m = widget.m;
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(minHeight: m ? 500 : 650),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF0A0A12), Color(0xFF141318)],
        ),
      ),
      child: Stack(
        children: [
          const Positioned.fill(
            child: FloatingParticles(count: 30, color: C.accent),
          ),
          Center(
            child: AnimatedBuilder2(
              listenable: _ctrl,
              builder: (_, child) => Opacity(
                opacity: _fadeIn.value,
                child: Transform.scale(
                  scale: _scaleAnim.value,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: m ? 24 : 64,
                      vertical: m ? 60 : 80,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 6),
                          decoration: BoxDecoration(
                            color: C.accent.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: C.accent.withValues(alpha: 0.2)),
                          ),
                          child: const Text(
                            'ANIMATED EXPERIENCE',
                            style: TextStyle(
                              color: C.accent,
                              fontSize: 11,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 3,
                            ),
                          ),
                        ),
                        const SizedBox(height: 28),
                        Text(
                          "Discover\nThe Truth",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: m ? 48 : 80,
                            fontWeight: FontWeight.w900,
                            color: C.onDark,
                            letterSpacing: m ? -2 : -4,
                            height: 1.05,
                          ),
                        ),
                        const SizedBox(height: 20),
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 560),
                          child: Text(
                            "Kindly give 11 minutes to read fully with an open mindset & rethink about your purpose of life.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: C.onDarkSub,
                              fontSize: m ? 16 : 20,
                              height: 1.6,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                        // Scroll indicator
                        _ScrollIndicator(m: m),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ScrollIndicator extends StatefulWidget {
  final bool m;
  const _ScrollIndicator({required this.m});

  @override
  State<_ScrollIndicator> createState() => _ScrollIndicatorState();
}

class _ScrollIndicatorState extends State<_ScrollIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;

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
    return AnimatedBuilder2(
      listenable: _ctrl,
      builder: (_, child) => Transform.translate(
        offset: Offset(0, _ctrl.value * 10),
        child: Column(
          children: [
            Text(
              'Scroll to begin',
              style: TextStyle(
                color: C.onDarkSub.withValues(alpha: 0.5),
                fontSize: 13,
                fontWeight: FontWeight.w500,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 8),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              color: C.onDarkSub.withValues(alpha: 0.4),
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}
