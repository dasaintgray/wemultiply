# WeMultiply Website Implementation Plan (Jaspr Framework)

## Overview
Build a full website (NOT web app) for WeMultiply using **Jaspr** - a Dart web framework that supports SSR/SSG. This will be a separate project from the Flutter app, providing a marketing website with proper SEO, fast loading, and integration with the existing Serverpod backend.

## Why Jaspr?
- **SEO-friendly**: Server-side rendering for search engine indexing
- **Dart ecosystem**: Reuse knowledge from Flutter/Serverpod
- **Fast**: Pre-rendered HTML with optional hydration
- **Modern**: Supports Tailwind CSS out of the box
- **Flexible**: Can run as SSR server or static site

---

## Project Structure

### New Folder: `wm_website/`
```
wm/
├── wm_client/          # Existing Serverpod client
├── wm_flutter/         # Existing Flutter app
├── wm_server/          # Existing Serverpod server
└── wm_website/         # NEW: Jaspr website
    ├── lib/
    │   ├── components/     # Reusable UI components
    │   │   ├── header.dart
    │   │   ├── footer.dart
    │   │   ├── hero_section.dart
    │   │   ├── product_card.dart
    │   │   ├── feature_card.dart
    │   │   ├── testimonial.dart
    │   │   └── cta_button.dart
    │   ├── pages/          # Page components
    │   │   ├── home_page.dart
    │   │   ├── about_page.dart
    │   │   ├── products_page.dart
    │   │   ├── contact_page.dart
    │   │   ├── membership_page.dart
    │   │   └── faq_page.dart
    │   ├── services/       # API integration
    │   │   └── api_service.dart
    │   ├── app.dart        # Root app component
    │   ├── main.dart       # Server entry point
    │   └── jaspr_options.dart
    ├── web/
    │   ├── main.dart       # Client entry point
    │   ├── index.html      # HTML template
    │   ├── styles.css      # Base styles
    │   └── images/         # Static assets
    ├── pubspec.yaml
    └── tailwind.config.js
```

---

## Website Pages

### 1. Home Page (`/`)
- Hero section with brand messaging
- Featured products carousel
- Membership packages overview
- Call-to-action buttons
- Testimonials section

### 2. About Page (`/about`)
- Company story and mission
- Team section (if applicable)
- Values and vision

### 3. Products Page (`/products`)
- Product grid with images
- Product details (fetched from Serverpod API)
- Filtering by category
- Pricing display

### 4. Membership Page (`/membership`)
- Membership packages display
- Benefits comparison table
- Pricing tiers
- Sign-up CTA (links to Flutter app)

### 5. Contact Page (`/contact`)
- Contact form
- Company address/location
- Social media links

### 6. FAQ Page (`/faq`)
- Frequently asked questions
- Expandable accordion sections

---

## Implementation Phases

### Phase 1: Project Setup
1. **Install Jaspr CLI**
   ```bash
   dart pub global activate jaspr_cli
   ```

2. **Create Jaspr project**
   ```bash
   cd d:\projects\wemultiply\dev\wm
   jaspr create wm_website
   ```

3. **Configure for SSR mode**
   - Edit `pubspec.yaml` for SSR configuration
   - Add dependencies: `jaspr_router`, `jaspr_tailwind`, `http`

4. **Setup Tailwind CSS**
   - Add `jaspr_tailwind` as dev dependency
   - Create `tailwind.config.js` with custom colors matching brand

### Phase 2: Core Components
1. **Create Header component**
   - Logo
   - Navigation links
   - Mobile responsive menu

2. **Create Footer component**
   - Site links
   - Social media icons
   - Copyright notice

3. **Create Layout wrapper**
   - Combines header + content + footer
   - Consistent across all pages

### Phase 3: Pages Implementation
1. **Home page** - Hero, features, CTA
2. **About page** - Company info
3. **Products page** - Fetch from Serverpod API
4. **Membership page** - Package comparison
5. **Contact page** - Contact form
6. **FAQ page** - Accordion questions

### Phase 4: API Integration
1. **Create API service**
   - HTTP client to call Serverpod endpoints
   - Fetch products from `/product/getAllProduct`
   - Fetch membership packages

2. **Server-side data fetching**
   - Use async components for data loading
   - Pre-render pages with data

