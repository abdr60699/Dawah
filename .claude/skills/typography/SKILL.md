---
name: typography
description: Enforce and apply consistent typography for the Dawah ("Peace Can Heal — Discover The Truth") Flutter app. Use whenever creating or editing text, choosing a font size/weight, defining a new text role, auditing readability/contrast, or fixing "text too small / inconsistent / not accessible" issues. Aligns with Apple HIG, WCAG 2.2 AA, Nielsen Norman heuristics, and Android Material Design 3.
---

# Typography Skill — Dawah (Peace Can Heal)

The single authority on how text is styled in this app. If a font size, weight, line-height, letter-spacing, color, or role is being decided, **this file governs it**.

Project font: **Nunito** via `google_fonts`, wired in `lib/main.dart` through `GoogleFonts.nunitoTextTheme(...)`.
Color tokens: `C` in `lib/app_theme.dart`.
Recommended scale file: `lib/app_text_styles.dart` (create if not present — see §13).

This app is a long-form, scroll-heavy dawah/educational web page with three design variants (V1 Apple-style, V2 card-strip, V3 animated). Reading comfort and hierarchy across **all three variants and across mobile/tablet/desktop** is the goal.

---

## 1. Source Standards (all must be satisfied)

| Standard | What it gives us |
|---|---|
| **Apple HIG (Typography)** | Minimum legible sizes on iOS/web, Dynamic Type behavior, weight pairing, optical line-height. |
| **Material Design 3 (Type Scale)** | Roles (display / headline / title / body / label) and the named scale we map to. |
| **WCAG 2.2 AA** | Contrast ratios, scalability to 200%, focus visibility, text-spacing override. |
| **Nielsen Norman Group** | Hierarchy, scannability, recognition over recall, consistency, error clarity. |

A change satisfies the skill only if it satisfies **all four**.

---

## 2. The Type Scale (single source of truth)

Use these roles from `Theme.of(context).textTheme.*` (or `AppTextStyles.*` from `lib/app_text_styles.dart` when outside a `BuildContext`). **Do not hard-code `fontSize` in feature code.**

Because this app is primarily a **web reading experience** with a long-form scroll, body text targets **17 px** (HIG iOS body default) on desktop and **16 px** on mobile. The display sizes scale up for the marketing hero, and down for dense card grids.

| Role | Size (mobile → desktop) | Weight | Line-height | Letter-spacing | Use for |
|---|---|---|---|---|---|
| `displayLarge` | 52 → 88 | 800 | 1.0 | -3 | Hero headline ("Discover The Truth.") |
| `displayMedium` | 40 → 64 | 700 | 1.05 | -1.5 | Section landing hero, V2/V3 hero |
| `displaySmall` | 32 → 48 | 700 | 1.1 | -0.5 | Sub-hero / large section opener |
| `headlineLarge` | 28 → 40 | 700 | 1.15 | -0.5 | Page section title (`Headline` widget) |
| `headlineMedium` | 24 → 32 | 700 | 1.2 | -0.25 | Major section header |
| `headlineSmall` | 20 → 24 | 700 | 1.25 | 0 | Card group header, dialog title |
| `titleLarge` | 18 → 22 | 600 | 1.3 | 0 | Card title, table header, modal title |
| `titleMedium` | 16 → 18 | 600 | 1.4 | 0.1 | List/grid card title |
| `titleSmall` | 14 → 15 | 600 | 1.43 | 0.1 | Sub-title, tab label active, nav item |
| `bodyLarge` | 16 → 17 | 400 | 1.6 | 0.15 | Primary reading body (quotes, long paragraphs) |
| `bodyMedium` | 15 → 16 | 400 | 1.55 | 0.15 | Default body, card descriptions |
| `bodySmall` | 13 → 14 | 400 | 1.5 | 0.25 | Captions, footnotes, scripture references |
| `labelLarge` | 14 → 15 | 600 | 1.43 | 0.2 | Button text, prominent CTAs |
| `labelMedium` | 13 → 14 | 500 | 1.4 | 0.3 | Chip text, tag, nav label inactive |
| `labelSmall` | 12 → 12 | 500 | 1.33 | 0.5 | Pill/badge, micro labels, version toggle |

> **Why this differs from the inline values in the current codebase (e.g. `fontSize: 13/15/17/52/72/88` scattered across `widgets/apple_hero.dart`, `sections/s*.dart`):** the values are sound *per widget* but inconsistent *across widgets*. Two different "card titles" should not be 15 px on one screen and 18 px on another. The scale above absorbs the existing values into named roles so future edits stay coherent across V1/V2/V3.

