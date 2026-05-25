import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import '../app_theme.dart';

// ─── Scroll-Triggered Reveal ───
// Fades & slides in when widget enters viewport
class ScrollReveal extends StatefulWidget {
  final Widget child;
  final Duration delay;
  final Duration duration;
  final Offset slideFrom;
  final Curve curve;

  const ScrollReveal({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.duration = const Duration(milliseconds: 800),
    this.slideFrom = const Offset(0, 60),
    this.curve = Curves.easeOutCubic,
  });

  @override
  State<ScrollReveal> createState() => _ScrollRevealState();
}

class _ScrollRevealState extends State<ScrollReveal>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _opacity;
  late Animation<Offset> _slide;
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(vsync: this, duration: widget.duration);
    _opacity = CurvedAnimation(parent: _ctrl, curve: widget.curve);
    _slide = Tween<Offset>(begin: widget.slideFrom, end: Offset.zero)
        .animate(CurvedAnimation(parent: _ctrl, curve: widget.curve));
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  void _onVisibility(VisibilityInfo info) {
    if (!_visible && info.visibleFraction > 0.15) {
      _visible = true;
      Future.delayed(widget.delay, () {
        if (mounted) _ctrl.forward();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      onVisibilityChanged: _onVisibility,
      child: AnimatedBuilder(
        anim: _ctrl,
        opacity: _opacity,
        slide: _slide,
        child: widget.child,
      ),
    );
  }
}

// ─── Visibility Detector (lightweight) ───
// Listens to the nearest Scrollable ancestor to detect when
// this widget enters the viewport.
class VisibilityDetector extends StatefulWidget {
  final Widget child;
  final ValueChanged<VisibilityInfo> onVisibilityChanged;

  const VisibilityDetector({
    super.key,
    required this.child,
    required this.onVisibilityChanged,
  });

  @override
  State<VisibilityDetector> createState() => _VisibilityDetectorState();
}

class VisibilityInfo {
  final double visibleFraction;
  const VisibilityInfo(this.visibleFraction);
}

class _VisibilityDetectorState extends State<VisibilityDetector> {
  final _key = GlobalKey();
  ScrollPosition? _scrollPosition;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Detach from old position
    _scrollPosition?.removeListener(_checkVisibility);
    // Attach to nearest scrollable's position
    _scrollPosition = Scrollable.maybeOf(context)?.position;
    _scrollPosition?.addListener(_checkVisibility);
    // Also check once after first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _checkVisibility();
    });
  }

  @override
  void dispose() {
    _scrollPosition?.removeListener(_checkVisibility);
    super.dispose();
  }

  void _checkVisibility() {
    final ctx = _key.currentContext;
    if (ctx == null) return;
    final box = ctx.findRenderObject() as RenderBox?;
    if (box == null || !box.hasSize) return;

    final size = box.size;
    final pos = box.localToGlobal(Offset.zero);
    final screen = MediaQuery.of(context).size;

    final visibleTop = max(0.0, pos.dy);
    final visibleBottom = min(screen.height, pos.dy + size.height);
    final visibleHeight = max(0.0, visibleBottom - visibleTop);
    final fraction = size.height > 0 ? visibleHeight / size.height : 0.0;

    widget.onVisibilityChanged(VisibilityInfo(fraction));
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: _key,
      child: widget.child,
    );
  }
}

// ─── Animated Builder Helper ───
class AnimatedBuilder extends StatelessWidget {
  final Animation<double> anim;
  final Animation<double> opacity;
  final Animation<Offset> slide;
  final Widget child;

  const AnimatedBuilder({
    super.key,
    required this.anim,
    required this.opacity,
    required this.slide,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder2(
      listenable: anim,
      builder: (_, ch) => Opacity(
        opacity: opacity.value,
        child: Transform.translate(
          offset: slide.value,
          child: child,
        ),
      ),
    );
  }
}

class AnimatedBuilder2 extends AnimatedWidget {
  final TransitionBuilder builder;

  const AnimatedBuilder2({
    super.key,
    required super.listenable,
    required this.builder,
  });

