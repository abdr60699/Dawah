import 'dart:ui';
import 'package:flutter/material.dart';
import '../app_theme.dart';

class AppleNav extends StatelessWidget {
  final void Function(String) onTap;
  final int activeVersion;
  final ValueChanged<int> onVersionChanged;

  const AppleNav({
    super.key,
    required this.onTap,
    required this.activeVersion,
    required this.onVersionChanged,
  });

  static const _items = [
    ('Home', 'home'),
    ('One God', 'onegod'),
    ('Prophet', 'prophet'),
    ('Why Religion', 'why'),
    ('Science', 'science'),
    ('Life & Death', 'life'),
  ];

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
        child: Container(
          height: 56,
          decoration: BoxDecoration(
            color: C.white.withValues(alpha: 0.85),
            border: const Border(bottom: BorderSide(color: C.border, width: 0.5)),
          ),
          padding: sectionPad(context).copyWith(top: 0, bottom: 0),
          child: mobile ? _mobile(context) : _desktop(context),
        ),
      ),
    );
  }

  Widget _desktop(BuildContext context) {
    return Row(
      children: [
        _logo(),
        const SizedBox(width: 20),
        _versionToggle(),
        const Spacer(),
        if (activeVersion == 1)
          for (final (label, id) in _items) _navItem(label, id),
      ],
    );
  }

  Widget _mobile(BuildContext context) {
    return Row(
      children: [
        _logo(),
        const SizedBox(width: 12),
        _versionToggle(),
        const Spacer(),
        if (activeVersion == 1)
          GestureDetector(
            onTap: () => _showSheet(context),
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: C.bg,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.menu_rounded, color: C.heading, size: 20),
            ),
          ),
      ],
    );
  }

  Widget _versionToggle() {
    return Container(
      height: 32,
      decoration: BoxDecoration(
        color: C.bg,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: C.border, width: 0.5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _vTab('V1', 1),
          _vTab('V2', 2),
          _vTab('V3', 3),
        ],
      ),
    );
  }

  Widget _vTab(String label, int version) {
    final active = activeVersion == version;
    return GestureDetector(
      onTap: () => onVersionChanged(version),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(horizontal: 14),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: active ? C.white : Colors.transparent,
            borderRadius: BorderRadius.circular(7),
            boxShadow: active
                ? [const BoxShadow(color: Color(0x0A000000), blurRadius: 4, offset: Offset(0, 1))]
                : null,
          ),
          child: Text(
            label,
            style: TextStyle(
              color: active ? C.heading : C.caption,
              fontSize: 13,
              fontWeight: active ? FontWeight.w700 : FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  Widget _logo() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF059669), Color(0xFF0D9488)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Center(
            child: Text('☪', style: TextStyle(fontSize: 14, color: C.white, height: 1)),
          ),
        ),
        const SizedBox(width: 10),
        const Text(
          'Peace Can Heal',
          style: TextStyle(
            color: C.heading,
            fontSize: 17,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.3,
          ),
        ),
      ],
    );
  }

  Widget _navItem(String label, String id) {
    return Padding(
      padding: const EdgeInsets.only(left: 32),
      child: _HoverNavItem(label: label, onTap: () => onTap(id)),
    );
  }

  void _showSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: C.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (_) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 12, 8, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                    color: C.border, borderRadius: BorderRadius.circular(2)),
              ),
              const SizedBox(height: 8),
              for (final (label, id) in _items)
                ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  title: Text(label,
                      style: const TextStyle(
                          color: C.heading,
                          fontSize: 17,
                          fontWeight: FontWeight.w600)),
                  trailing:
                      const Icon(Icons.east_rounded, color: C.caption, size: 18),
                  onTap: () {
                    Navigator.pop(context);
                    onTap(id);
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HoverNavItem extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  const _HoverNavItem({required this.label, required this.onTap});

  @override
  State<_HoverNavItem> createState() => _HoverNavItemState();
}

class _HoverNavItemState extends State<_HoverNavItem> {
  bool _h = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _h = true),
      onExit: (_) => setState(() => _h = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 150),
          style: TextStyle(
            color: _h ? C.heading : C.body,
            fontSize: 14,
            fontWeight: _h ? FontWeight.w700 : FontWeight.w500,
            letterSpacing: 0.1,
          ),
          child: Text(widget.label),
        ),
      ),
    );
  }
}
