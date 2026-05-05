# Flutter RPG

A Flutter RPG character manager app where users can create, customize, and manage their RPG characters. Character data is persisted in the cloud using Firebase Firestore.

## Features

- **Create characters** – Give your character a name, slogan, and choose a vocation
- **Choose a vocation** – Four unique vocations, each with its own weapon, special ability, and skill set:
  - 🖥️ **Terminal Raider** – Adept in terminal commands to trigger traps (weapon: Terminal, ability: Shellshock)
  - 💻 **Code Junkie** – Uses code to infiltrate enemy defenses (weapon: React 99, ability: Higher Order Overdrive)
  - 🎨 **UX Ninja** – Uses quick & stealthy visual attacks (weapon: Infused Stylus, ability: Triple Swipe)
  - 🔮 **Algo Wizard** – Carries a staff to unleash algorithm magic (weapon: Crystal Staff, ability: Algorythmic Daze)
- **Assign skills** – Each vocation has 4 unique skills to choose from
- **Manage stats** – Distribute stat points across your character's attributes
- **Favourite characters** – Mark characters as favourites
- **Swipe to delete** – Remove characters with a swipe gesture
- **Cloud sync** – All characters are stored and retrieved from Firebase Firestore

## Tech Stack

| Layer | Technology |
|---|---|
| Framework | Flutter (Dart) |
| State management | Provider |
| Backend / database | Firebase Cloud Firestore |
| Fonts | Google Fonts |
| ID generation | UUID |

## Project Structure

```
lib/
├── main.dart               # App entry point, Firebase init
├── theme.dart              # App-wide theme
├── firebase_options.dart   # Firebase configuration
├── models/
│   ├── character.dart      # Character model (Firestore serialization)
│   ├── vocation.dart       # Vocation enum with metadata
│   ├── skill.dart          # Skill model & all skills list
│   └── stats.dart          # Stats mixin
├── screens/
│   ├── home/               # Character list screen
│   │   ├── home.dart
│   │   ├── character_card.dart
│   │   └── create/         # Character creation flow
│   └── profile/            # Character profile screen
│       ├── profile.dart
│       ├── skill_list.dart
│       ├── stats_table.dart
│       └── heart.dart
├── services/
│   ├── character_store.dart  # Provider store (state management)
│   └── firestore_service.dart
└── shared/                 # Reusable UI widgets
```

## Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) ≥ 3.3.4
- A Firebase project with Cloud Firestore enabled

### Setup

1. **Clone the repository**
   ```bash
   git clone https://github.com/Husnain192/Flutter-App.git
   cd Flutter-App
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure Firebase**  
   Follow the [FlutterFire setup guide](https://firebase.google.com/docs/flutter/setup) to connect your Firebase project and replace `lib/firebase_options.dart` with your own generated options.

4. **Run the app**
   ```bash
   flutter run
   ```

## Resources

- [Flutter documentation](https://docs.flutter.dev/)
- [Firebase for Flutter](https://firebase.google.com/docs/flutter/setup)
- [Provider package](https://pub.dev/packages/provider)