  Animation<double> get animation => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) => builder(context, null);
}

// ─── Typewriter Text ───
class TypewriterText extends StatefulWidget {
  final String text;
  final TextStyle style;
  final Duration charDelay;
  final Duration startDelay;
  final TextAlign textAlign;

  const TypewriterText({
    super.key,
    required this.text,
    required this.style,
    this.charDelay = const Duration(milliseconds: 30),
    this.startDelay = Duration.zero,
    this.textAlign = TextAlign.start,
  });

  @override
  State<TypewriterText> createState() => _TypewriterTextState();
}

class _TypewriterTextState extends State<TypewriterText> {
  String _displayed = '';
  Timer? _timer;
  int _idx = 0;
  bool _started = false;

  void _start() {
    if (_started) return;
    _started = true;
    Future.delayed(widget.startDelay, () {
      if (!mounted) return;
      _timer = Timer.periodic(widget.charDelay, (t) {
        if (_idx >= widget.text.length) {
          t.cancel();
          return;
        }
        setState(() {
          _idx++;
          _displayed = widget.text.substring(0, _idx);
        });
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.2) _start();
      },
      child: Text(
        _displayed.isEmpty ? ' ' : _displayed,
        style: widget.style,
        textAlign: widget.textAlign,
      ),
    );
  }
}

// ─── Animated Counter ───
class AnimatedCounter extends StatefulWidget {
  final int end;
  final String prefix;
  final String suffix;
  final TextStyle style;
  final Duration duration;

  const AnimatedCounter({
    super.key,
    required this.end,
    this.prefix = '',
    this.suffix = '',
    required this.style,
    this.duration = const Duration(milliseconds: 1500),
  });

  @override
  State<AnimatedCounter> createState() => _AnimatedCounterState();
}

class _AnimatedCounterState extends State<AnimatedCounter>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _anim;
  bool _started = false;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(vsync: this, duration: widget.duration);
    _anim = Tween<double>(begin: 0, end: widget.end.toDouble())
        .animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic));
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  void _start() {
    if (_started) return;
    _started = true;
    _ctrl.forward();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.3) _start();
      },
      child: AnimatedBuilder2(
        listenable: _anim,
        builder: (_, child) => Text(
          '${widget.prefix}${_anim.value.toInt()}${widget.suffix}',
          style: widget.style,
        ),
      ),
    );
  }
}

// ─── Gradient Reveal Text ───
// Text that reveals with a gradient sweep
class GradientRevealText extends StatefulWidget {
  final String text;
  final TextStyle style;
  final Duration duration;
  final List<Color> colors;
  final TextAlign textAlign;

  const GradientRevealText({
    super.key,
    required this.text,
    required this.style,
    this.duration = const Duration(milliseconds: 2000),
    this.colors = const [Color(0xFF2563EB), Color(0xFF059669)],
    this.textAlign = TextAlign.center,
  });

  @override
  State<GradientRevealText> createState() => _GradientRevealTextState();
}

class _GradientRevealTextState extends State<GradientRevealText>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  bool _started = false;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(vsync: this, duration: widget.duration);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      onVisibilityChanged: (info) {
        if (!_started && info.visibleFraction > 0.2) {
          _started = true;
          _ctrl.forward();
        }
      },
      child: AnimatedBuilder2(
        listenable: _ctrl,
        builder: (_, child) {
          final v = _ctrl.value.clamp(0.001, 1.0);
          return ShaderMask(
            shaderCallback: (bounds) {
              return LinearGradient(
                colors: [
                  widget.colors.first,
                  widget.colors.last,
                  Colors.transparent,
                ],
                stops: [0, v, v],
              ).createShader(bounds);
            },
            blendMode: BlendMode.srcIn,
            child: Opacity(
              opacity: _ctrl.value.clamp(0.0, 1.0),
              child: Text(
                widget.text,
                style: widget.style,
                textAlign: widget.textAlign,
              ),
            ),
          );
        },
      ),
    );
  }
}

