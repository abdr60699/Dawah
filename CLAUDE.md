# CLAUDE.md — Dawah ("Peace Can Heal — Discover The Truth")

Project rules for AI assistants. Read this **before** making any UI, theme, or shared-widget change. These rules are mandatory, not suggestions.

---

## 1. Project Snapshot

- **App name:** Dawah (package: `dawah`) — display title "Peace Can Heal — Discover The Truth"
- **Stack:** Flutter (Material 3) + `google_fonts` (Nunito) + `url_launcher` — no backend, fully static content
- **Targets:** Web (primary), Android, iOS, macOS, Windows, Linux
- **Audience:** general public — a long-form, scroll-driven dawah/educational page presenting comparative-religion content with an Islamic perspective
- **Core structure:** single-page experience with three design variants (V1 Apple-style, V2 card-strip, V3 animated) switchable via the version toggle in `AppleNav`
- **Sections (V1):** hero → intro → one god → why religion → guidance → god comparison table → prophet comparison table → misconceptions → science → life & death → kalki → heart → footer
- **Source-of-truth files:**
  - Theme tokens: `lib/app_theme.dart` (color class `C`, responsive helpers, shadows)
  - Typography skill: `.claude/skills/typography/SKILL.md`

---

## 2. Before You Change Anything (Mandatory Pre-Flight)

Run through this list **every time** before writing or editing UI code:

1. **Read the theme first.** Look at `lib/app_theme.dart`. Never hard-code a color or shadow that already exists in `C`.
2. **Search for an existing widget.** Check `lib/widgets/` (`apple_nav`, `apple_hero`, `apple_section`, `apple_card_grid`, `apple_footer`) and the relevant `lib/sections/`, `lib/v2/`, `lib/v3/` before creating a new component. Reuse > duplicate.
3. **Check all three design variants.** A token/widget change in V1 must not silently break V2 or V3. If a change only applies to one variant, scope it to that variant's folder.
4. **Confirm the platform behavior.** Web → primary target, test in browser at common breakpoints. iOS/Android → respect HIG / Material 3 if the platform is invoked.
5. **Verify accessibility impact.** Tap target ≥ 48×48 dp, text contrast ≥ 4.5:1 for body, ≥ 3:1 for large text/UI, focus order intact, semantics labels present.
6. **Match the typography skill.** Any text-related change must follow `.claude/skills/typography/SKILL.md` (HIG, Material, Nielsen, WCAG 2.2 AA).
7. **Do not introduce new features** while doing a UI fix. Refactor/fix-only unless the user explicitly asked for a feature.

If any of the above can't be satisfied, stop and ask.

---

## 3. UI Consistency Rules (Non-Negotiable)

### Typography
- **Never write a raw `fontSize:` literal in feature code.** Use `Theme.of(context).textTheme.<role>` or `AppTextStyles.<role>` from `lib/app_text_styles.dart` (create the file per the typography skill if it does not exist yet).
- The typography scale and rules live in `.claude/skills/typography/SKILL.md`. Follow them.
- Minimum readable body size = **15 px mobile / 16 px desktop**. Captions/labels = **12 px**. Never go below 12 except for legal/disclaimer micro-text.
- Use `GoogleFonts.nunito*` only through the theme (already wired in `lib/main.dart`). Don't re-wrap fonts in feature widgets.
- The current codebase has many inline `TextStyle(fontSize: …)` calls — that is the migration target, not the model to copy. New code must use the scale; existing inline styles are migrated per the typography skill §13.

### Colors
- Use `C.*` tokens from `lib/app_theme.dart`. Never hard-code hex in feature code.
- Status colors (`C.green`, `C.red`, `C.gold`) are reserved for status meaning — don't repurpose them as decorative colors.
- Light-mode background = `C.bg` (`#FAFAFA`) or `C.white`. The hero uses the deep navy gradient (`#0F172A` → `#1E1B4B` → `#0F172A`) defined inline in `apple_hero.dart`; if reused, extract to a token, don't copy.
- **No dark mode** is wired today. If you add one, mirror every `C.*` token with an on-dark counterpart in `app_theme.dart` and re-verify contrast everywhere.
- **`C.accent` (blue) is reserved for tappable / interactive items only.** Standalone tappable elements — nav link, "Learn more", inline CTA, the active version-toggle pill — use `C.accent`. Non-interactive text — section titles, body, captions, scripture references — uses `C.heading` / `C.body` / `C.caption` (or `C.onDark` / `C.onDarkSub` on dark surfaces), **never** `C.accent`. This keeps the accent color as a learned affordance: if it's blue, it taps.
  - Exception: status colors (`C.green` / `C.red` / `C.gold` / `C.teal` / `C.purple`) communicate state and may appear on non-tappable text.
  - Exception: brand/marketing surfaces (the hero, animated V3 backgrounds) where accent is decorative, not an affordance.

