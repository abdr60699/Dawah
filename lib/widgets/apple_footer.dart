import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../app_theme.dart';

class AppleFooter extends StatelessWidget {
  const AppleFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final pad = sectionPad(context);
    final m = isMobile(context);

    return Container(
      width: double.infinity,
      color: C.white,
      padding: EdgeInsets.symmetric(horizontal: pad.horizontal / 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          Text(
            'If you have any doubts about Islam, kindly ask at islamqa.info/en',
            style: TextStyle(color: C.caption, fontSize: 12, height: 1.5),
          ),
          const SizedBox(height: 16),
          const Divider(color: C.border, height: 1),
          const SizedBox(height: 28),
          m ? _mobileLinks() : _desktopLinks(),
          const SizedBox(height: 28),
          const Divider(color: C.border, height: 1),
          const SizedBox(height: 20),
          Wrap(
            spacing: 20,
            runSpacing: 8,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text('Peace Can Heal',
                  style: TextStyle(
                      color: C.heading,
                      fontSize: 13,
                      fontWeight: FontWeight.w700)),
              _fLink('Instagram: @Peace_Can_Heal'),
              _fLink('This content may not satisfy you but all your logical questions have answers in Islam.'),
            ],
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _desktopLinks() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: _col('Read & Learn', [
            _tap('Quran Translation (English — Yusuf Ali)',
                'https://islamic1articles.home.blog'),
            _tap('Al Hidaayah — Video Proofs', 'https://alhidaayah.com/live/'),
            _tap('Download PDF', 'https://github.com/PeaceQueries/Peace_PDF'),
          ]),
        ),
        const SizedBox(width: 32),
        Expanded(
          child: _col('Watch on YouTube', [
            _txt('WOMEN\'S RIGHTS IN ISLAM — LIBERATED OR SUBJUGATED? | DR ZAKIR NAIK'),
            _txt('ISLAM\'S VIEW ON TER-OR-ISM AND JI-HA-AD | DR ZAKIR NAIK'),
            _txt('MISCONCEPTIONS ABOUT ISLAM | DUBAI PART 1 & 2 | DR ZAKIR NAIK'),
          ]),
        ),
        const SizedBox(width: 32),
        Expanded(
          child: _col('Resources', [
            _tap('IslamQA', 'https://islamqa.info/en'),
            _txt('Change Country to Malaysia on YouTube for full lectures'),
          ]),
        ),
      ],
    );
  }

  Widget _mobileLinks() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _col('Read & Learn', [
          _tap('Quran Translation', 'https://islamic1articles.home.blog'),
          _tap('Al Hidaayah — Video Proofs', 'https://alhidaayah.com/live/'),
          _tap('Download PDF', 'https://github.com/PeaceQueries/Peace_PDF'),
        ]),
        const SizedBox(height: 24),
        _col('YouTube', [
          _txt('WOMEN\'S RIGHTS IN ISLAM | DR ZAKIR NAIK'),
          _txt('ISLAM\'S VIEW ON TER-OR-ISM | DR ZAKIR NAIK'),
          _txt('MISCONCEPTIONS ABOUT ISLAM | DR ZAKIR NAIK'),
        ]),
      ],
    );
  }

  Widget _col(String title, List<Widget> items) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  color: C.heading,
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.3)),
          const SizedBox(height: 12),
          ...items,
        ],
      );

  Widget _tap(String t, String url) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () => launchUrl(Uri.parse(url)),
            child: Text(t,
                style: const TextStyle(color: C.accent, fontSize: 13, height: 1.4)),
          ),
        ),
      );

  Widget _txt(String t) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text(t,
            style: const TextStyle(color: C.caption, fontSize: 12, height: 1.4)),
      );

  Widget _fLink(String t) =>
      Text(t, style: const TextStyle(color: C.caption, fontSize: 12));
}
