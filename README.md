<div align="center">

# 🎉 Event Hub App

### A modern, feature-rich Flutter event discovery & management application

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
[![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)](LICENSE)
[![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS%20%7C%20Web-lightgrey?style=for-the-badge)](https://flutter.dev)

</div>

---

## 📱 Screenshots

### Core Screens

| Home | Search | Event Details | Empty Events | See All Events |
|:----:|:------:|:-------------:|:------------:|:--------------:|
| ![Home](screenshots/home.jpg) | ![Search](screenshots/auth.jpg) | ![Event Details](screenshots/map_events.jpg) | ![Empty Events](screenshots/splash_onboarding.jpg) | ![See All Events](screenshots/profile.jpg) |

### Profile & Notifications

| Menu | My Profile | Organizer Profile | Empty Notifications | Notifications |
|:----:|:----------:|:-----------------:|:-------------------:|:-------------:|
| ![Menu](screenshots/home.jpg) | ![My Profile](screenshots/profile.jpg) | ![Organizer Profile](screenshots/map_events.jpg) | ![Empty Notif](screenshots/auth.jpg) | ![Notifications](screenshots/profile.jpg) |

---

## ✨ Features

- 🏠 **Home Feed** — Discover upcoming events near you with personalized recommendations
- 🔍 **Smart Search** — Search events by name, category, or location with real-time results
- 📋 **Event Details** — View full event info including date, venue, host, and description
- 🗺️ **Map Integration** — Explore events on an interactive map view
- 🎟️ **Ticket Purchase** — Buy tickets directly within the app
- 👤 **User Profiles** — Manage your profile, following, and bookmarks
- 🧑‍💼 **Organizer Profiles** — Browse events by organizer with follow functionality
- 🔔 **Notifications** — Stay updated with event reminders and social activity
- 📅 **Calendar Sync** — Add events to your personal calendar
- 🌐 **Splash & Onboarding** — Smooth intro experience for new users

---

## 🏗️ Project Structure
```
event_hub_app/
├── lib/
│   ├── core/              # Shared utilities, themes, constants
│   ├── features/          # Feature-based modules
│   │   ├── auth/
│   │   ├── home/
│   │   ├── events/
│   │   ├── profile/
│   │   ├── notifications/
│   │   └── onboarding/
│   └── main.dart          # App entry point
├── assets/                # Images, fonts, icons
├── screenshots/           # App screenshots
├── android/               # Android native project
├── ios/                   # iOS native project
└── web/                   # Web platform support
```

---

## 🚀 Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install) `>=3.0.0`
- [Dart SDK](https://dart.dev/get-dart) `>=3.0.0`
- Android Studio / Xcode (for mobile builds)

### Installation

1. **Clone the repository**
```bash
   git clone https://github.com/yourusername/event_hub_app.git
   cd event_hub_app
```

2. **Install dependencies**
```bash
   flutter pub get
```

3. **Run the app**
```bash
   # Android / iOS
   flutter run

   # Web
   flutter run -d chrome
```

4. **Build for production**
```bash
   # Android APK
   flutter build apk --release

   # iOS
   flutter build ios --release

   # Web
   flutter build web --release
```

---

## 🧱 Architecture

Event Hub App follows a **feature-first clean architecture** pattern:
```
features/
└── feature_name/
    ├── data/          # Repositories, data sources, models
    ├── domain/        # Entities, use cases, abstractions
    └── presentation/  # UI pages, widgets, controllers
```

| Layer | Responsibility |
|-------|----------------|
| `core/` | Shared theme, routing, network config, utilities |
| `data/` | API calls, local storage, DTOs |
| `domain/` | Business logic, use cases, entities |
| `presentation/` | Widgets, pages, state management |

---

## 📦 Dependencies

| Package | Purpose |
|---------|---------|
| `flutter_bloc` / `provider` | State management |
| `dio` / `http` | HTTP networking |
| `go_router` | Navigation & routing |
| `google_maps_flutter` | Map integration |
| `cached_network_image` | Optimized image loading |
| `intl` | Date & time formatting |
| `shared_preferences` | Local storage |
| `flutter_local_notifications` | Push notifications |

> See [`pubspec.yaml`](pubspec.yaml) for the full dependency list.

---

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a new branch: `git checkout -b feature/your-feature-name`
3. Commit your changes: `git commit -m 'feat: add new feature'`
4. Push to the branch: `git push origin feature/your-feature-name`
5. Open a Pull Request

---

## 📄 License

This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.

---

<div align="center">

Made with ❤️ using Flutter

</div>