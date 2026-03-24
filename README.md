# 📱 UltraInfo - Ultraman Heroes & Planets Explorer

A Flutter application showcasing Ultraman heroes and their connected planets with simple UI design and smooth animations.

## ✨ Features

### 🏠 Home Screen
- Hero banner with gradient overlay
- Professional About section
- Quick navigation to Ultramans and Planets
- Responsive design with dynamic scaling

### 👤 Ultraman List
- Browse all Ultraman heroes in chronological order
- Large card interface (110×110 images)
- Golden "ULTRA" badge on each card
- Tap to view detailed profiles

### 🌍 Planet List
- Explore planets connected to Ultraman universe
- Planet information with descriptions
- Related Ultramans displayed as wrapped chips
- Circular avatar designs

### 📖 Detail Screens
- Full character/planet information
- High-quality images with Hero animations
- Profile details (Height, Weight, Origin)
- Special moves and abilities with Wrap layout
- Smooth fade transitions

### 🎨 Navigation
- Slide-out drawer with categories
- Easy switching between Home, Ultramans, and Planets
- Material Design navigation

---

## 🛠️ Technical Requirements Fulfilled

### ✅ Must-Use Widgets (8/8)
- ✓ Text
- ✓ Image
- ✓ Icon
- ✓ Column
- ✓ Row
- ✓ Color
- ✓ Stack
- ✓ SingleChildScrollView

### ✅ Optional Widgets (12/13)
- ✓ Container
- ✓ Padding
- ✓ SizedBox
- ✓ Expanded
- ✓ Positioned
- ✓ AppBar
- ✓ SafeArea
- ✓ Transform (Rotating icons)
- ✓ Divider
- ✓ CircleAvatar
- ✓ ClipRRect
- ✓ Align (Badge positioning)
- ✓ Wrap (Ability tags & chips)

### ✅ Widget Classes (10 StatelessWidgets)
```
HomeScreen
UltramanListScreen
PlanetListScreen
UltramanDetailScreen
PlanetDetailScreen
AppDrawer
SectionTitle
UltramanCard
PlanetCard
CategoryTile
```

### ✅ Scrollable Screens (5 with SingleChildScrollView)
- Home Screen
- Ultraman List
- Planet List
- Ultraman Detail (CustomScrollView)
- Planet Detail

---

## 📱 Project Structure

```
lib/
├── main.dart                          # App entry point
├── screens/
│   ├── home_screen.dart              # Landing page with About info
│   ├── ultraman_list_screen.dart     # List of all Ultramans
│   ├── planet_list_screen.dart       # List of all Planets
│   ├── ultraman_detail_screen.dart   # Ultraman profile page
│   └── planet_detail_screen.dart     # Planet profile page
├── widgets/
│   ├── app_drawer.dart               # Navigation drawer
│   ├── section_title.dart            # Reusable section headers
│   ├── ultraman_card.dart            # Ultraman list card
│   ├── planet_card.dart              # Planet list card
│   └── category_tile.dart            # Drawer menu tile
├── models/
│   ├── ultraman.dart                 # Ultraman data model
│   └── planet.dart                   # Planet data model
└── data/
    ├── ultraman/
    │   └── ultraman_list.dart        # Ultraman database
    └── planet/
        └── planet_list.dart          # Planet database
```

---

## 🎨 Design System

### Color Palette
```
Primary Dark:      #0B1431  (AppBar, Background)
Secondary Dark:    #13224D  (Cards)
Light Blue:        #C9D9FF  (Secondary text)
Gold Accent:       #FFE082  (Highlights, badges)
White:             #FFFFFF  (Primary text)
```

### Typography
- Headers:  20-24px, FontWeight.w800
- Body:     15-17px, FontWeight.w600
- Small:    13-16px, FontWeight.w400

### Spacing
- Padding:  16px standard
- Gaps:     8-14px dynamic
- Card corners: 19px radius

---

## 🚀 Getting Started

### Prerequisites
- Flutter 3.11+ SDK
- Dart 3.0+
- Android Studio / Xcode (for mobile)
- VS Code with Flutter extension

### Installation

1. **Clone the repository**
```bash
git clone https://github.com/yourusername/ultrainfo.git
cd ultrainfo
```

2. **Get dependencies**
```bash
flutter pub get
```

3. **Generate app icons**
```bash
flutter pub run flutter_launcher_icons:main
```

4. **Run the app**
```bash
flutter run
```

### Build for Production

**Android:**
```bash
flutter build apk --release
# or for App Bundle
flutter build appbundle --release
```

**iOS:**
```bash
flutter build ios --release
```

**Web:**
```bash
flutter build web --release
```

**Windows/macOS:**
```bash
flutter build windows --release
flutter build macos --release
```

---

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^6.0.0
  flutter_launcher_icons: ^0.13.1
```

---

## 🎨 Recent Enhancements

### Transform Widget
Rotating section title icons for visual interest:
```dart
Transform.rotate(
  angle: -0.15,
  child: CircleAvatar(...)
)
```

### Align Widget
Golden "ULTRA" badges positioned top-right on character cards:
```dart
Align(
  alignment: Alignment.topRight,
  child: Container(...)
)
```

### Wrap Widget
Responsive ability tags with automatic line breaking:
```dart
Wrap(
  spacing: 8,
  runSpacing: 8,
  children: [/* ability tags */]
)
```

---

## 🖥️ Responsive Design Features

- **Dynamic AppBar Height:** 75-95px based on content
- **Banner Scaling:** Responsive image heights
- **Mobile-First Approach:** Optimized for all screen sizes
- **SafeArea Protection:** Handles notches and system UI
- **Flexible Layouts:** Use of Expanded and Flexible widgets

---

## 🔑 Key Code Examples

### Custom Section Title with Transform
```dart
class SectionTitle extends StatelessWidget {
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.rotate(
          angle: -0.15,
          child: CircleAvatar(
            radius: 14,
            backgroundColor: const Color(0xFF1E2F62),
            child: Icon(icon, size: 16, color: const Color(0xFFBFD0FF)),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(child: Text(title, style: ...)),
      ],
    );
  }
}
```

### Hero Animation on Navigation
```dart
Navigator.push(
  context,
  PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) {
      return UltramanDetailScreen(ultraman: ultra);
    },
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(opacity: animation, child: child);
    },
  ),
);
```

---

## 📊 App Statistics

| Metric | Value |
|--------|-------|
| StatelessWidget Classes | 10 |
| Widget Instances | 100+ |
| Lines of Code | 1500+ |
| Screens | 5 |
| Custom Components | 5 |
| Required Widgets | 8/8 ✅ |
| Optional Widgets | 12/13 ✅ |

---

## 🎓 Learning Outcomes

This project demonstrates:
- ✓ Widget composition and hierarchy
- ✓ Navigation and routing
- ✓ Responsive design principles
- ✓ Animation and transitions
- ✓ State management basic concepts
- ✓ Code organization and modularity
- ✓ Material Design principles
- ✓ App deployment configuration

---

## 🚦 Future Enhancements

- [ ] Search and filter functionality
- [ ] Favorites/bookmark system
- [ ] Dark/Light theme toggle
- [ ] Local data persistence (SQLite)
- [ ] Network API integration
- [ ] Share functionality
- [ ] Multi-language support (i18n)
- [ ] Offline mode

---

## 🐛 Troubleshooting

### Icons not showing
```bash
flutter pub run flutter_launcher_icons:main
```

### Build issues
```bash
flutter clean
flutter pub get
flutter pub run build_runner build
```

### Hot reload not working
```bash
# Stop the app and rebuild
flutter run
```

---