// ─── Pulsing Glow Container ───
class PulsingGlow extends StatefulWidget {
  final Widget child;
  final Color glowColor;
  final double maxRadius;

  const PulsingGlow({
    super.key,
    required this.child,
    this.glowColor = C.accent,
    this.maxRadius = 20,
  });

  @override
  State<PulsingGlow> createState() => _PulsingGlowState();
}

class _PulsingGlowState extends State<PulsingGlow>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
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
      builder: (_, child) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: widget.glowColor.withValues(alpha: 0.15 + _ctrl.value * 0.15),
              blurRadius: widget.maxRadius * (0.5 + _ctrl.value * 0.5),
              spreadRadius: 0,
            ),
          ],
        ),
        child: widget.child,
      ),
    );
  }
}

// ─── Stagger Children ───
class StaggerList extends StatelessWidget {
  final List<Widget> children;
  final Duration baseDelay;
  final Duration stagger;

  const StaggerList({
    super.key,
    required this.children,
    this.baseDelay = Duration.zero,
    this.stagger = const Duration(milliseconds: 120),
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < children.length; i++)
          ScrollReveal(
            delay: baseDelay + stagger * i,
            child: children[i],
          ),
      ],
    );
  }
}

// ─── Cinematic Section Wrapper ───
// Full-width section with dark/light bg and vertical padding
class CinematicSection extends StatelessWidget {
  final Widget child;
  final bool dark;
  final Color? bgColor;
  final EdgeInsets? padding;

  const CinematicSection({
    super.key,
    required this.child,
    this.dark = false,
    this.bgColor,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final bg = bgColor ?? (dark ? C.bgDark : C.bg);
    final m = isMobile(context);
    final defaultPad = EdgeInsets.symmetric(
      horizontal: m ? 16 : sectionPad(context).left,
      vertical: m ? 40 : sectionPad(context).top,
    );
    return Container(
      width: double.infinity,
      color: bg,
      padding: padding ?? defaultPad,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: child,
        ),
      ),
    );
  }
}

// ─── Animated Divider ───
class AnimatedDividerLine extends StatefulWidget {
  final Color color;
  final Duration duration;

  const AnimatedDividerLine({
    super.key,
    this.color = C.accent,
    this.duration = const Duration(milliseconds: 1200),
  });

  @override
  State<AnimatedDividerLine> createState() => _AnimatedDividerLineState();
}

