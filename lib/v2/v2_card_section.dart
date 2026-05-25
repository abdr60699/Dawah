import 'package:flutter/material.dart';
import '../app_theme.dart';
import 'v2_widgets.dart';

class V2CardSection extends StatelessWidget {
  const V2CardSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ─── Section 1: Life's Purpose ───
        _Section(
          bg: C.white,
          tag: 'INTRODUCTION',
          tagColor: C.accent,
          title: 'Think About\nLife\'s Purpose',
          subtitle: 'We\'re born, work hard to save money, then we die. Why?',
          children: [
            _ContentCard(
              accent: C.green,
              icon: Icons.groups_rounded,
              title: 'Common Ground',
              body: 'All religious scriptures — Christianity, Hinduism, Islam, Judaism, Sikhism, Zoroastrianism — confirm that there is only One God (without images & idols) and acknowledge the arrival of Prophet Muhammad (PBUH).',
              footnote: 'Many do not know this because their preachers are hiding the facts for worldly benefits.',
            ),
            _ContentCard(
              accent: C.accent,
              icon: Icons.auto_stories_rounded,
              title: 'The Master Key',
              body: '"Say, O People of the Scripture, come to a word that is equitable between us and you — that we will not worship except Allah and not associate anything with Him."',
              footnote: 'Quran Chapter 3 : Verse 64',
            ),
          ],
        ),

        // ─── Section 2: One God ───
        _Section(
          bg: C.bg,
          tag: 'FOUNDATION',
          tagColor: C.teal,
          title: 'The Definition\nof God.',
          subtitle: 'We accept anyone as God who fits this four-line definition.',
          children: [
            _NumberedLines(
              lines: [
                'Say: He is God, The One and Only',
                'God, the Eternal, Absolute',
                'He neither begets nor is born',
                'And there is none Like unto Him',
              ],
              source: 'Quran Chapter 112 — Surah Al-Ikhlas',
              accent: C.teal,
            ),
          ],
        ),

        // ─── Section 3: Why Religion ───
        _Section(
          bg: C.bg,
          tag: 'WHY RELIGION',
          tagColor: C.purple,
          title: 'The Instruction\nManual.',
          subtitle: 'Isn\'t being kind to all sufficient?',
          children: [
            _ContentCard(
              accent: C.purple,
              icon: Icons.menu_book_rounded,
              title: 'The Instruction Manual',
              body: 'As humans are the most complex machines on Earth, don\'t you think we need an instruction manual? The Quran serves as this manual — because our Creator knows what is good and bad for us.',
              footnote: '"The only religion acceptable in the sight of Almighty God is Islam." — Quran 3:19',
            ),
            _ContentCard(
              accent: C.accent,
              icon: Icons.mark_chat_read_rounded,
              title: 'The Final Message',
              body: 'Jesus (PBUH) said: "I still have many things to say to you, but you can\'t bear them now. However, when He, the Spirit of truth, has come, He will guide you into all truth."',
              footnote: 'Bible — Gospel of John, Ch-16:Ver:12-14',
            ),
          ],
        ),

        // ─── Section 4: Guidance ───
        _Section(
          bg: C.white,
          tag: 'GUIDANCE',
          tagColor: C.green,
          title: 'Why We Need\nGuidance.',
          subtitle: 'Allah shows you from the start what is good & bad for us.',
          children: [
            _ContentCard(
              accent: C.green,
              icon: Icons.forest_rounded,
              title: 'The Forest Analogy',
              body: 'It\'s like walking in a forest without knowing which fruits are safe. If you pick the wrong one, you might get sick. Similarly in life, it\'s wise to seek guidance from someone who knows what\'s best for you.',
            ),
            _ContentCard(
              accent: C.red,
              icon: Icons.gavel_rounded,
              title: 'Justice in the Hereafter',
              body: 'If a person kills 100 people, we can only punish him once. But what about the other 99? Almighty God can punish him in the hereafter. To be a good human being, you have to believe in religion.',
            ),
            _ContentCard(
              accent: C.gold,
              icon: Icons.balance_rounded,
              title: 'Morality Needs Religion',
              body: 'You can\'t prove logically why robbing is bad for me. The only way I see it as wrong is because of religion — even if I go unpunished in this world, in the hereafter I will be punished.',
            ),
            _ContentCard(
              accent: C.teal,
              icon: Icons.auto_awesome_rounded,
              title: 'Purpose of Life',
              body: '"And I (Allah) created not the jinns & humans except that they should worship Me (Alone)."',
              footnote: 'Quran Chapter 51 Verse 56',
            ),
          ],
        ),

