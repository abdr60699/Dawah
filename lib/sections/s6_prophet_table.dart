import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../widgets/apple_section.dart';

class S6ProphetTable extends StatelessWidget {
  const S6ProphetTable({super.key});

  static const _data = [
    ('Hinduism', '"Ahmed acquired from his Lord the knowledge of eternal law. I received light from him just as from the sun."', 'Sam Veda Book II Hymn 6 verse 8.\n\nThe name of the Prophet as Ahmed since Ahmed is an Arabic name. Many translators misunderstood it to be \'Ahm at hi\' and translated the mantra as, "I alone have acquired the real wisdom of my father."', Color(0xFF059669)),
    ('Christianity', 'And I will pray the Father, and He shall give you another comforter, that he may abide with you forever.', 'Bible – John Chapter-14 Verse-16\n\nJesus (PBUH) prophesied the coming of the \'Comforter\' – Muhammad (PBUH).', Color(0xFF2563EB)),
    ('Judaism', '"Hikko Mamittakim we kullo Muhammadim Zehdoodeh wa Zahraee Bayna Jerusalem means "His mouth is most sweet: yea, he is altogether lovely. This is my beloved, and this is my friend, O daughters of Jerusalem."', 'The Bible – Song of Solomon Chapter - 5 Verse -16\n\nMUHAMMAD (PBUH) MENTIONED BY NAME.', Color(0xFF7C3AED)),
    ('Zoroastrianism', 'Soashyant will be the last Prophet.', 'Bundahishn Chapter 30 Verses 6-27\n\nSoashyant means the \'praised one\' (refer Hastings Encyclopedia) which translated in Arabic means Muhammad (PBUH)', Color(0xFFD97706)),
  ];

  @override
  Widget build(BuildContext context) {
    final m = isMobile(context);
    return Sec(
      bg: C.white,
      child: Column(
        children: [
          const Headline(
            'Muhammad (PBUH)\nin All Religions.',
            sub: 'Muhammad (PBUH) in the Various World Religious Scriptures — Dr. Zakir Naik',
          ),
          const SizedBox(height: 40),
          m ? _mobileCards() : _table(),
          const SizedBox(height: 36),
          _notes(),
        ],
      ),
    );
  }

  Widget _table() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: C.border),
        boxShadow: C.cardShadow,
      ),
      clipBehavior: Clip.antiAlias,
      child: Table(
        border: TableBorder(
          horizontalInside: BorderSide(color: C.border.withValues(alpha: 0.6), width: 0.5),
          verticalInside: BorderSide(color: C.border.withValues(alpha: 0.6), width: 0.5),
        ),
        columnWidths: const {
          0: FlexColumnWidth(1.3),
          1: FlexColumnWidth(3),
          2: FlexColumnWidth(3),
        },
        children: [
          TableRow(
            decoration: const BoxDecoration(color: C.bgDark),
            children: [_hc('Religion'), _hc('Verse'), _hc('Reference')],
          ),
          for (var i = 0; i < _data.length; i++)
            TableRow(
              decoration: BoxDecoration(color: i.isEven ? C.white : C.bg),
              children: [
                _dc(_data[i].$1, bold: true, accent: _data[i].$4),
                _dc(_data[i].$2, italic: true),
                _dc(_data[i].$3, accent: C.accent, small: true),
              ],
            ),
        ],
      ),
    );
  }

  Widget _hc(String t) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        child: Text(t,
            style: const TextStyle(
                color: C.onDark, fontSize: 13, fontWeight: FontWeight.w700)),
      );

  Widget _dc(String t,
      {bool bold = false, Color? accent, bool small = false, bool italic = false}) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        child: Text(t,
            style: TextStyle(
              color: accent ?? C.heading,
              fontSize: small ? 12 : 14,
              fontWeight: bold ? FontWeight.w700 : FontWeight.w400,
              fontStyle: italic ? FontStyle.italic : FontStyle.normal,
              height: 1.55,
            )),
      );

  Widget _mobileCards() {
    return Column(
      children: [
        for (var i = 0; i < _data.length; i++) ...[
          _mCard(_data[i]),
          if (i < _data.length - 1) const SizedBox(height: 12),
        ],
      ],
    );
  }

  Widget _mCard((String, String, String, Color) d) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: C.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: C.border),
        boxShadow: C.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
            decoration: BoxDecoration(
              color: d.$4.withValues(alpha: 0.08),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(14)),
            ),
            child: Text(d.$1,
                style: TextStyle(
                    color: d.$4, fontWeight: FontWeight.w800, fontSize: 15)),
          ),
          Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(d.$2,
                    style: const TextStyle(
                        color: C.heading,
                        fontSize: 14,
                        height: 1.6,
                        fontStyle: FontStyle.italic)),
                const SizedBox(height: 10),
                Text(d.$3,
                    style: const TextStyle(
                        color: C.accent, fontSize: 12, fontWeight: FontWeight.w600, height: 1.5)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _notes() {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 720),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Body(
            'Note : Many people have a misconception that Prophet Muhammad (PBUH) is the founder of the religion of Islam. In fact, Islam is in existence since man first set foot on earth. God Almighty has sent several Prophets and revelations.',
          ),
          SizedBox(height: 8),
          Body(
            'Note : There are many more references & proofs apart from the ones mentioned in this entire content. Due to space limitations, they have been avoided.',
          ),
          SizedBox(height: 12),
          Quote(
            'He who hates prophet Muhammad (PBUH) will have no hope in the hereafter (next endless life)',
            accent: C.red,
          ),
          Quote(
            'Quran ch-108:1-3 => To you have We granted the fount (of Abundance). Therefore to your Lord turn in Prayer and Sacrifice. For he who hates you, He will be cut off (from Future Hope).',
            accent: C.gold,
          ),
        ],
      ),
    );
  }
}
