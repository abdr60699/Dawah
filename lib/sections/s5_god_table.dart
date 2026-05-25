import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../widgets/apple_section.dart';
class S5GodTable extends StatelessWidget {
  const S5GodTable({super.key});

  static const _data = [
    ('Hinduism', 'Ekam Brahm, dvitiya naste neh na naste kinchan means There is only one God, not the second; not at all, not at all, not in the least bit.', 'The Brahma Sutra of Hindu Vedanta', Color(0xFF059669)),
    ('Hinduism', 'Sages (learned Priests) call one God by many names.', 'Rig Veda Book 1 Hymn 164 Verse - 46', Color(0xFF059669)),
    ('Hinduism', 'There is no image of Him.', 'Yajur Veda Ch-32 Ver-3', Color(0xFF059669)),
    ('Christianity', 'My Father is Greater than I.', 'Bible John Ch-14 Ver- 28', Color(0xFF2563EB)),
    ('Christianity and Judaism', 'Shama Israelu Adonai Ila Hayno Adna Ikhad means Hear, O Israel: The Lord our God is one Lord.', 'Bible Mark Ch - 12 Ver - 29 | Bible Deuteronomy Ch-6 Ver- 4', Color(0xFF2563EB)),
    ('Judaism', 'Thou shalt have none other gods before me. Thou shalt not make thee any graven image, or any likeness of anything that is in heaven above...', 'Bible - Deuteronomy Chapter - 5 Verse - 7-9', Color(0xFF7C3AED)),
    ('Islam', '1) Say: He is God, The One and Only. 2) God, the Eternal, Absolute 3) He neither begets nor is born. 4) And there is none Like unto Him.', 'Quran Chapter 112', Color(0xFF0D9488)),
    ('Zoroastrianism', '1) He is One. 2) Nothing resembles Him. 3) He is without an origin or end. 4) He has no father or mothers, wife or son. 5) Without a body or form', 'Qualities of God according to Dasatir', Color(0xFFD97706)),
    ('Sikhism', 'There exists but one God, who is called the true, the creator, free from fear and hate, immortal, not begotten, self-existent, Great & Compassionate.', 'Sri Guru Granth Sahib – Volume 1 Japuji, verse 1', Color(0xFFDC2626)),
  ];

  @override
  Widget build(BuildContext context) {
    final m = isMobile(context);
    return Sec(
      bg: C.bg,
      child: Column(
        children: [
          const Headline(
            'Concept of God in\nWorld\'s Major Religions.',
            sub: 'Concept of God in World\'s Major Religions — Dr. Zakir Naik | Chennai, India',
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
          0: FlexColumnWidth(1.5),
          1: FlexColumnWidth(3.5),
          2: FlexColumnWidth(2),
        },
        children: [
          TableRow(
            decoration: const BoxDecoration(color: C.bgDark),
            children: [
              _hc('Religion'),
              _hc('Verse'),
              _hc('Reference'),
            ],
          ),
          for (var i = 0; i < _data.length; i++)
            TableRow(
              decoration: BoxDecoration(
                color: i.isEven ? C.white : C.bg,
              ),
              children: [
                _dc(_data[i].$1, bold: true, accent: _data[i].$4),
                _dc(_data[i].$2),
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

  Widget _dc(String t, {bool bold = false, Color? accent, bool small = false}) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        child: Text(t,
            style: TextStyle(
              color: accent ?? C.heading,
              fontSize: small ? 12 : 14,
              fontWeight: bold ? FontWeight.w700 : FontWeight.w400,
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
                        color: C.heading, fontSize: 14, height: 1.6)),
                const SizedBox(height: 10),
                Text(d.$3,
                    style: const TextStyle(
                        color: C.accent, fontSize: 12, fontWeight: FontWeight.w600, height: 1.4)),
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
          Quote(
            'Note: Jesus (PBUH) never claimed divinity there is not a single unequivocal statement in the Bible where He says, "I am God" or where he says, "worship me"',
            accent: C.red,
          ),
          SizedBox(height: 8),
          Body(
            'GREATEST SIN In Islam Is SHIRK. It means sharing or associating partners with Allah and is equivalent to idolatry. Below Quran Verse refers to those people who die while doing Shirk If a non-muslim repents for Shirk & accepts islam & does not go back to his false way of life and if he/she remains & dies as a muslim, then inshallah Allah will grant him paradise.',
          ),
          SizedBox(height: 8),
          Quote(
            'Quran 4:48 => Allah forgives not that partners should be set up with Him but He forgives anything else, to whom He pleases to set up partners with Allah is to devise a sin most heinous indeed.',
            accent: C.gold,
          ),
        ],
      ),
    );
  }
}
