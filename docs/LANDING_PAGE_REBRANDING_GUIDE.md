# Landing Page Rebranding Guide

> This document outlines the step-by-step process for taking the existing `landing_page` web app and giving it a new identity. Follow each section carefully and document your progress in `docs/REBRANDING_PROGRESS.md` as you complete tasks.

---

## 1. Preparation

1. **Gather Assets & Requirements**
   - New product name (must be different from the current project).
   - Primary brand color(s) and secondary palette.
   - Tagline or one‑line value proposition.
   - New logo artwork in PNG or SVG format. This will also be the favicon.
   - A brief description of what the product does (for SEO & meta tags).
   - Support email address for legal pages.
   - Any social media links or handles you want to show on the site.

2. **Choose a Design System**
   - Pick a modern CSS utility approach (Tailwind is already in use) and decide on a color scheme and typography beyond the default.
   - Identify any additional fonts or icons you want to import.

3. **Setup Branding Files**
   - Save the new logo under `landing_page/public/` (e.g. `logo.png` and a `favicon.ico`).
   - Replace the default `favicon.ico` immediately.

4. **Use pnpm**
   - All package operations must use `pnpm` as the workspace manages dependencies.

---

## 2. Global Configuration

1. **package.json**
   - Update `name`, `description`, and any other metadata to reflect the new product.
   - Run `pnpm install` after making any dependency changes.

2. **app/layout.tsx**
   - Change `<title>` and `<meta>` description in `metadata`.
   - Adjust fonts if you’re switching to a different typeface.

3. **globals.css**
   - Replace the default Tailwind theme colors by customizing via `@layer` if necessary.
   - Add any custom utility classes for your brand's palette.

---

## 3. Navigation & Footer

1. **Navbar**
   - Create or update `landing_page/components/layout/Navbar.tsx`.
   - Use the new logo; update the brand name text.
   - Update links to match the new site structure (Home, Features, FAQ, Legal, etc.).
   - Ensure mobile responsiveness.

2. **Footer**
   - Create or update `landing_page/components/landing/Footer.tsx`.
   - Display the new logo, a brief description, copyright year, and social links.
   - Include links to Privacy Policy, Terms of Service, Contact, etc.

---

## 4. Core Landing Page Sections

1. **Hero**
   - Implement `landing_page/components/landing/Hero.tsx` with the main headline, subheadline, and CTA button(s).
   - Use the primary brand color for buttons/background patterns.

2. **Features**
   - Implement `landing_page/components/landing/Features.tsx` listing 3–6 key features. Provide icons that suit the new brand.

3. **How It Works**
   - Add a component `landing_page/components/landing/HowItWorks.tsx` illustrating the user workflow in 3 simple steps.

4. **FAQ**
   - Create `landing_page/components/landing/FAQ.tsx` with common questions and answers about the product.

5. **Bottom CTA**
   - Modify `landing_page/app/page.tsx` so the bottom of the home page has a final call‑to‑action reflecting the new brand (e.g. "Get Started", "Learn More").

---

## 5. Legal & Additional Pages

Create or update the following under `landing_page/app/`:

- `privacy-policy/page.tsx` → Fully written privacy policy using the new support email.
- `terms/page.tsx` → Detailed terms of service.
- `help/page.tsx` → Help center placeholder or contact info.
- `contact/page.tsx` → Support email and social media links.

Make sure the content is professional, clearly branded, and not copy/pasted from the old project.

---

## 6. Mockups & Visual Assets

1. **App Mockup Component**
   - Update or create `landing_page/components/mockup/AppScreen.tsx` to show relevant screenshots or placeholder UI that matches the new brand.

2. **Logo/Favicon Usage**
   - Replace all occurrences of `/next.svg`, `/vercel.svg`, etc. with the new logo files.

---

## 7. Color Scheme & Typography

Once the palette is chosen, search the repo for default colors like `zinc`, `foreground`, etc., and replace them appropriately.

- Use Tailwind configuration if you need to extend color names (see `tailwind.config.js` if present).
- Update global font stack if switching from Geist to another Google font.

---

## 8. Verification & Testing

1. Run `pnpm dev` and confirm the site loads.
2. Click through every link to ensure there are no 404s.
3. Inspect on mobile viewport sizes.
4. Review accessibility (contrast, alt tags, semantic HTML).

---

## 9. Documentation

As you finish each section above, add an entry to `docs/REBRANDING_PROGRESS.md` describing what was done, any outstanding tasks, and any design decisions made.

Example entry:

```
## 2026-02-27
- Created rebranding guide and initial progress document.
- Added new logo assets.
- Updated layout metadata.
```

Keep the progress file chronological and clear. One entry per day or significant milestone.

---

## 10. Cleanup

Once everything is updated and tested, delete any unused default images, CSS rules, or placeholder text related to "Next.js" or "Vercel".

---

*Last updated: February 2026*