class _AnimatedDividerLineState extends State<AnimatedDividerLine>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  bool _started = false;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(vsync: this, duration: widget.duration);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      onVisibilityChanged: (info) {
        if (!_started && info.visibleFraction > 0.3) {
          _started = true;
          _ctrl.forward();
        }
      },
      child: AnimatedBuilder2(
        listenable: _ctrl,
        builder: (_, child) => SizedBox(
          height: 2,
          child: Center(
            child: FractionallySizedBox(
              widthFactor: _ctrl.value.clamp(0.001, 1.0),
              child: Container(
                height: 2,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      widget.color,
                      Colors.transparent,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(1),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ─── Animated Quote Block ───
class AnimatedQuote extends StatelessWidget {
  final String quote;
  final String source;
  final Color accentColor;
  final bool dark;

  const AnimatedQuote({
    super.key,
    required this.quote,
    required this.source,
    this.accentColor = C.accent,
    this.dark = false,
  });

  @override
  Widget build(BuildContext context) {
    final m = isMobile(context);
    final textColor = dark ? C.onDark : C.heading;
    return ScrollReveal(
      child: Container(
        padding: EdgeInsets.all(m ? 20 : 32),
        decoration: BoxDecoration(
          color: accentColor.withValues(alpha: dark ? 0.08 : 0.04),
          borderRadius: BorderRadius.circular(16),
          border: Border(
            left: BorderSide(color: accentColor, width: 4),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '"$quote"',
              style: TextStyle(
                color: textColor,
                fontSize: m ? 15 : 20,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.italic,
                height: 1.6,
                letterSpacing: -0.3,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              '— $source',
              style: TextStyle(
                color: accentColor,
                fontSize: m ? 13 : 15,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Animated Scripture Row (for tables) ───
class AnimatedScriptureRow extends StatelessWidget {
  final String religion;
  final String verse;
  final String reference;
  final Color color;
  final int index;
  final bool dark;

  const AnimatedScriptureRow({
    super.key,
    required this.religion,
    required this.verse,
    required this.reference,
    required this.color,
    required this.index,
    this.dark = false,
  });

  @override
  Widget build(BuildContext context) {
    final m = isMobile(context);
    return ScrollReveal(
      delay: Duration(milliseconds: index * 150),
      slideFrom: const Offset(0, 40),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: dark ? C.bgDark2 : C.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: dark ? null : C.cardShadow,
          border: Border(left: BorderSide(color: color, width: 4)),
        ),
        child: Padding(
          padding: EdgeInsets.all(m ? 14 : 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  religion,
                  style: TextStyle(
                    color: color,
                    fontSize: m ? 12 : 13,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                verse,
                style: TextStyle(
                  color: dark ? C.onDark : C.heading,
                  fontSize: m ? 13 : 16,
                  height: 1.6,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                reference,
                style: TextStyle(
                  color: dark ? C.onDarkSub : C.caption,
                  fontSize: m ? 11 : 12,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Number Highlight Pill ───
class NumberPill extends StatelessWidget {
  final String number;
  final Color color;

  const NumberPill({
    super.key,
    required this.number,
    this.color = C.accent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          number,
          style: TextStyle(
            color: color,
            fontSize: 15,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}

// ─── Floating Particle Background ───
class FloatingParticles extends StatefulWidget {
  final int count;
  final Color color;

  const FloatingParticles({
    super.key,
    this.count = 20,
    this.color = C.accent,
  });

  @override
  State<FloatingParticles> createState() => _FloatingParticlesState();
}

class _FloatingParticlesState extends State<FloatingParticles>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late List<_Particle> _particles;

  @override
  void initState() {
    super.initState();
    final rng = Random();
    _particles = List.generate(widget.count, (_) => _Particle(rng));
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();
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
      builder: (_, child) => CustomPaint(
        painter: _ParticlePainter(_particles, _ctrl.value, widget.color),
        size: Size.infinite,
      ),
    );
  }
}

class _Particle {
  final double x, y, size, speed, phase;
  _Particle(Random rng)
      : x = rng.nextDouble(),
        y = rng.nextDouble(),
        size = 2 + rng.nextDouble() * 4,
        speed = 0.3 + rng.nextDouble() * 0.7,
        phase = rng.nextDouble() * 2 * pi;
}

class _ParticlePainter extends CustomPainter {
  final List<_Particle> particles;
  final double t;
  final Color color;

  _ParticlePainter(this.particles, this.t, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    for (final p in particles) {
      final x = (p.x * size.width + sin(t * 2 * pi * p.speed + p.phase) * 30) %
          size.width;
      final y = (p.y * size.height +
              cos(t * 2 * pi * p.speed * 0.7 + p.phase) * 20) %
          size.height;
      final opacity = (0.1 + sin(t * 2 * pi + p.phase) * 0.1).clamp(0.05, 0.2);
      canvas.drawCircle(
        Offset(x, y),
        p.size,
        Paint()..color = color.withValues(alpha: opacity),
      );
    }
  }

  @override
  bool shouldRepaint(covariant _ParticlePainter old) => true;
}

// ─── Section Number Badge ───
class SectionBadge extends StatelessWidget {
  final int number;
  final int total;
  final Color color;

  const SectionBadge({
    super.key,
    required this.number,
    this.total = 9,
    this.color = C.accent,
  });

  @override
  Widget build(BuildContext context) {
    return ScrollReveal(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: color.withValues(alpha: 0.15)),
            ),
            child: Text(
              'CHAPTER $number OF $total',
              style: TextStyle(
                color: color,
                fontSize: 11,
                fontWeight: FontWeight.w800,
                letterSpacing: 2.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
