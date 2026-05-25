import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../app_theme.dart';

class V2Footer extends StatelessWidget {
  const V2Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final m = isMobile(context);
    return Container(
      width: double.infinity,
      color: C.white,
      padding: EdgeInsets.symmetric(
        horizontal: sectionPad(context).horizontal / 2,
        vertical: 32,
      ),
      child: Column(
        children: [
          const Divider(color: C.border, height: 1),
          const SizedBox(height: 28),
          m ? _mobileLayout(context) : _desktopLayout(context),
          const SizedBox(height: 28),
          const Divider(color: C.border, height: 1),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Peace Can Heal',
                style: TextStyle(
                  color: C.heading,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'If you have doubts, visit islamqa.info/en',
                style: TextStyle(
                  color: C.caption,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _desktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _col('Read & Learn', [
          _link('Quran Translation (Yusuf Ali)', 'https://islamic1articles.home.blog'),
          _link('Al Hidaayah — Video Proofs', 'https://alhidaayah.com/live/'),
          _link('Download PDF', 'https://github.com/PeaceQueries/Peace_PDF'),
        ])),
        const SizedBox(width: 32),
        Expanded(child: _col('YouTube', [
          _text('WOMEN\'S RIGHTS IN ISLAM | DR ZAKIR NAIK'),
          _text('ISLAM\'S VIEW ON TER-OR-ISM | DR ZAKIR NAIK'),
          _text('MISCONCEPTIONS ABOUT ISLAM | DR ZAKIR NAIK'),
        ])),
        const SizedBox(width: 32),
        Expanded(child: _col('Resources', [
          _link('IslamQA', 'https://islamqa.info/en'),
          _text('Change Country to Malaysia on YouTube'),
        ])),
      ],
    );
  }

  Widget _mobileLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _col('Read & Learn', [
          _link('Quran Translation', 'https://islamic1articles.home.blog'),
          _link('Al Hidaayah', 'https://alhidaayah.com/live/'),
          _link('Download PDF', 'https://github.com/PeaceQueries/Peace_PDF'),
        ]),
        const SizedBox(height: 24),
        _col('YouTube', [
          _text('WOMEN\'S RIGHTS IN ISLAM | DR ZAKIR NAIK'),
          _text('MISCONCEPTIONS ABOUT ISLAM | DR ZAKIR NAIK'),
        ]),
      ],
    );
  }

  Widget _col(String title, List<Widget> items) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title, style: const TextStyle(
        color: C.heading,
        fontSize: 12,
        fontWeight: FontWeight.w800,
        letterSpacing: 0.3,
      )),
      const SizedBox(height: 12),
      ...items,
    ],
  );

  Widget _link(String t, String url) => Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => launchUrl(Uri.parse(url)),
        child: Text(t, style: const TextStyle(
          color: C.accent,
          fontSize: 13,
          height: 1.4,
        )),
      ),
    ),
  );

  Widget _text(String t) => Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Text(t, style: const TextStyle(
      color: C.caption,
      fontSize: 12,
      height: 1.4,
    )),
  );
}