### Minimum size rules
- **Never go below 12 px** in any production UI (legal/disclaimer micro-copy ≥ 11 only with explicit justification).
- **Body reading text ≥ 15 px on mobile, 16 px on desktop.** This app is long-form — under-sizing is the most common defect.
- **Interactive labels ≥ 14 px** with weight ≥ 500. Tap target ≥ 48×48 dp regardless of text size.
- On desktop/web, cap reading line length to **~60–75 characters** via `ConstrainedBox(maxWidth: 720)` — the project already does this in `s1_intro.dart` and `apple_hero.dart`; keep that pattern.

---

## 3. Role → When-to-Use Decision Table

| You are writing… | Use |
|---|---|
| Page hero headline ("Discover The Truth.") | `displayLarge` |
| Sub-hero tagline ("With an open mindset.") | `displaySmall` or `headlineLarge` |
| Section title (the `Headline` widget in `widgets/apple_card_grid.dart` or equivalent) | `headlineLarge` |
| Section subtitle / lead-in | `bodyLarge` (slightly muted color) |
| Sub-section header inside a section | `headlineSmall` or `titleLarge` |
| Card title (in `FlatCard`, V2 cards, V3 cards) | `titleMedium` (mobile) → `titleLarge` (desktop) |
| Card body / description | `bodyMedium` |
| Comparison table cell (god table, prophet table) | `bodySmall` for content, `titleSmall` for headers |
| Reading paragraph (the `Body` widget) | `bodyLarge` for hero passages, `bodyMedium` elsewhere |
| Quote / scripture reference | `bodyLarge` italic for quote, `bodySmall` for source |
| Caption under image / illustration | `bodySmall` muted |
| Nav item (`AppleNav`) | `titleSmall` (active), `labelMedium` (inactive) |
| Version toggle pill (V1/V2/V3 selector) | `labelSmall` |
| Button label / CTA | `labelLarge` |
| Tag / chip ("11 minutes to change your perspective") | `labelMedium` |
| Footer text | `bodySmall` muted |
| Error / warning helper | `bodySmall` with `C.red` |

If your case is not in the table, pick the closest role — **do not invent a new size**.

---

## 4. Weight, Style, and Pairing Rules

- Allowed weights: **400, 500, 600, 700, 800**. Avoid 300 (fails contrast/scannability on `C.body`/`C.caption` grey backgrounds) and 900 (Nunito gets blocky).
- A screen should use **at most 3 weights** at once. Typical pairing: 400 body, 600 titles, 700 section/hero headlines.
- The hero may use 800 (already does — keep it).
- Italics: only for true emphasis, quoted scripture, or transliterated Arabic terms. Never for whole sentences of UI copy.
- ALL-CAPS: only for very short labels (≤ 10 chars) such as legal tags or badges, with letter-spacing 0.5–1.0. Never for headings — fails Nielsen scannability.
- Numbers in dense tables (the god/prophet comparison tables): use tabular figures via `fontFeatures: [FontFeature.tabularFigures()]`.

---

## 5. Line-height, Letter-spacing, Paragraph Spacing

- Line-height = the `height` multiplier in the table above. Do not override per-section. The current hero `height: 1.0` is **already the `displayLarge` value** — keep it tied to the role, don't re-set inline.
- Paragraph gap = **12 px** between body paragraphs, **24 px** between sub-sections, **40–56 px** between major sections (V1 already uses 40 in `s1_intro.dart`).
- Letter-spacing: keep as defined. Tighten only for display sizes ≥ 32 (already -1.5 to -3 on hero — that maps to `displayLarge` / `displayMedium`).
- Text wrapping: prefer soft wraps; cap line length to **~60–75 characters** on tablet/web (`ConstrainedBox(constraints: BoxConstraints(maxWidth: 720))`).
- **Equal vertical gaps within a group.** Every sibling gap inside one column/section/card-stack must use the same value (all 8 / all 12 / all 16 / all 24). Mixing 10/14/18 inside one group breaks Proximity (Gestalt) and produces visual noise around text blocks. Use a *larger* gap (40+) only to mark a transition to a new section. Implement via `SizedBox(height: N)` — not ad-hoc `Padding` on each child.

---

## 6. Color & Contrast (WCAG 2.2 AA)

This app is **light mode only** today. If/when a dark variant is added, add a second column to this table and re-verify every pairing.