### Spacing & Layout
- Use a **4 px base grid**: 4, 8, 12, 16, 20, 24, 32, 40, 48, 56, 80, 110.
- Screen horizontal padding is owned by `sectionPad(context)` in `lib/app_theme.dart`. Use it — do not invent ad-hoc symmetric paddings per section.
- Section vertical rhythm: **56 px mobile, 80–110 px desktop** between major sections (already encoded in `sectionPad`).
- Content max widths come from `contentMax(context)`. For reading copy specifically, cap at **~720 px** via `ConstrainedBox(maxWidth: 720)` so lines stay ~60–75 characters.
- Always wrap screen bodies that touch system chrome with `SafeArea` on mobile (the nav already handles the top inset via fixed height).
- **Vertical gaps between sibling widgets in the same group must be equal.** Within one card/column/section, every gap is the same value (e.g., all 12 px, all 16 px, all 24 px). Don't mix 10/14/18 in one stack — it creates visual noise and breaks Proximity (Gestalt).
  - Pick one rhythm per group: **8** px (tight chip rows), **12** px (related lines), **16** px (paragraph blocks), **24** px (card stacks), **40+** px (between sections).
  - Implement with `SizedBox(height: N)` between widgets, or `Column` + `Wrap(spacing: ..., runSpacing: ...)`. Avoid ad-hoc `Padding` on each child to fake spacing.
  - Use a **larger** gap (40, 56, 80) only to separate **different** sections — the gap change is the signal that "this is a new group."

### Components
- Buttons: use `ElevatedButton`, `FilledButton`, `OutlinedButton`, `TextButton`. Don't build custom `GestureDetector` buttons unless there is a documented reason (the nav version-toggle pill is a valid exception).
- Cards: use the existing `FlatCard` (in `apple_card_grid.dart`) and equivalents in V2/V3. Card radius defaults to **16**, large cards to **24**. Don't override per-screen.
- Section wrappers: use `Sec` (`apple_section.dart`) for V1, `V2…` widgets for V2, `V3…` for V3. Don't introduce a fourth section primitive.
- Lists/tables (god/prophet comparison): keep one column of consistent row heights; horizontal scroll on mobile via `SingleChildScrollView(scrollDirection: Axis.horizontal)` if needed — never shrink text to fit.
- Hero gradient: there is one canonical hero gradient — do not invent a new dark gradient per variant.

### Iconography
- Use Material Icons consistently. Don't mix outlined and filled icons in the same row/section.
- Icon size scale: **16 / 20 / 24 / 32**. Default = 24 inline with body text; 20 inside nav/labels; 16 inside chips/badges.

### Motion & Feedback
- Standard duration **200–400 ms**, curve `Curves.easeInOut`. The page-version `AnimatedSwitcher` uses 400 ms — keep that.
- Scroll-to-section animations use **600 ms `easeInOut`** (see `Scrollable.ensureVisible` in `home_page.dart`). Keep consistent.
- V3 animations should not exceed **800 ms** and should respect `MediaQuery.disableAnimations` / reduce-motion preferences.
- Every tap must give feedback (ripple, scale, or color change). Every async action must show loading + explicit success/error.

### State Coverage
The app is static content today, but if any async/dynamic state is added (share, contact form, translation fetch):
1. **Loading** — skeleton or spinner, never blank.
2. **Empty** — illustration/icon + headline + one clear next action.
3. **Error** — human message + retry. Never expose raw stack traces.
4. **Success/Populated** — the happy path.
5. **Offline** — graceful degradation.

---

## 4. Accessibility (WCAG 2.2 AA — Blocking)

These are defects, not nice-to-haves:

- **Contrast:** body text ≥ 4.5:1, large text (≥ 18 pt or ≥ 14 pt bold) ≥ 3:1, non-text UI ≥ 3:1. The hero gradient + `C.onDarkSub.withValues(alpha: 0.7)` combination is borderline — verify each use; either bump opacity ≥ 0.85 or use full `C.onDarkSub`.
- **Tap targets:** minimum **48×48 dp** with adequate spacing (8 px gap between adjacent targets). Nav items, the version toggle, and footer links must all clear this.
- **Text scaling:** UI must not break at **200% browser zoom or system text scale**. The comparison tables and the hero are the most likely break points — test them explicitly.
- **Semantics:** every interactive widget needs a meaningful `Semantics` label or tooltip. Icon-only buttons require `tooltip:`.
- **Focus order:** logical top-to-bottom, left-to-right (RTL aware). No focus traps.
- **Color is never the only signal.** Pair color with icon/text (status messages pair color + icon + label).
- **Anchor scroll:** when the nav scrolls to a section, the focused element must be the section heading, not just the scroll position — important for screen-reader users.

