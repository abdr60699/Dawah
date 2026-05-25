import 'package:flutter/material.dart';
import '../app_theme.dart';
import 'v3_animations.dart';

// ═══════════════════════════════════════════════════════
// SECTION 1 — Life's Purpose (Image 1)
// ═══════════════════════════════════════════════════════
class V3S1Purpose extends StatelessWidget {
  const V3S1Purpose({super.key});

  @override
  Widget build(BuildContext context) {
    final m = isMobile(context);
    return CinematicSection(
      dark: true,
      child: Column(
        children: [
          SectionBadge(number: 1, color: C.accent),
          const SizedBox(height: 32),
          GradientRevealText(
            text: "What Is Your Purpose?",
            style: TextStyle(
              fontSize: m ? 36 : 60,
              fontWeight: FontWeight.w900,
              color: C.onDark,
              letterSpacing: m ? -1 : -2.5,
              height: 1.1,
            ),
            colors: const [Color(0xFF2563EB), Color(0xFF7C3AED)],
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          ScrollReveal(
            delay: const Duration(milliseconds: 300),
            child: Text(
              "Ever think about life's cycle?",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: C.onDarkSub,
                fontSize: m ? 16 : 22,
                fontWeight: FontWeight.w300,
                height: 1.6,
              ),
            ),
          ),
          const SizedBox(height: 40),
          // The 3 life stages
          _buildLifeStages(m),
          SizedBox(height: m ? 32 : 48),
          AnimatedDividerLine(color: C.accent),
          SizedBox(height: m ? 32 : 48),
          AnimatedQuote(
            quote:
                "We're born, work hard to save money, then we die. Sometimes it seems pointless, especially if we can't enjoy what we save. Ever wonder about not being born?",
            source: "A question every human asks",
            accentColor: C.purple,
            dark: true,
          ),
          const SizedBox(height: 40),
          ScrollReveal(
            delay: const Duration(milliseconds: 200),
            child: _buildKeyPoint(
              m,
              "All religious scriptures — Christianity, Hinduism, Islam, Judaism, Sikhism, Zoroastrianism — confirm that there is only One God (without images & idols) and acknowledge the arrival of Prophet Muhammad (PBUH).",
              C.green,
            ),
          ),
          const SizedBox(height: 32),
          ScrollReveal(
            delay: const Duration(milliseconds: 400),
            child: _buildDefinitionCard(m),
          ),
          const SizedBox(height: 32),
          AnimatedQuote(
            quote:
                "Science without religion is lame, religion without science is blind.",
            source: "Albert Einstein",
            accentColor: C.gold,
            dark: true,
          ),
        ],
      ),
    );
  }