        // ─── Section 5: God in Religions ───
        _Section(
          bg: C.bg,
          tag: 'EVIDENCE',
          tagColor: C.gold,
          title: 'God in World\'s\nMajor Religions.',
          subtitle: 'Every scripture confirms One God.',
          children: [
            _ScriptureCard(
              religion: 'Hinduism',
              verse: '"There is only one God, not the second; not at all, not at all, not in the least bit."',
              source: 'Brahma Sutra of Hindu Vedanta',
              color: C.green,
            ),
            _ScriptureCard(
              religion: 'Christianity',
              verse: '"Hear, O Israel: The Lord our God is one Lord."',
              source: 'Bible Mark Ch-12 Ver-29',
              color: C.accent,
            ),
            _ScriptureCard(
              religion: 'Judaism',
              verse: '"Thou shalt have none other gods before me. Thou shalt not make thee any graven image."',
              source: 'Bible Deuteronomy Ch-5 Ver-7-9',
              color: C.purple,
            ),
            _ScriptureCard(
              religion: 'Islam',
              verse: '"Say: He is God, The One and Only. God, the Eternal, Absolute. He neither begets nor is born."',
              source: 'Quran Chapter 112',
              color: C.teal,
            ),
            _ScriptureCard(
              religion: 'Sikhism',
              verse: '"There exists but one God, who is called the true, the creator, free from fear and hate, immortal, not begotten, self-existent."',
              source: 'Sri Guru Granth Sahib — Vol 1',
              color: C.red,
            ),
            _ScriptureCard(
              religion: 'Zoroastrianism',
              verse: '"He is One. Nothing resembles Him. He is without an origin or end. He has no father or mother, wife or son."',
              source: 'Dasatir',
              color: C.gold,
            ),
          ],
        ),

        // ─── Section 6: Prophet in Religions ───
        _Section(
          bg: C.white,
          tag: 'PROPHECY',
          tagColor: C.gold,
          title: 'Muhammad (PBUH)\nin All Scriptures.',
          subtitle: 'Prophesied by name across religions.',
          children: [
            _ScriptureCard(
              religion: 'Hinduism',
              verse: '"Ahmed acquired from his Lord the knowledge of eternal law. I received light from him just as from the sun."',
              source: 'Sam Veda Book II Hymn 6 Verse 8',
              color: C.green,
            ),
            _ScriptureCard(
              religion: 'Christianity',
              verse: '"And I will pray the Father, and He shall give you another comforter, that he may abide with you forever."',
              source: 'Bible — John Ch-14 Ver-16',
              color: C.accent,
            ),
            _ScriptureCard(
              religion: 'Judaism',
              verse: '"His mouth is most sweet: yea, he is altogether lovely (Muhammadim)."',
              source: 'Bible — Song of Solomon Ch-5 Ver-16',
              color: C.purple,
            ),
            _ScriptureCard(
              religion: 'Zoroastrianism',
              verse: '"Soashyant (the praised one) will be the last Prophet."',
              source: 'Bundahishn Ch-30 Ver-6-27',
              color: C.gold,
            ),
          ],
        ),

        // ─── Section 7: Misconceptions ───
        _Section(
          bg: C.white,
          tag: 'ADDRESSING',
          tagColor: C.red,
          title: 'Terrorism &\nWomen Rights.',
          subtitle: 'Islam is maligned by two things.',
          children: [
            _ContentCard(
              accent: C.red,
              icon: Icons.question_answer_rounded,
              title: 'Women Embracing Islam',
              body: 'Many in the USA, including women, are embracing Islam. If Islam doesn\'t give rights to women, why are they accepting it?',
            ),
            _ContentCard(
              accent: C.green,
              icon: Icons.favorite_rounded,
              title: 'Value of Life',
              body: '"If any one kill a person — unless it be for murder or for spreading mischief in the land — it would be as if he killed the whole humanity."',
              footnote: 'Quran Chapter 5 Verse 32',
            ),
          ],
        ),

