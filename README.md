

![coverage][coverage_badge]
[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]

Generated by the [Very Good CLI][very_good_cli_link] 🤖

Devfin

This project utilizes [Very good layered architecture](https://verygood.ventures/blog/very-good-flutter-architecture) developed by Felix Angelov, the creator of the BLoC library, and his team at Very Good Ventures.

---

## Features
## Technologies used
## Flutter app used
1. Using flutter_bloc for state management, and also utilizing Riverpod for simple use-cases such as theme switching and language switching.
2. [Very good layered architecture](https://verygood.ventures/blog/very-good-flutter-architecture) recommended by VeryGoodVentures
3. go_router for navigation and routing
4. Service Locator using get_it and injectable packages
5. l10n using flutter_localization via .arb
6. using [ShoreBird code-push](https://shorebird.dev/) for unplanned features (ShoreBird is similar to Flutter's hot reload feature, but it operates in production environment)
7. using [Firebase Remote Config](https://kazlauskas.dev/control-your-flutter-app-with-firebase-remote-config/) planned features

## Screenshot
## Todo

<details>
<summary>Verygood Ventures Documentation</summary>

## Getting Started 🚀

This project contains 3 flavors:

- development
- staging
- production

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart

# Production
$ flutter run --flavor production --target lib/main_production.dart
```

_\*Devfin works on iOS, Android, Web, and Windows._

---

## Running Tests 🧪

To run all unit and widget tests use the following command:

```sh
$ flutter test --coverage --test-randomize-ordering-seed random
```

To view the generated coverage report you can use [lcov](https://github.com/linux-test-project/lcov).

```sh
# Generate Coverage Report
$ genhtml coverage/lcov.info -o coverage/

# Open Coverage Report
$ open coverage/index.html
```

---

## Working with Translations 🌐

This project relies on [flutter_localizations][flutter_localizations_link] and follows the [official internationalization guide for Flutter][internationalization_link].

### Adding Strings

1. To add a new localizable string, open the `app_en.arb` file at `lib/l10n/arb/app_en.arb`.

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    }
}
```

2. Then add a new key/value and description

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    },
    "helloWorld": "Hello World",
    "@helloWorld": {
        "description": "Hello World Text"
    }
}
```

3. Use the new string

```dart
import 'package:devfin/l10n/l10n.dart';

@override
Widget build(BuildContext context) {
  final l10n = context.l10n;
  return Text(l10n.helloWorld);
}
```

### Adding Supported Locales

Update the `CFBundleLocalizations` array in the `Info.plist` at `ios/Runner/Info.plist` to include the new locale.

```xml
    ...

    <key>CFBundleLocalizations</key>
	<array>
		<string>en</string>
		<string>es</string>
	</array>

    ...
```

### Adding Translations

1. For each supported locale, add a new ARB file in `lib/l10n/arb`.

```
├── l10n
│   ├── arb
│   │   ├── app_en.arb
│   │   └── app_es.arb
```

2. Add the translated strings to each `.arb` file:

`app_en.arb`

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    }
}
```

`app_es.arb`

```arb
{
    "@@locale": "es",
    "counterAppBarTitle": "Contador",
    "@counterAppBarTitle": {
        "description": "Texto mostrado en la AppBar de la página del contador"
    }
}

```

[coverage_badge]: coverage_badge.svg
[flutter_localizations_link]: https://api.flutter.dev/flutter/flutter_localizations/flutter_localizations-library.html
[internationalization_link]: https://flutter.dev/docs/development/accessibility-and-localization/internationalization
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[very_good_cli_link]: https://github.com/VeryGoodOpenSource/very_good_cli

</details>

## References

### Setting up muti-flavor with Firebase
1. [Creating Development Environments for Firebase using the Very Good & Flutterfire CLIs in Flutter](https://demmss.medium.com/creating-development-environments-for-firebase-using-the-very-good-flutterfire-clis-in-flutter-250eba52bd4d)
2. [Flutter Flavors Setup with multiple Firebase Environments using FlutterFire and Very Good CLI](https://codewithandrea.com/articles/flutter-flavors-for-firebase-apps/)
3. [Practical Guide: Flutter + Firebase + FlutterFire CLI + CI (Codemagic)](https://blog.codemagic.io/pratical-guide-flutterfire-cli/)
4. [Flutter iOS — Setup Flavors with different Firebase Config](https://ahmedyusuf.medium.com/setup-flavors-in-ios-flutter-with-different-firebase-config-43c4c4823e6b)