| Text role | Light color (current `C` tokens) | Min contrast |
|---|---|---|
| Primary heading | `C.heading` (#1A1A2E) on `C.bg`/`C.white` | 4.5:1 (3:1 if ≥ 18 pt or ≥ 14 pt bold) |
| Body text | `C.body` (#555568) on `C.bg`/`C.white` | 4.5:1 |
| Caption / metadata | `C.caption` (#8A8A9A) on `C.bg`/`C.white` | 4.5:1 — verify per use; this is borderline against `C.bg` for small text |
| On-dark heading (hero) | `C.onDark` (#F5F5F7) on hero gradient | 4.5:1 (check actual gradient stops) |
| On-dark body (hero) | `C.onDarkSub` (#B0B0C0) on hero gradient | 4.5:1 — verify; muted-on-dark fails easily |
| Link / inline action | `C.accent` (#2563EB) | 4.5:1 + underline or icon |
| Status: success | `C.green` (#059669) | 4.5:1 + icon + text label |
| Status: warning | `C.gold` (#D97706) | 4.5:1 + icon + text label |
| Status: error | `C.red` (#DC2626) | 4.5:1 + icon + text label |

Rules:
- **Color is never the only signal.** Always pair with icon/text/weight.
- `C.caption` against `C.bg` for 12 px text is borderline — verify each instance, prefer `C.body` if there's any doubt.
- Hero gradient (`#0F172A` → `#1E1B4B` → `#0F172A`): `C.onDarkSub.withValues(alpha: 0.7)` for 15 px body — verify; that combo can dip under 4.5:1. Either bump opacity to ≥ 0.85 or use full `C.onDarkSub`.
- **`C.accent` (primary blue) is reserved for tappable items.** Any standalone tappable text — nav link, "Learn more", inline CTA, selected version pill — uses `C.accent`. Non-tappable text — section headings, body, captions, scripture references — must use `C.heading` / `C.body` / `C.caption` (or the on-dark equivalents), **never** `C.accent`. Status colors (`C.green`/`C.red`/`C.gold`) follow their own meaning and may appear on non-tappable text where they communicate state. Hero/marketing surfaces where accent is decorative are the only other exception.

---

## 7. Dynamic Type, Scaling, RTL, Internationalization

- Respect system text scale. Layouts must **not break at 200% scale** (WCAG 1.4.4).
- The current responsive helpers (`isMobile`, `isTablet`, `isDesktop`, `sectionPad`, `contentMax` in `lib/app_theme.dart`) handle width — they do **not** handle text scale. Verify at 150% and 200%.
- If wrapping would visibly destroy a layout (the hero, the comparison tables), clamp:
  ```dart
  MediaQuery(
    data: MediaQuery.of(context).copyWith(
      textScaler: MediaQuery.textScalerOf(context).clamp(minScaleFactor: 1.0, maxScaleFactor: 1.6),
    ),
    child: child,
  )
  ```
  Clamp **only** when wrapping would visibly destroy the layout — prefer responsive layout instead.
- Use `Flexible` / `Expanded` instead of `overflow: ellipsis` truncation when the text matters (which, in this app's reading-heavy content, is almost always).
- Always pass `softWrap: true` for multi-line; use ellipsis only for chips, badges, nav labels.
- RTL: rely on Flutter `Directionality`. Don't hard-code `TextAlign.left` — use `TextAlign.start`. The comparison tables in particular must be RTL-clean if Arabic content is ever added.

---

## 8. Apple HIG Specifics

- iOS body default is 17 pt; this skill targets 17 px for `bodyLarge` on desktop and 16 px on mobile — acceptable cross-platform.
- Nav bar / hero title weight on iOS is 600–800 — the project's hero uses w800, which is fine on the dark gradient.
- Use sentence case for titles, buttons, and section headings (Material + HIG both prefer sentence case in 2024+). The current "Think About Life's Purpose" / "Discover The Truth." Title-Case is acceptable for the hero/section openings but **don't propagate it to card titles or body** — use sentence case there.

---

## 9. Material Design 3 Specifics

- Roles in this skill map 1:1 to M3 type roles — keep the names aligned.
- Buttons use `labelLarge`. Don't override per button.
- Snackbar text uses `bodyMedium`. Dialog title `headlineSmall`, dialog body `bodyMedium`.
- `useMaterial3: true` is the default in modern Flutter — keep it; do not opt out.

---

## 10. Nielsen Norman Heuristics Applied

- **Hierarchy:** every screen/section must have exactly one primary heading. The home page has one hero (`displayLarge`) and N section headings (`headlineLarge`) — that's the correct shape.
- **Consistency:** the same content type uses the same role across V1/V2/V3. A "card title" must be `titleMedium` in `S1Intro`'s `FlatCard`, in V2's `v2_card_section.dart`, and in V3's `v3_sections.dart`.
- **Recognition over recall:** labels above inputs, not placeholder-only (currently no inputs, but applies if a contact/share form is added).
- **Visibility of system status:** loading/empty/error states (if any are added — e.g. for fetching translations) use defined roles.
- **Scannability:** body paragraphs ≤ 4 lines on mobile, ≤ 3 lines on desktop. Break long passages into multiple `Body` widgets with `SizedBox(height: 12)` between, not one wall of text.

---

## 11. Code Patterns (do this, not that)

**DO**
```dart
Text(
  'Think About Life\'s Purpose',
  style: Theme.of(context).textTheme.headlineLarge,
)

Text(
  intro,
  style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: C.body),
)
```

**DON'T**
```dart
// inline literal — current state of much of this codebase
Text(
  'Think About Life\'s Purpose',
  style: TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w800,
    color: C.heading,
  ),
)

// raw GoogleFonts call in feature code — the theme already wraps Nunito
Text(
  body,
  style: GoogleFonts.nunito(fontSize: 15, color: Colors.grey),
)
```

**Responsive sizing** — prefer the scale's mobile→desktop steps (which the theme handles via two `ThemeData` configurations or a helper) over per-widget conditionals:

```dart
// DO (when scale handles it)
Text(title, style: Theme.of(context).textTheme.displayLarge)

// AVOID (current pattern in apple_hero.dart)
Text(title, style: TextStyle(fontSize: m ? 52 : (w > 1080 ? 88 : 72), ...))
```

If the scale-by-breakpoint isn't wired yet, keep the conditional **but** use the role name and only let `fontSize` vary — never weight or color.

**Adding emphasis to part of a sentence** — use `Text.rich` with the same role, only changing weight or color:
```dart
Text.rich(
  TextSpan(
    style: Theme.of(context).textTheme.bodyLarge,
    children: [
      const TextSpan(text: 'There is only '),
      TextSpan(
        text: 'One God',
        style: const TextStyle(fontWeight: FontWeight.w700),
      ),
      const TextSpan(text: ' without images or idols.'),
    ],
  ),
)
```

---

## 12. Audit Checklist (use this when reviewing a screen/section)

Run through every item; any "no" is a defect.

- [ ] No raw `fontSize:` literals in the file (except inside `lib/app_text_styles.dart` or `lib/app_theme.dart`).
- [ ] Every text uses a role from §2.
- [ ] No body/label text below 12 px; primary reading body ≥ 15 px mobile / 16 px desktop.
- [ ] One primary heading per section (one `displayLarge` total on the page; one `headlineLarge` per section).
- [ ] No more than 3 weights on screen.
- [ ] Light-mode contrast passes WCAG 2.2 AA (re-verify on hero gradient and `C.caption` text).
- [ ] Color is never the only signal (errors, links, statuses pair color + icon/text).
- [ ] Layout survives 150% and 200% text scale (test in browser zoom).
- [ ] RTL: `TextAlign.start`, no hard-coded `left`/`right` (matters if Arabic content lands).
- [ ] Long reading copy is constrained to ~60–75 chars per line (`ConstrainedBox(maxWidth: 720)`).
- [ ] V1, V2, and V3 use the **same role** for the same kind of content (card title, body, hero, etc.).
- [ ] `C.accent` only appears on tappable text/CTAs, never on plain titles or body.

---

## 13. Changing the Scale / Initial Migration

The scale itself does not yet live in a dedicated file in this project — body text is inline across `sections/` and `widgets/`. To adopt this skill:

1. Create **`lib/app_text_styles.dart`** that exports a `TextTheme` matching §2 (using `GoogleFonts.nunitoTextTheme` as the base, then `.copyWith(...)` each role).
2. Wire it into `lib/main.dart` by replacing `textTheme: GoogleFonts.nunitoTextTheme(ThemeData.light().textTheme)` with `textTheme: AppTextStyles.textTheme`.
3. Migrate inline `TextStyle(fontSize: ...)` calls in this order (highest visibility first):
   - `lib/widgets/apple_hero.dart` (hero — visible to every visitor)
   - `lib/widgets/apple_nav.dart` (nav — visible to every visitor)
   - `lib/widgets/apple_card_grid.dart` (`Headline` and `Body` widgets — used by most sections)
   - `lib/sections/s*.dart` (one section per PR)
   - `lib/v2/*.dart` and `lib/v3/*.dart` (variants)
4. After each file, run §12's audit checklist.
5. Verify light mode at 100%, 150%, 200% text scale and at mobile / tablet / desktop breakpoints.
6. Note the principle that justified any deviation (HIG / Material / WCAG / NN/g).

Never change scale per-section with `copyWith(fontSize: …)` to "make it fit" — fix the layout instead.