        // ─── Section 8: Science ───
        _Section(
          bg: C.bg,
          tag: 'SCIENCE',
          tagColor: C.accent,
          title: 'Science &\nThe Quran.',
          subtitle: 'Scientific facts stated 1400 years ago — proven today.',
          children: [
            _ProbabilityCard(),
            _ContentCard(
              accent: C.accent,
              icon: Icons.science_rounded,
              title: 'The Creator',
              body: 'The only logical answer is the same as who can tell the mechanism of an unknown object — the Creator. Another name for this Creator in Arabic is ALLAH.',
            ),
            _ContentCard(
              accent: C.gold,
              icon: Icons.format_quote_rounded,
              title: 'Francis Bacon',
              body: '"A little knowledge of science makes you an atheist, but in-depth study of science makes you a believer in God."',
            ),
          ],
        ),

        // ─── Section 9: Life After Death ───
        _Section(
          bg: C.white,
          tag: 'THE TEST',
          tagColor: C.green,
          title: 'Is There Life\nAfter Death?',
          subtitle: 'Who would like to undergo this test?',
          children: [
            _ContentCard(
              accent: C.green,
              icon: Icons.emoji_events_rounded,
              title: 'The Challenge We Accepted',
              body: 'Allah asked: "Who would like to undergo this test?" The mountains shuddered. We, human beings, accepted. If we pass, we become higher than the angels. If we follow the commandment of Allah after being given free will, we live in Paradise forever.',
            ),
            _ContentCard(
              accent: C.accent,
              icon: Icons.menu_book_rounded,
              title: 'The Textbook',
              body: 'When you appear for an examination, there\'s a textbook. The textbook is the Quran and the guide is the Sahih Hadith. The minimum pass marks: believe in one God and believe Prophet Muhammad (PBUH) is the messenger of God.',
            ),
          ],
        ),

        // ─── Section 10: Kalki Purana ───
        _Section(
          bg: C.bg,
          tag: 'KALKI PURANA',
          tagColor: C.gold,
          title: 'Muhammad (PBUH)\nin Hindu Prophecy.',
          subtitle: 'Father, mother, birthplace — all prophesied.',
          children: [
            _KalkiCard(
              ref: 'Kalki Purana 2:4',
              verse: 'He will be born to Vishnuyash (Servant of God).',
              explanation: 'In Arabic, Abdullah means Servant of God — the name of the father of Prophet Muhammad (PBUH).',
              color: C.gold,
            ),
            _KalkiCard(
              ref: 'Kalki Purana 2:4',
              verse: 'He will be born at "Shambala" — place of peace.',
              explanation: 'Shambala means peace — i.e. Makkah.',
              color: C.accent,
            ),
            _KalkiCard(
              ref: 'Kalki Purana 2:11',
              verse: 'He will be born to his mother Sumati.',
              explanation: 'Sumati means gentle & wise. Amina means peaceful — the mother of Prophet Muhammad (PBUH).',
              color: C.green,
            ),
            _KalkiCard(
              ref: 'Kalki Purana 2:5',
              verse: 'Born on the 12th day of the month of Madhav.',
              explanation: 'Madhav is the month of spring = Rabi-ul-Awwal. Prophet Muhammad (PBUH) was born on the 12th.',
              color: C.red,
            ),
          ],
        ),
      ],
    );
  }
}

// ─── Reusable Section Wrapper ───────────────────────────────────────────────

class _Section extends StatelessWidget {
  final Color bg;
  final String tag;
  final Color tagColor;
  final String title;
  final String subtitle;
  final List<Widget> children;

  const _Section({
    required this.bg,
    required this.tag,
    required this.tagColor,
    required this.title,
    required this.subtitle,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final m = isMobile(context);
    return Container(
      width: double.infinity,
      color: bg,
      padding: sectionPad(context),
      child: Column(
        children: [
          // Tag
          FadeSlideIn(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
              decoration: BoxDecoration(
                color: tagColor.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                tag,
                style: TextStyle(
                  color: tagColor,
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 2,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Title
          FadeSlideIn(
            delay: const Duration(milliseconds: 80),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: m ? 32 : 48,
                fontWeight: FontWeight.w800,
                color: C.heading,
                letterSpacing: m ? -0.8 : -2,
                height: 1.08,
              ),
            ),
          ),
          const SizedBox(height: 10),
          FadeSlideIn(
            delay: const Duration(milliseconds: 120),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
              child: Text(
                subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: C.body,
                  fontSize: m ? 15 : 17,
                  height: 1.5,
                ),
              ),
            ),
          ),
          const SizedBox(height: 44),
          // Cards grid
          _buildGrid(context),
        ],
      ),
    );
  }