---

## 5. Code & Architecture Hygiene

- Folder pattern (current, flat):
  - `lib/app_theme.dart` — tokens, helpers
  - `lib/app_text_styles.dart` — typography scale (create per skill §13 if not present)
  - `lib/main.dart` — `MaterialApp` setup
  - `lib/home_page.dart` — V1/V2/V3 switcher
  - `lib/widgets/` — shared widgets used across variants
  - `lib/sections/` — V1 sections (`s1_intro.dart` … `s11_heart.dart`)
  - `lib/v2/` — V2 variant
  - `lib/v3/` — V3 variant
- Variant folders (`v2/`, `v3/`) are isolated — V2 code does not import V3 and vice versa. Shared primitives live in `widgets/`.
- New constants → `lib/app_theme.dart` (or a new `lib/app_constants.dart` if a meaningful set emerges). Don't scatter magic strings/numbers.
- No `print()` in shipped code.
- Don't add new packages without checking `pubspec.yaml` and asking the user. The dependency surface today is intentionally small (`google_fonts`, `url_launcher`, `cupertino_icons`).
- Don't generate `.md` analysis/handoff/audit docs unless explicitly requested.

---

## 6. Platform Specifics

### Web (primary)
- The app ships as a Flutter web build (`build/web`, `web/`, `index.html` at the project root). Verify in Chrome and Safari.
- Cap reading content width via `ConstrainedBox(maxWidth: 720)` for body, ~1080 px for hero/section frames (already wired in `contentMax`/`sectionPad`).
- Respect browser back/forward — anchor scrolling should not break history.
- Test at 100% / 125% / 150% / 200% browser zoom.

### iOS (HIG)
- Use `Cupertino*` widgets only when the host pattern is fully Cupertino. Don't mix mid-screen.
- Respect notch and home indicator — `SafeArea` always.

### Android (Material 3)
- `useMaterial3: true` (default). Don't opt out.
- System nav bar contrast: light icons on dark backgrounds and vice versa.

### Tablet / Desktop
- Use the existing breakpoints (`isMobile` < 735, `isTablet` 735–1080, `isDesktop` ≥ 1080).
- Above 1080 px width, the hero and section copy already widen — don't stretch reading paragraphs past ~720 px.

---

## 7. Multi-Variant Discipline (V1 / V2 / V3)

This project intentionally ships **three design variants** of the same content. That makes consistency tricky and consistency mistakes more likely.

- A change to **content** (text, scripture references, claims) must be reflected in V1, V2, **and** V3. Content lives wherever each variant pulls it in today; if the same paragraph diverges across variants, that is a bug.
- A change to **design** scoped to one variant must stay inside that variant's folder. Don't touch `lib/widgets/` to "tweak V2 only."
- A change to **shared primitives** (`lib/widgets/`, `lib/app_theme.dart`, the type scale) must be visually verified in all three variants before declaring done.
- Don't introduce a V4 unless the user asks.

---

## 8. Don'ts (Common Past Mistakes)

- Don't replace `Theme.of(context).textTheme.xxx` with an inline `TextStyle(fontSize: ...)`.
- Don't add new colors outside `C`. If you need a new color, add it to `C` with a name that describes its role, not its hue.
- Don't change card radius, button shape, or section padding per screen — the theme/`sectionPad` owns it.
- Don't add `Padding(EdgeInsets.all(13))` style off-grid spacing.
- Don't introduce new package fonts; Nunito is the project font.
- Don't ship a screen that lowers contrast or shrinks text to "look cleaner."
- Don't add analytics/tracking/telemetry without explicit user request — the app is intentionally static.
- Don't put `C.accent` on plain titles/body — it's an affordance signal.

---

## 9. Workflow Expectations

- Use the **typography skill** for any text-related work: `.claude/skills/typography/SKILL.md`.
- Use the **/review** and **/security-review** skills before declaring a non-trivial UI change done.
- Keep responses concise. Code over commentary.
- For UI changes, describe what was changed and which principle (HIG / Material / WCAG / Nielsen) it maps to, and confirm V1/V2/V3 were each visually checked when shared code was touched.
