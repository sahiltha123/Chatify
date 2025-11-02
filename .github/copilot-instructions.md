# Chat App Coding Guidelines

This document outlines key patterns and conventions for AI agents working in this Flutter chat application codebase.

## Architecture Overview

- **State Management**: Uses GetX pattern (`get` package) for state management and dependency injection
- **View-Controller Pattern**: 
  - Views (`lib/views/`) handle UI layout and composition
  - Controllers (`lib/controllers/`) manage state and business logic
  - Example: `FindPeopleView` with corresponding `UsersListController`

## Project Structure

```
lib/
├── controllers/    # GetX controllers for state management
├── models/         # Data models (user, chat, message, etc.)
├── routes/         # Route definitions and navigation
├── services/       # Firebase and authentication services
├── theme/         # App-wide theming
└── views/         # UI components and screens
```

## Key Patterns

1. **View Construction**:
   - Views extend `GetView<Controller>` to access their controller
   - UI components are broken into private methods prefixed with `_build`
   - Example: `_buildSearchBar()`, `_buildEmptyState()` in `find_people_view.dart`

2. **Theme Usage**:
   - Use `AppTheme` constants for colors and styling
   - Access theme via `Theme.of(Get.context!)`

3. **Firebase Integration**:
   - Firebase services initialized in `main.dart`
   - Firestore interactions handled through `firestore_service.dart`

4. **Navigation**:
   - Use `Get.toNamed()` for navigation
   - Routes defined in `routes/app_routes.dart`
   - Route bindings in `routes/app_pages.dart`

## Common Tasks

1. **Adding a New Screen**:
   - Create view in `lib/views/`
   - Create controller in `lib/controllers/`
   - Add route in `lib/routes/app_routes.dart`
   - Add page binding in `lib/routes/app_pages.dart`

2. **State Management**:
   - Use `Obx(() => ...)` for reactive widgets
   - Define observable variables in controllers with `.obs`

## Dependencies

- Firebase Core & Firestore for backend
- GetX for state management and routing
- Cloud Firestore for data persistence

## Development Workflow

1. Ensure Firebase configuration is set up in:
   - `android/app/google-services.json`
   - `ios/Runner/GoogleService-Info.plist`
   - `macos/Runner/GoogleService-Info.plist`

2. Run the app:
   ```bash
   flutter pub get
   flutter run
   ```