  Widget _buildGrid(BuildContext context) {
    final m = isMobile(context);
    final cols = m ? 1 : (children.length <= 2 ? children.length : 2);
    final gap = m ? 14.0 : 20.0;

    final rows = <Widget>[];
    for (var i = 0; i < children.length; i += cols) {
      final rowItems = <Widget>[];
      for (var j = 0; j < cols && i + j < children.length; j++) {
        if (j > 0) rowItems.add(SizedBox(width: gap));
        rowItems.add(
          Expanded(
            child: FadeSlideIn(
              delay: Duration(milliseconds: 150 + (i + j) * 80),
              child: children[i + j],
            ),
          ),
        );
      }
      // Fill remaining
      final filled = rowItems.whereType<Expanded>().length;
      for (var k = filled; k < cols; k++) {
        rowItems.add(SizedBox(width: gap));
        rowItems.add(Expanded(child: Container()));
      }
      rows.add(IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: rowItems,
        ),
      ));
      if (i + cols < children.length) rows.add(SizedBox(height: gap));
    }
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 900),
      child: Column(children: rows),
    );
  }
}

// ─── Content Card ───────────────────────────────────────────────────────────

class _ContentCard extends StatefulWidget {
  final Color accent;
  final IconData icon;
  final String title;
  final String body;
  final String? footnote;

  const _ContentCard({
    required this.accent,
    required this.icon,
    required this.title,
    required this.body,
    this.footnote,
  });

  @override
  State<_ContentCard> createState() => _ContentCardState();
}

class _ContentCardState extends State<_ContentCard> {
  bool _h = false;