  Widget _buildLifeStages(bool m) {
    final stages = [
      ("Born", Icons.child_care_rounded, C.green),
      ("Work & Save", Icons.work_rounded, C.accent),
      ("Then... Die?", Icons.help_outline_rounded, C.red),
    ];
    return ScrollReveal(
      delay: const Duration(milliseconds: 500),
      child: Wrap(
        spacing: 20,
        runSpacing: 20,
        alignment: WrapAlignment.center,
        children: [
          for (var i = 0; i < stages.length; i++) ...[
            _stageCard(stages[i].$1, stages[i].$2, stages[i].$3, m),
            if (i < stages.length - 1)
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Icon(Icons.arrow_forward_rounded,
                    color: C.onDarkSub.withValues(alpha: 0.3), size: 24),
              ),
          ],
        ],
      ),
    );
  }

  Widget _stageCard(String label, IconData icon, Color color, bool m) {
    return Container(
      width: m ? 100 : 140,
      padding: EdgeInsets.symmetric(vertical: m ? 20 : 28, horizontal: 12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: m ? 28 : 36),
          const SizedBox(height: 10),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: C.onDark,
              fontSize: m ? 13 : 15,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKeyPoint(bool m, String text, Color color) {
    return Container(
      padding: EdgeInsets.all(m ? 20 : 28),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withValues(alpha: 0.15)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.lightbulb_rounded, color: color, size: 24),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: C.onDark,
                fontSize: m ? 14 : 16,
                height: 1.7,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDefinitionCard(bool m) {
    return PulsingGlow(
      glowColor: C.accent,
      child: Container(
        padding: EdgeInsets.all(m ? 20 : 32),
        decoration: BoxDecoration(
          color: C.bgDark2,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: C.accent.withValues(alpha: 0.2)),
        ),
        child: Column(
          children: [
            Text(
              "The Islamic Definition of God",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: C.accent,
                fontSize: m ? 14 : 16,
                fontWeight: FontWeight.w800,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 20),
            for (var i = 0; i < _surahIkhlas.length; i++)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    NumberPill(number: '${i + 1}', color: C.accent),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Text(
                        _surahIkhlas[i],
                        style: TextStyle(
                          color: C.onDark,
                          fontSize: m ? 14 : 17,
                          fontWeight: FontWeight.w600,
                          height: 1.5,
                        ),
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

const _surahIkhlas = [
  "Say: He is God, The One and Only.",
  "God, the Eternal, Absolute.",
  "He neither begets nor is born.",
  "And there is none like unto Him.",
];

// ═══════════════════════════════════════════════════════
// SECTION 2 — Why Religion? (Image 2)
// ═══════════════════════════════════════════════════════
class V3S2WhyReligion extends StatelessWidget {
  const V3S2WhyReligion({super.key});

  @override
  Widget build(BuildContext context) {
    final m = isMobile(context);
    return CinematicSection(
      child: Column(
        children: [
          SectionBadge(number: 2, color: C.green),
          const SizedBox(height: 32),
          GradientRevealText(
            text: "Why Follow a Religion?",
            style: TextStyle(
              fontSize: m ? 32 : 56,
              fontWeight: FontWeight.w900,
              color: C.heading,
              letterSpacing: m ? -1 : -2.5,
              height: 1.1,
            ),
            colors: const [Color(0xFF059669), Color(0xFF0D9488)],
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ScrollReveal(
            delay: const Duration(milliseconds: 200),
            child: Text(
              "Isn't being kind to all sufficient?",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: C.body,
                fontSize: m ? 16 : 20,
                fontWeight: FontWeight.w400,
                height: 1.6,
              ),
            ),
          ),
          const SizedBox(height: 40),
          ScrollReveal(
            delay: const Duration(milliseconds: 300),
            child: _instructionManualCard(m),
          ),
          const SizedBox(height: 32),
          AnimatedDividerLine(color: C.green),
          const SizedBox(height: 32),
          AnimatedQuote(
            quote:
                "What is the definition of kindness? And who will tell you what is good and bad? If you get a complicated machine, you receive an instruction manual. As humans are the most complex machines on Earth, don't you think this requires an instruction manual?",
            source: "The logic of religion",
            accentColor: C.green,
          ),
          const SizedBox(height: 32),
          ScrollReveal(
            delay: const Duration(milliseconds: 200),
            child: _quranVerseCard(m),
          ),
          const SizedBox(height: 32),
          ScrollReveal(
            delay: const Duration(milliseconds: 400),
            child: _finalMessageCard(m),
          ),
        ],
      ),
    );
  }

  Widget _instructionManualCard(bool m) {
    return Container(
      padding: EdgeInsets.all(m ? 20 : 32),
      decoration: BoxDecoration(
        color: C.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: C.cardShadow,
      ),
      child: Column(
        children: [
          Icon(Icons.menu_book_rounded, color: C.green, size: m ? 40 : 56),
          const SizedBox(height: 16),
          Text(
            "The Quran: Your Instruction Manual",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: C.heading,
              fontSize: m ? 20 : 26,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            "The Quran serves as the instruction manual because our Creator (God) knows what is good and bad for us. Almighty God has sent only one religion.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: C.body,
              fontSize: m ? 14 : 16,
              height: 1.7,
            ),
          ),
        ],
      ),
    );
  }

  Widget _quranVerseCard(bool m) {
    return Container(
      padding: EdgeInsets.all(m ? 20 : 28),
      decoration: BoxDecoration(
        color: C.green.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: C.green.withValues(alpha: 0.15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.auto_stories_rounded, color: C.green, size: 20),
              const SizedBox(width: 10),
              Text(
                "Quran Chapter 3, Verse 19",
                style: TextStyle(
                  color: C.green,
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            "The only religion acceptable in the sight of Almighty God is Islam.",
            style: TextStyle(
              color: C.heading,
              fontSize: m ? 16 : 20,
              fontWeight: FontWeight.w700,
              height: 1.5,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }

  Widget _finalMessageCard(bool m) {
    return Container(
      padding: EdgeInsets.all(m ? 20 : 28),
      decoration: BoxDecoration(
        color: C.teal.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: C.teal.withValues(alpha: 0.15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "The Final Revelation",
            style: TextStyle(
              color: C.teal,
              fontSize: m ? 16 : 20,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            "Islam came in its complete form 1400 years ago. All previous revelations had the same basic message — believing in One God (no idols or images). All scriptures before were time-bound for a particular group. When the last and final revelation was revealed, no other revelations are going to come. Allah takes it upon himself to preserve it. It is not only meant for the Muslims of the Arabs — it's meant for the whole of humanity.",
            style: TextStyle(
              color: C.body,
              fontSize: m ? 14 : 16,
              height: 1.7,
            ),
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════
// SECTION 3 — Guidance (Image 3)
// ═══════════════════════════════════════════════════════
class V3S3Guidance extends StatelessWidget {
  const V3S3Guidance({super.key});

  @override
  Widget build(BuildContext context) {
    final m = isMobile(context);
    return CinematicSection(
      dark: true,
      child: Column(
        children: [
          SectionBadge(number: 3, color: C.teal),
          const SizedBox(height: 32),
          GradientRevealText(
            text: "Why We Need Guidance",
            style: TextStyle(
              fontSize: m ? 32 : 56,
              fontWeight: FontWeight.w900,
              color: C.onDark,
              letterSpacing: m ? -1 : -2.5,
              height: 1.1,
            ),
            colors: const [Color(0xFF0D9488), Color(0xFF059669)],
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          ScrollReveal(
            child: _forestAnalogy(m),
          ),
          const SizedBox(height: 32),
          AnimatedDividerLine(color: C.teal),
          const SizedBox(height: 32),
          ScrollReveal(
            delay: const Duration(milliseconds: 200),
            child: _robberyArgument(m),
          ),
          const SizedBox(height: 32),
          ScrollReveal(
            delay: const Duration(milliseconds: 300),
            child: _justiceArgument(m),
          ),
          const SizedBox(height: 32),
          _buildQuranVerses(m),
          const SizedBox(height: 32),
          AnimatedQuote(
            quote:
                "Only the Quran is in its 100% pure form and passes scientific tests where other holy books do not.",
            source: "A verifiable claim",
            accentColor: C.teal,
            dark: true,
          ),
          const SizedBox(height: 32),
          ScrollReveal(
            delay: const Duration(milliseconds: 200),
            child: _purposeVerse(m),
          ),
        ],
      ),
    );
  }

  Widget _forestAnalogy(bool m) {
    return Container(
      padding: EdgeInsets.all(m ? 20 : 28),
      decoration: BoxDecoration(
        color: C.green.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: C.green.withValues(alpha: 0.15)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.forest_rounded, color: C.green, size: 32),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              "Allah shows you from the start what is good & bad for us. It's like walking in a forest without knowing which fruits are safe to eat. If you pick the wrong one, you might get sick. So it's smart to ask someone who knows about the forest. Similarly in life, it's wise to seek guidance from someone who knows what's best for you.",
              style: TextStyle(
                color: C.onDark,
                fontSize: m ? 14 : 16,
                height: 1.7,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _robberyArgument(bool m) {
    return Container(
      padding: EdgeInsets.all(m ? 20 : 28),
      decoration: BoxDecoration(
        color: C.red.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: C.red.withValues(alpha: 0.15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.gavel_rounded, color: C.red, size: 22),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  "The Moral Argument",
                  style: TextStyle(
                    color: C.red,
                    fontSize: m ? 15 : 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            "You can't prove logically & scientifically why robbing is bad. The only way I see it as wrong is because of religion. Even if I rob and go without punishment in this world, in the hereafter I will be punished.",
            style: TextStyle(
              color: C.onDark,
              fontSize: m ? 14 : 16,
              height: 1.7,
            ),
          ),
        ],
      ),
    );
  }

  Widget _justiceArgument(bool m) {
    return Container(
      padding: EdgeInsets.all(m ? 20 : 28),
      decoration: BoxDecoration(
        color: C.purple.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: C.purple.withValues(alpha: 0.15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.balance_rounded, color: C.purple, size: 22),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  "Divine Justice",
                  style: TextStyle(
                    color: C.purple,
                    fontSize: m ? 15 : 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            "Imagine if a person kills 100 people. We can only punish him once. But what about the rest of the 99 victims? Logically, we can't give adequate punishment. But Almighty God can punish him in the hereafter — He can hold him accountable for every single life.",
            style: TextStyle(
              color: C.onDark,
              fontSize: m ? 14 : 16,
              height: 1.7,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuranVerses(bool m) {
    return StaggerList(
      baseDelay: const Duration(milliseconds: 200),
      children: [
        _verseCard(
          m,
          "Purpose of Life",
          "And I (Allah) created not the jinns & humans except they should worship Me (Alone).",
          "Quran 51:56",
          C.green,
        ),
        const SizedBox(height: 16),
        _verseCard(
          m,
          "No Contradiction",
          "Do they not consider the Quran (with care)? Had it been from other than Allah, they would surely have found therein much contradiction.",
          "Quran 4:82",
          C.accent,
        ),
      ],
    );
  }

  Widget _verseCard(bool m, String title, String verse, String ref, Color color) {
    return Container(
      padding: EdgeInsets.all(m ? 16 : 24),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(16),
        border: Border(left: BorderSide(color: color, width: 4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(
                  color: color, fontSize: 13, fontWeight: FontWeight.w800)),
          const SizedBox(height: 8),
          Text(verse,
              style: TextStyle(
                color: C.onDark,
                fontSize: m ? 14 : 17,
                height: 1.6,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500,
              )),
          const SizedBox(height: 8),
          Text(ref,
              style: TextStyle(
                  color: C.onDarkSub, fontSize: 12, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  Widget _purposeVerse(bool m) {
    return Container(
      padding: EdgeInsets.all(m ? 20 : 28),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            C.teal.withValues(alpha: 0.08),
            C.green.withValues(alpha: 0.04),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            "Quran 5:32",
            style: TextStyle(
              color: C.teal, fontSize: 13, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 12),
          Text(
            "If anyone kills a person — unless it be for murder or for spreading mischief in the land — it would be as if he killed the whole humanity. And if anyone saved a life, it would be as if he saved the life of the whole humanity.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: C.onDark,
              fontSize: m ? 15 : 18,
              fontWeight: FontWeight.w600,
              height: 1.6,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════
// SECTION 4 — God in Scriptures (Image 4 — Table)
// ═══════════════════════════════════════════════════════
class V3S4GodInScriptures extends StatelessWidget {
  const V3S4GodInScriptures({super.key});

  @override
  Widget build(BuildContext context) {
    final m = isMobile(context);
    return CinematicSection(
      child: Column(
        children: [
          SectionBadge(number: 4, color: C.gold),
          const SizedBox(height: 32),
          GradientRevealText(
            text: "One God in Every Scripture",
            style: TextStyle(
              fontSize: m ? 30 : 52,
              fontWeight: FontWeight.w900,
              color: C.heading,
              letterSpacing: m ? -1 : -2,
              height: 1.1,
            ),
            colors: const [Color(0xFFD97706), Color(0xFFDC2626)],
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ScrollReveal(
            delay: const Duration(milliseconds: 200),
            child: Text(
              "The concept of One God exists in every major religion's holy book.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: C.body,
                fontSize: m ? 15 : 18,
                height: 1.6,
              ),
            ),
          ),
          const SizedBox(height: 40),
          ..._scriptureData.asMap().entries.map((e) => AnimatedScriptureRow(
                religion: e.value.$1,
                verse: e.value.$2,
                reference: e.value.$3,
                color: e.value.$4,
                index: e.key,
              )),
          const SizedBox(height: 32),
          AnimatedDividerLine(color: C.gold),
          const SizedBox(height: 32),
          ScrollReveal(
            child: _shirkWarning(m),
          ),
        ],
      ),
    );
  }

  Widget _shirkWarning(bool m) {
    return Container(
      padding: EdgeInsets.all(m ? 20 : 28),
      decoration: BoxDecoration(
        color: C.red.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: C.red.withValues(alpha: 0.15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.warning_amber_rounded, color: C.red, size: 22),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  "Greatest Sin: Shirk (Associating Partners with Allah)",
                  style: TextStyle(
                    color: C.red,
                    fontSize: m ? 14 : 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            "Jesus (PBUH) never claimed divinity — there is not a single unequivocal statement in the Bible where he says 'I am God' or 'worship me.' Shirk means sharing or associating partners with Allah and is equivalent to idolatry.",
            style: TextStyle(color: C.body, fontSize: m ? 14 : 15, height: 1.7),
          ),
          const SizedBox(height: 12),
          Text(
            "Quran 4:48 — Allah forgives not that partners should be set up with Him, but He forgives anything else, to whom He pleases. To set up partners with Allah is to devise a sin most heinous indeed.",
            style: TextStyle(
              color: C.heading,
              fontSize: m ? 13 : 14,
              height: 1.6,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

const _scriptureData = [
  (
    "HINDUISM",
    "Ekam Brahm, dvitiya naste neh na naste kinchan — There is only one God, not the second; not at all, not at all, not in the least bit.",
    "Brahma Sutra of Hindu Vedanta",
    Color(0xFFD97706),
  ),
  (
    "HINDUISM",
    "Sages (learned Priests) call one God by many names. There is no image of Him.",
    "Rig Veda Book 1 Hymn 164, Verse 46 & Yajur Veda Ch-32 Ver-3",
    Color(0xFFD97706),
  ),
  (
    "CHRISTIANITY",
    "My Father is Greater than I.",
    "Bible — John Ch-14, Verse 28",
    Color(0xFF2563EB),
  ),
  (
    "CHRISTIANITY & JUDAISM",
    "Shama Israelu Adonai Ila Hayno Adna Ikhad — Hear, O Israel: The Lord our God is one Lord.",
    "Bible — Mark Ch-12 Verse 29 & Deuteronomy Ch-6 Verse 4",
    Color(0xFF7C3AED),
  ),
  (
    "JUDAISM",
    "Thou shalt have none other gods before me. Thou shalt not make thee any graven image, or any likeness of anything that is in heaven above.",
    "Bible — Deuteronomy Chapter 5, Verse 7-9",
    Color(0xFF7C3AED),
  ),
  (
    "ISLAM",
    "Say: He is God, The One and Only. God, the Eternal, Absolute. He neither begets nor is born. And there is none like unto Him.",
    "Quran Chapter 112",
    Color(0xFF059669),
  ),
  (
    "ZOROASTRIANISM",
    "He is One. Nothing resembles Him. He is without an origin or end. He has no father or mothers, wife or son. Without a body or form.",
    "Qualities of God according to Dasatir",
    Color(0xFF0D9488),
  ),
  (
    "SIKHISM",
    "There exists but one God, who is called the true, the creator, free from fear and hate, immortal, not begotten, self-existent, Great & Compassionate.",
    "Sri Guru Granth Sahib — Volume 1, Japuji, Verse 1",
    Color(0xFFDC2626),
  ),
];

// ═══════════════════════════════════════════════════════
// SECTION 5 — Prophet Muhammad in All Religions (Image 5)
// ═══════════════════════════════════════════════════════
class V3S5ProphetMuhammad extends StatelessWidget {
  const V3S5ProphetMuhammad({super.key});

  @override
  Widget build(BuildContext context) {
    final m = isMobile(context);
    return CinematicSection(
      dark: true,
      child: Column(
        children: [
          SectionBadge(number: 5, color: C.red),
          const SizedBox(height: 32),
          GradientRevealText(
            text: "Muhammad (PBUH)\nMentioned in All Religions",
            style: TextStyle(
              fontSize: m ? 28 : 48,
              fontWeight: FontWeight.w900,
              color: C.onDark,
              letterSpacing: m ? -1 : -2,
              height: 1.15,
            ),
            colors: const [Color(0xFFDC2626), Color(0xFFD97706)],
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          ..._prophetData.asMap().entries.map((e) => AnimatedScriptureRow(
                religion: e.value.$1,
                verse: e.value.$2,
                reference: e.value.$3,
                color: e.value.$4,
                index: e.key,
                dark: true,
              )),
          const SizedBox(height: 32),
          AnimatedDividerLine(color: C.red),
          const SizedBox(height: 32),
          AnimatedQuote(
            quote:
                "Many people have a misconception that Prophet Muhammad (PBUH) is the founder of the religion of Islam. In fact, Islam is in existence since man first set foot on earth. God Almighty has sent several Prophets and revelations.",
            source: "A clarification",
            accentColor: C.red,
            dark: true,
          ),
          const SizedBox(height: 24),
          ScrollReveal(
            delay: const Duration(milliseconds: 200),
            child: _quranVerse(m),
          ),
        ],
      ),
    );
  }

  Widget _quranVerse(bool m) {
    return Container(
      padding: EdgeInsets.all(m ? 20 : 28),
      decoration: BoxDecoration(
        color: C.red.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(16),
        border: Border(left: BorderSide(color: C.red, width: 4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Quran 108:1-3",
              style: TextStyle(
                  color: C.red, fontSize: 13, fontWeight: FontWeight.w800)),
          const SizedBox(height: 8),
          Text(
            "To you have We granted the fount (of Abundance). Therefore to your Lord turn in Prayer and Sacrifice. For he who hates you, He will be cut off (from Future Hope).",
            style: TextStyle(
              color: C.onDark,
              fontSize: m ? 14 : 17,
              height: 1.6,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

const _prophetData = [
  (
    "HINDUISM",
    "\"Ahmed acquired from his Lord the knowledge of eternal law. I received light from him just as from the sun.\" — The name of the Prophet is Ahmed, since Ahmed is an Arabic name.",
    "Sam Veda Book II, Hymn 6, Verse 8",
    Color(0xFFD97706),
  ),
  (
    "CHRISTIANITY",
    "And I will pray the Father, and He shall give you another comforter, that he may abide with you forever. — Jesus (PBUH) prophesied the coming of the 'Comforter' — Muhammad (PBUH).",
    "Bible — John Chapter 14, Verse 16",
    Color(0xFF2563EB),
  ),
  (
    "JUDAISM",
    "\"Hikko Mamittakim we kullo Muhammadim Zehdoodeh wa Zahraee Bayna Jerusalem\" — His mouth is most sweet: yea, he is altogether lovely. Muhammad (PBUH) MENTIONED BY NAME.",
    "The Bible — Song of Solomon, Chapter 5, Verse 16",
    Color(0xFF7C3AED),
  ),
  (
    "ZOROASTRIANISM",
    "Soashyant will be the last Prophet. — Soashyant means the 'praised one' (Hastings Encyclopedia) which translated in Arabic means Muhammad (PBUH).",
    "Bundahishn Chapter 30, Verses 6-27",
    Color(0xFF0D9488),
  ),
];

// ═══════════════════════════════════════════════════════
// SECTION 6 — Science & Quran (Image 6 + 7)
// ═══════════════════════════════════════════════════════
class V3S6Science extends StatelessWidget {
  const V3S6Science({super.key});

  @override
  Widget build(BuildContext context) {
    final m = isMobile(context);
    return CinematicSection(
      child: Column(
        children: [
          SectionBadge(number: 6, color: C.accent),
          const SizedBox(height: 32),
          GradientRevealText(
            text: "Science & The Quran",
            style: TextStyle(
              fontSize: m ? 32 : 56,
              fontWeight: FontWeight.w900,
              color: C.heading,
              letterSpacing: m ? -1 : -2.5,
              height: 1.1,
            ),
            colors: const [Color(0xFF2563EB), Color(0xFF059669)],
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ScrollReveal(
            delay: const Duration(milliseconds: 200),
            child: Text(
              "Scientific facts stated 1400 years ago, proven today.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: C.body,
                fontSize: m ? 15 : 18,
                height: 1.6,
              ),
            ),
          ),
          const SizedBox(height: 40),
          ScrollReveal(
            child: _challengeCard(m),
          ),
          const SizedBox(height: 32),
          AnimatedDividerLine(color: C.accent),
          const SizedBox(height: 32),
          ScrollReveal(
            delay: const Duration(milliseconds: 200),
            child: _probabilitySection(m),
          ),
          const SizedBox(height: 32),
          _buildFactCards(m),
          const SizedBox(height: 32),
          AnimatedQuote(
            quote:
                "A little knowledge of science makes you an atheist, but in-depth study of science makes you a believer in God.",
            source: "Francis Bacon — Famous Scientist",
            accentColor: C.accent,
          ),
          const SizedBox(height: 32),
          ScrollReveal(
            delay: const Duration(milliseconds: 200),
            child: _signsVerse(m),
          ),
        ],
      ),
    );
  }

  Widget _challengeCard(bool m) {
    return PulsingGlow(
      glowColor: C.accent,
      child: Container(
        padding: EdgeInsets.all(m ? 20 : 32),
        decoration: BoxDecoration(
          color: C.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: C.elevatedShadow,
          border: Border.all(color: C.accent.withValues(alpha: 0.15)),
        ),
        child: Column(
          children: [
            Icon(Icons.shield_rounded, color: C.accent, size: m ? 36 : 48),
            const SizedBox(height: 16),
            Text(
              "The Unbeatable Challenge",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: C.heading,
                fontSize: m ? 20 : 28,
                fontWeight: FontWeight.w800,
                letterSpacing: -0.5,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              "Disproving a single thing mentioned in the Quran is a challenge that remains unmet, even though it has many falsification tests to try.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: C.body,
                fontSize: m ? 14 : 16,
                height: 1.7,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: C.accent.withValues(alpha: 0.06),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedCounter(
                    end: 1400,
                    suffix: "+",
                    style: TextStyle(
                      color: C.accent,
                      fontSize: m ? 24 : 32,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "years\nunchallenged",
                    style: TextStyle(
                      color: C.body,
                      fontSize: m ? 12 : 14,
                      fontWeight: FontWeight.w600,
                      height: 1.3,
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

  Widget _probabilitySection(bool m) {
    return Container(
      padding: EdgeInsets.all(m ? 20 : 28),
      decoration: BoxDecoration(
        color: C.purple.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: C.purple.withValues(alpha: 0.15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Theory of Probability",
            style: TextStyle(
              color: C.purple,
              fontSize: m ? 18 : 24,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 16),
          _probabilityRow(m, "Moonlight", "Reflected or its own light?", "1/2",
              C.accent),
          const SizedBox(height: 12),
          _probabilityRow(
              m, "Shape of Earth", "10 possible shapes", "1/10", C.green),
          const SizedBox(height: 12),
          _probabilityRow(m, "Human Material", "1000+ possible materials",
              "1/1000", C.gold),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: C.red.withValues(alpha: 0.06),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Text(
                  "Combined Probability",
                  style: TextStyle(
                    color: C.red,
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "0.00005",
                  style: TextStyle(
                    color: C.heading,
                    fontSize: m ? 28 : 40,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -1,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Nearly zero. It is beyond human capacity to make all guesses correct without a single mistake.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: C.body,
                    fontSize: m ? 12 : 14,
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

  Widget _probabilityRow(
      bool m, String label, String desc, String prob, Color color) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            prob,
            style: TextStyle(
              color: color,
              fontSize: 14,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label,
                  style: TextStyle(
                    color: C.heading,
                    fontSize: m ? 14 : 16,
                    fontWeight: FontWeight.w700,
                  )),
              Text(desc,
                  style: TextStyle(
                    color: C.caption,
                    fontSize: m ? 12 : 13,
                  )),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFactCards(bool m) {
    final facts = [
      (
        "An educated atheist believes that scientific knowledge is the ultimate test.",
        Icons.science_rounded,
        C.accent,
      ),
      (
        "Prophet Muhammad (PBUH) lived for 23 years as a prophet in the world, and the Quran described him as an unlettered Prophet.",
        Icons.history_edu_rounded,
        C.green,
      ),
      (
        "Prof Tejasen conducted research on pain receptors and was impressed by the scientific accuracy of the Quranic verse, and he publicly accepted Islam.",
        Icons.biotech_rounded,
        C.teal,
      ),
    ];

    return StaggerList(
      baseDelay: const Duration(milliseconds: 200),
      children: [
        for (final (text, icon, color) in facts)
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Container(
              padding: EdgeInsets.all(m ? 16 : 20),
              decoration: BoxDecoration(
                color: C.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: C.cardShadow,
                border: Border(left: BorderSide(color: color, width: 3)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(icon, color: color, size: 24),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Text(
                      text,
                      style: TextStyle(
                        color: C.body,
                        fontSize: m ? 13 : 15,
                        height: 1.6,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }

  Widget _signsVerse(bool m) {
    return Container(
      padding: EdgeInsets.all(m ? 20 : 28),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            C.accent.withValues(alpha: 0.06),
            C.green.withValues(alpha: 0.03),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text("Quran 41:53",
              style: TextStyle(
                  color: C.accent, fontSize: 13, fontWeight: FontWeight.w800)),
          const SizedBox(height: 12),
          Text(
            "Soon will We show them our Signs in the (furthest) regions (of the earth), and in their own souls, until it becomes clear to them that this is the Truth. Is it not enough that thy Lord doth witness all things?",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: C.heading,
              fontSize: m ? 15 : 18,
              fontWeight: FontWeight.w600,
              height: 1.6,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════
// SECTION 7 — Life After Death (Image 8)
// ═══════════════════════════════════════════════════════
class V3S7LifeAfterDeath extends StatelessWidget {
  const V3S7LifeAfterDeath({super.key});

  @override
  Widget build(BuildContext context) {
    final m = isMobile(context);
    return CinematicSection(
      dark: true,
      child: Column(
        children: [
          SectionBadge(number: 7, color: C.green),
          const SizedBox(height: 32),
          GradientRevealText(
            text: "Life After Death",
            style: TextStyle(
              fontSize: m ? 34 : 60,
              fontWeight: FontWeight.w900,
              color: C.onDark,
              letterSpacing: m ? -1 : -2.5,
              height: 1.1,
            ),
            colors: const [Color(0xFF059669), Color(0xFF2563EB)],
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ScrollReveal(
            delay: const Duration(milliseconds: 200),
            child: Text(
              "Who would like to undergo this test?",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: C.onDarkSub,
                fontSize: m ? 16 : 22,
                fontWeight: FontWeight.w300,
                height: 1.6,
              ),
            ),
          ),
          const SizedBox(height: 40),
          ScrollReveal(
            child: _testExplanation(m),
          ),
          const SizedBox(height: 32),
          _buildKeyPoints(m),
          const SizedBox(height: 32),
          AnimatedDividerLine(color: C.green),
          const SizedBox(height: 32),
          StaggerList(
            baseDelay: const Duration(milliseconds: 200),
            children: [
              _verseCard(
                m,
                "The Trust",
                "We did indeed offer the Trust to the Heavens and the Earth and the Mountains; but they refused to undertake it, being afraid thereof: but man undertook it — He was indeed unjust and foolish.",
                "Quran 33:72",
                C.green,
              ),
              const SizedBox(height: 16),
              _verseCard(
                m,
                "Purpose of Life & Death",
                "He Who created Death and Life, that He may try which of you is best in deed: and He is the Exalted in Might, Oft-Forgiving.",
                "Quran 67:2",
                C.accent,
              ),
            ],
          ),
          const SizedBox(height: 32),
          ScrollReveal(
            delay: const Duration(milliseconds: 400),
            child: _zakatSection(m),
          ),
        ],
      ),
    );
  }

  Widget _testExplanation(bool m) {
    return Container(
      padding: EdgeInsets.all(m ? 20 : 28),
      decoration: BoxDecoration(
        color: C.green.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: C.green.withValues(alpha: 0.15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Allah SWT asked us, \"Who would like to undergo this test?\"",
            style: TextStyle(
              color: C.onDark,
              fontSize: m ? 16 : 20,
              fontWeight: FontWeight.w700,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "The mountains shuddered. We, human beings, were fools — we accepted the challenge. If we pass, we become higher than the angels. Angels are creations of Allah who follow everything — they have no option. However, we human beings have free will. If we follow the commandment of Allah after being given free will, we become higher than the angels and live in Paradise forever.",
            style: TextStyle(
              color: C.onDarkSub,
              fontSize: m ? 14 : 16,
              height: 1.7,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKeyPoints(bool m) {
    final points = [
      (
        "The textbook of the examination is the Quran and the guide is the Sahih Hadith.",
        Icons.menu_book_rounded,
        C.green
      ),
      (
        "Now we are undergoing the test in this world — a test for the hereafter.",
        Icons.quiz_rounded,
        C.accent
      ),
      (
        "The minimum to pass: believe in One God and believe Prophet Muhammad is the messenger & servant of God.",
        Icons.check_circle_rounded,
        C.gold
      ),
    ];

    return StaggerList(
      baseDelay: const Duration(milliseconds: 200),
      children: [
        for (final (text, icon, color) in points)
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Container(
              padding: EdgeInsets.all(m ? 16 : 20),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.06),
                borderRadius: BorderRadius.circular(14),
                border: Border(left: BorderSide(color: color, width: 3)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(icon, color: color, size: 22),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Text(
                      text,
                      style: TextStyle(
                        color: C.onDark,
                        fontSize: m ? 14 : 16,
                        height: 1.6,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }

  Widget _verseCard(bool m, String title, String verse, String ref, Color color) {
    return Container(
      padding: EdgeInsets.all(m ? 16 : 24),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(16),
        border: Border(left: BorderSide(color: color, width: 4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(
                  color: color, fontSize: 13, fontWeight: FontWeight.w800)),
          const SizedBox(height: 8),
          Text(verse,
              style: TextStyle(
                color: C.onDark,
                fontSize: m ? 14 : 17,
                height: 1.6,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500,
              )),
          const SizedBox(height: 8),
          Text(ref,
              style: TextStyle(
                  color: C.onDarkSub, fontSize: 12, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  Widget _zakatSection(bool m) {
    return Container(
      padding: EdgeInsets.all(m ? 20 : 28),
      decoration: BoxDecoration(
        color: C.teal.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: C.teal.withValues(alpha: 0.15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.volunteer_activism_rounded, color: C.teal, size: 22),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  "Islam's Practical System: Zakat",
                  style: TextStyle(
                    color: C.teal,
                    fontSize: m ? 15 : 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            "Most religions say good things and discourage crimes, but Islam uniquely provides a practical way to achieve a state where people will not rob or harm others. In Islam, every rich person with savings of more than 85 grams of gold should give 2.5% of excess wealth in charity (Zakat). This is a practical system that produces real results.",
            style: TextStyle(
              color: C.onDark,
              fontSize: m ? 14 : 16,
              height: 1.7,
            ),
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════
// SECTION 8 — Kalki Avatar / Prophecy (Image 9)
// ═══════════════════════════════════════════════════════
class V3S8Kalki extends StatelessWidget {
  const V3S8Kalki({super.key});

  @override
  Widget build(BuildContext context) {
    final m = isMobile(context);
    return CinematicSection(
      child: Column(
        children: [
          SectionBadge(number: 8, color: C.purple),
          const SizedBox(height: 32),
          GradientRevealText(
            text: "The Kalki Avatar Prophecy",
            style: TextStyle(
              fontSize: m ? 30 : 52,
              fontWeight: FontWeight.w900,
              color: C.heading,
              letterSpacing: m ? -1 : -2,
              height: 1.1,
            ),
            colors: const [Color(0xFF7C3AED), Color(0xFFD97706)],
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ScrollReveal(
            delay: const Duration(milliseconds: 200),
            child: Text(
              "Prophecies in the Kalki Purana that match Prophet Muhammad (PBUH)",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: C.body,
                fontSize: m ? 15 : 18,
                height: 1.6,
              ),
            ),
          ),
          const SizedBox(height: 40),
          ..._kalkiData.asMap().entries.map((e) => _prophecyCard(
                m,
                e.value.$1,
                e.value.$2,
                e.value.$3,
                e.key,
              )),
          const SizedBox(height: 32),
          AnimatedDividerLine(color: C.purple),
          const SizedBox(height: 32),
          AnimatedQuote(
            quote:
                "Nobody can disprove a single thing in the Quran. God has given us many chances to prove Him wrong through the Quran but nobody has been able to do it in 1400+ years.",
            source: "An open challenge",
            accentColor: C.purple,
          ),
        ],
      ),
    );
  }

  Widget _prophecyCard(
      bool m, String prophecy, String fulfillment, Color color, int index) {
    return ScrollReveal(
      delay: Duration(milliseconds: index * 150),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: EdgeInsets.all(m ? 16 : 24),
        decoration: BoxDecoration(
          color: C.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: C.cardShadow,
          border: Border(left: BorderSide(color: color, width: 4)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                NumberPill(number: '${index + 1}', color: color),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    prophecy,
                    style: TextStyle(
                      color: C.heading,
                      fontSize: m ? 14 : 16,
                      fontWeight: FontWeight.w700,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.check_circle_rounded, color: color, size: 18),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      fulfillment,
                      style: TextStyle(
                        color: C.body,
                        fontSize: m ? 13 : 14,
                        height: 1.5,
                      ),
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

const _kalkiData = [
  (
    "He (Kalki) will be born in the name of the father of Prophet Muhammad (PBUH) — \"Vishnuyash\" (Abdullah) meaning \"Servant of God\"",
    "Prophet Muhammad's father was Abdullah, which means 'Servant of God' in Arabic — matching Vishnuyash exactly.",
    Color(0xFF7C3AED),
  ),
  (
    "His mother's name would be Sumati — meaning \"gentle & wise\"",
    "The name of his mother was Aminah, which means 'peaceful' in Arabic — the same meaning as Sumati.",
    Color(0xFFD97706),
  ),
  (
    "He will be born in the land of \"Shambala\" — meaning land of peace",
    "Prophet Muhammad (PBUH) was born in Makkah, which is known as Dar al-Amn — the land of peace.",
    Color(0xFF059669),
  ),
  (
    "Deva (God / One alone) will give him a swift horse to ride and travel the world",
    "Prophet Muhammad (PBUH) was given the Buraq, a swift celestial steed, during the night journey (Isra and Mi'raj).",
    Color(0xFF2563EB),
  ),
  (
    "He will be aided by four companions",
    "Prophet Muhammad (PBUH) had 4 righteous caliphs: Abu Bakr, Umar, Uthman, and Ali (RA).",
    Color(0xFFDC2626),
  ),
];

// ═══════════════════════════════════════════════════════
// SECTION 9 — Heart of the Message (Final CTA)
// ═══════════════════════════════════════════════════════
class V3S9Heart extends StatelessWidget {
  const V3S9Heart({super.key});

  @override
  Widget build(BuildContext context) {
    final m = isMobile(context);
    return CinematicSection(
      dark: true,
      bgColor: const Color(0xFF0A0A12),
      padding: EdgeInsets.symmetric(
        horizontal: m ? 24 : 64,
        vertical: m ? 64 : 100,
      ),
      child: Column(
        children: [
          SectionBadge(number: 9, color: C.gold),
          const SizedBox(height: 40),
          GradientRevealText(
            text: "Heart of the Message",
            duration: const Duration(milliseconds: 2500),
            style: TextStyle(
              fontSize: m ? 36 : 64,
              fontWeight: FontWeight.w900,
              color: C.onDark,
              letterSpacing: m ? -1.5 : -3,
              height: 1.1,
            ),
            colors: const [Color(0xFFD97706), Color(0xFFDC2626), Color(0xFF7C3AED)],
            textAlign: TextAlign.center,
          ),
          SizedBox(height: m ? 32 : 48),
          ScrollReveal(
            delay: const Duration(milliseconds: 400),
            child: PulsingGlow(
              glowColor: C.gold,
              maxRadius: 30,
              child: Container(
                padding: EdgeInsets.all(m ? 24 : 40),
                decoration: BoxDecoration(
                  color: C.bgDark2,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: C.gold.withValues(alpha: 0.2)),
                ),
                child: Column(
                  children: [
                    Text(
                      "Believe & Accept 100%",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: C.gold,
                        fontSize: m ? 14 : 16,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 2,
                      ),
                    ),
                    const SizedBox(height: 24),
                    TypewriterText(
                      text:
                          "That there is only One God, with no images or idols, and Prophet Muhammad (PBUH) is the Messenger & Servant of God.",
                      charDelay: const Duration(milliseconds: 40),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: C.onDark,
                        fontSize: m ? 18 : 26,
                        fontWeight: FontWeight.w700,
                        height: 1.5,
                        letterSpacing: -0.3,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: m ? 32 : 48),
          AnimatedDividerLine(color: C.gold),
          SizedBox(height: m ? 32 : 48),
          ScrollReveal(
            delay: const Duration(milliseconds: 200),
            child: _actionStep(
              m,
              "1",
              "Read the Authentic Quran Translation",
              "Search: islamic1articles.home.blog → English → Yusuf Ali",
              C.green,
            ),
          ),
          const SizedBox(height: 16),
          ScrollReveal(
            delay: const Duration(milliseconds: 400),
            child: _actionStep(
              m,
              "2",
              "Watch Proofs & Evidence",
              "Visit: alhidaayah.com/live — Islam & other religions with proofs",
              C.accent,
            ),
          ),
          const SizedBox(height: 16),
          ScrollReveal(
            delay: const Duration(milliseconds: 600),
            child: _actionStep(
              m,
              "3",
              "Download Free PDF",
              "Visit: github.com/PeaceQueries/Peace_PDF",
              C.purple,
            ),
          ),
          SizedBox(height: m ? 32 : 48),
          ScrollReveal(
            delay: const Duration(milliseconds: 800),
            child: Text(
              "If you follow a different religion, please take a moment to investigate. Spend some time understanding what Islam teaches. All you need to do is be objective.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: C.onDarkSub,
                fontSize: m ? 14 : 17,
                height: 1.7,
              ),
            ),
          ),
          const SizedBox(height: 40),
          ScrollReveal(
            delay: const Duration(milliseconds: 1000),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Peace Can Heal",
                  style: TextStyle(
                    color: C.onDark,
                    fontSize: m ? 14 : 16,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  "☪",
                  style: TextStyle(fontSize: m ? 18 : 22),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _actionStep(
      bool m, String num, String title, String desc, Color color) {
    return Container(
      padding: EdgeInsets.all(m ? 16 : 24),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(16),
        border: Border(left: BorderSide(color: color, width: 4)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NumberPill(number: num, color: color),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: C.onDark,
                    fontSize: m ? 16 : 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  desc,
                  style: TextStyle(
                    color: C.onDarkSub,
                    fontSize: m ? 13 : 14,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