### Phase 5: Styling & Polish
1. **Tailwind configuration**
   - Custom color palette (brand colors)
   - Typography settings
   - Responsive breakpoints

2. **Component styling**
   - Consistent design language
   - Hover/active states
   - Loading states

### Phase 6: Deployment Setup
1. **Build configuration**
   - SSR build for production
   - Docker setup for deployment

2. **Integration with existing infrastructure**
   - Can run alongside Serverpod on same server
   - Or deploy to separate static hosting

---

## Technical Details

### Dependencies (pubspec.yaml)
```yaml
name: wm_website
description: WeMultiply Marketing Website

environment:
  sdk: '>=3.0.0 <4.0.0'

dependencies:
  jaspr: ^0.15.0
  jaspr_router: ^0.5.0
  http: ^1.2.0

dev_dependencies:
  jaspr_tailwind: ^0.2.0
  build_runner: ^2.4.0
  jaspr_builder: ^0.15.0
```

### Tailwind Configuration
```javascript
// tailwind.config.js
module.exports = {
  content: ['lib/**/*.dart'],
  theme: {
    extend: {
      colors: {
        primary: '#1E3A8A',      // Dark blue (from AppColors)
        secondary: '#166534',    // Dark green
        accent: '#F59E0B',       // Orange
      },
    },
  },
}
```

### API Service Pattern
```dart
// lib/services/api_service.dart
class ApiService {
  static const String baseUrl = 'https://wmapi.mooo.com';

  static Future<List<Product>> getProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/product/getAllProduct'));
    // Parse and return products
  }
}
```

---

## Key Files to Create

| File | Purpose |
|------|---------|
| `wm_website/pubspec.yaml` | Project dependencies |
| `wm_website/lib/main.dart` | Server entry point |
| `wm_website/lib/app.dart` | Root app with router |
| `wm_website/lib/components/header.dart` | Site header |
| `wm_website/lib/components/footer.dart` | Site footer |
| `wm_website/lib/pages/home_page.dart` | Home page |
| `wm_website/lib/pages/products_page.dart` | Products listing |
| `wm_website/lib/services/api_service.dart` | Serverpod API client |
| `wm_website/web/index.html` | HTML template |
| `wm_website/tailwind.config.js` | Tailwind config |

---

## Existing Resources to Reuse

### From wm_server (API Endpoints)
- `ProductEndpoint.getAllProduct()` - Get all products
- `MembershipEndpoint` - Get membership packages
- CDN URL: `http://122.53.52.217:8888/api/cdn/download/images/`

### From wm_flutter (Design Reference)
- Color palette: `wm_flutter/lib/core/styles/color_styles.dart`
- Logo assets: `wm_flutter/assets/pngs/logo2.png`
- App theme reference: `wm_flutter/lib/core/themes/app_theme.dart`

---

## Verification Steps

1. **Create and run project**
   ```bash
   cd wm_website
   dart pub get
   jaspr serve
   ```
   Open http://localhost:8080

2. **Test each page**
   - Navigate to all routes
   - Verify content renders
   - Check responsive design

3. **Test API integration**
   - Products load from Serverpod
   - Images display from CDN

4. **Build for production**
   ```bash
   jaspr build
   ```
   Verify `build/jaspr/` contains server executable and assets

5. **Test production build**
   ```bash
   cd build/jaspr
   ./app
   ```

---

## Deployment Options

### Option A: Docker (Recommended)
```dockerfile
FROM dart:stable AS build
RUN dart pub global activate jaspr_cli
WORKDIR /app
COPY . .
RUN dart pub get
RUN jaspr build

FROM debian:buster-slim
COPY --from=build /app/build/jaspr /app
WORKDIR /app
EXPOSE 8080
CMD ["./app"]
```

### Option B: Alongside Serverpod
- Run Jaspr on different port (e.g., 8081)
- Use nginx to proxy requests

### Option C: Static Hosting (if using SSG)
- Deploy `build/jaspr/web/` to Netlify/Vercel/GitHub Pages

---

## Notes

- The website will be a **separate Dart project** in `wm_website/`
- Uses **SSR mode** for SEO benefits
- Fetches data from **existing Serverpod API**
- Styled with **Tailwind CSS** for modern responsive design
- Can be deployed independently or alongside existing server