  @override
  Widget build(BuildContext context) {
    final m = isMobile(context);
    return MouseRegion(
      onEnter: (_) => setState(() => _h = true),
      onExit: (_) => setState(() => _h = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.all(m ? 20 : 28),
        decoration: BoxDecoration(
          color: C.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: _h ? widget.accent.withValues(alpha: 0.3) : C.border,
          ),
          boxShadow: _h ? C.elevatedShadow : C.cardShadow,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon + Title row
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: widget.accent.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(widget.icon, color: widget.accent, size: 20),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    widget.title,
                    style: TextStyle(
                      color: C.heading,
                      fontSize: m ? 17 : 19,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.3,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Body
            Text(
              widget.body,
              style: TextStyle(
                color: C.body,
                fontSize: m ? 14 : 15,
                height: 1.65,
              ),
            ),
            // Footnote
            if (widget.footnote != null) ...[
              const SizedBox(height: 14),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: widget.accent.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(10),
                  border: Border(
                    left: BorderSide(color: widget.accent, width: 2.5),
                  ),
                ),
                child: Text(
                  widget.footnote!,
                  style: TextStyle(
                    color: widget.accent,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    height: 1.4,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// ─── Scripture Card ─────────────────────────────────────────────────────────

class _ScriptureCard extends StatefulWidget {
  final String religion;
  final String verse;
  final String source;
  final Color color;

  const _ScriptureCard({
    required this.religion,
    required this.verse,
    required this.source,
    required this.color,
  });

  @override
  State<_ScriptureCard> createState() => _ScriptureCardState();
}

class _ScriptureCardState extends State<_ScriptureCard> {
  bool _h = false;

  @override
  Widget build(BuildContext context) {
    final m = isMobile(context);
    return MouseRegion(
      onEnter: (_) => setState(() => _h = true),
      onExit: (_) => setState(() => _h = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.all(m ? 18 : 24),
        decoration: BoxDecoration(
          color: _h ? widget.color.withValues(alpha: 0.03) : C.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _h ? widget.color.withValues(alpha: 0.3) : C.border,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Religion tag
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: widget.color.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                widget.religion,
                style: TextStyle(
                  color: widget.color,
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const SizedBox(height: 14),
            // Verse
            Text(
              widget.verse,
              style: TextStyle(
                color: C.heading,
                fontSize: m ? 14 : 15,
                height: 1.6,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 10),
            // Source
            Text(
              '— ${widget.source}',
              style: TextStyle(
                color: widget.color,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Numbered Lines (for One God section) ───────────────────────────────────

class _NumberedLines extends StatelessWidget {
  final List<String> lines;
  final String source;
  final Color accent;

  const _NumberedLines({
    required this.lines,
    required this.source,
    required this.accent,
  });

  @override
  Widget build(BuildContext context) {
    final m = isMobile(context);
    return Container(
      constraints: const BoxConstraints(maxWidth: 520),
      padding: EdgeInsets.all(m ? 24 : 36),
      decoration: BoxDecoration(
        color: C.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: C.border),
        boxShadow: C.cardShadow,
      ),
      child: Column(
        children: [
          for (var i = 0; i < lines.length; i++) ...[
            Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: accent.withValues(alpha: 0.15),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '${i + 1}',
                      style: TextStyle(
                        color: accent,
                        fontWeight: FontWeight.w800,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    lines[i],
                    style: TextStyle(
                      color: C.heading,
                      fontSize: m ? 17 : 21,
                      fontWeight: FontWeight.w600,
                      height: 1.3,
                    ),
                  ),
                ),
              ],
            ),
            if (i < lines.length - 1) const SizedBox(height: 18),
          ],
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
            decoration: BoxDecoration(
              color: accent.withValues(alpha: 0.06),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              source,
              style: TextStyle(
                color: C.body,
                fontSize: m ? 12 : 14,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Probability Card ───────────────────────────────────────────────────────

class _ProbabilityCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final m = isMobile(context);
    return Container(
      padding: EdgeInsets.all(m ? 20 : 28),
      decoration: BoxDecoration(
        color: C.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: C.border),
        boxShadow: C.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: C.gold.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.calculate_rounded, color: C.gold, size: 20),
              ),
              const SizedBox(width: 14),
              Text(
                'Theory of Probability',
                style: TextStyle(
                  color: C.heading,
                  fontSize: m ? 17 : 19,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.3,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _probRow('Moonlight', 'Reflected or own light?', '1/2', C.accent),
          const SizedBox(height: 10),
          _probRow('Shape of Earth', '10 possible shapes', '1/10', C.green),
          const SizedBox(height: 10),
          _probRow('Human Creation', '1000 possible materials', '1/1000', C.red),
          const SizedBox(height: 18),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFFFFBEB),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '(1/2) x (1/10) x (1/1000) = 0.00005',
                  style: TextStyle(
                    color: C.gold,
                    fontSize: m ? 16 : 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Nearly zero. With just three things, it\'s enough to prove the Quran is from God.',
                  style: TextStyle(
                    color: C.body,
                    fontSize: 13,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _probRow(String title, String desc, String odds, Color c) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: c.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            odds,
            style: TextStyle(color: c, fontWeight: FontWeight.w800, fontSize: 13),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(
                color: C.heading, fontSize: 14, fontWeight: FontWeight.w700,
              )),
              Text(desc, style: TextStyle(
                color: C.caption, fontSize: 12,
              )),
            ],
          ),
        ),
      ],
    );
  }
}

// ─── Kalki Card ─────────────────────────────────────────────────────────────

class _KalkiCard extends StatefulWidget {
  final String ref;
  final String verse;
  final String explanation;
  final Color color;

  const _KalkiCard({
    required this.ref,
    required this.verse,
    required this.explanation,
    required this.color,
  });

  @override
  State<_KalkiCard> createState() => _KalkiCardState();
}

class _KalkiCardState extends State<_KalkiCard> {
  bool _h = false;

  @override
  Widget build(BuildContext context) {
    final m = isMobile(context);
    return MouseRegion(
      onEnter: (_) => setState(() => _h = true),
      onExit: (_) => setState(() => _h = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.all(m ? 18 : 24),
        decoration: BoxDecoration(
          color: _h ? widget.color.withValues(alpha: 0.04) : C.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: _h ? widget.color.withValues(alpha: 0.3) : C.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: widget.color.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                widget.ref,
                style: TextStyle(
                  color: widget.color,
                  fontWeight: FontWeight.w700,
                  fontSize: 11,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              widget.verse,
              style: TextStyle(
                color: C.heading,
                fontSize: m ? 14 : 16,
                fontStyle: FontStyle.italic,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.explanation,
              style: TextStyle(
                color: C.body,
                fontSize: 13,
                height: 1.45,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
