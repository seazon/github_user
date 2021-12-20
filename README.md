# github_user

## Examples

#### Environment
example for running with prod environment
```bash
flutter run -t lib/main_prod.dart
```

#### MVVM
all pages apply with MVVM

#### Router / Navigation
apply with lib `get`

#### `Deeps Links` / `Custom URL schemes`
Test: [Android]
```bash
adb shell 'am start -W -a android.intent.action.VIEW -c android.intent.category.BROWSABLE -d "poc://flutter.demo/github_user?keyword=wcl"'
```

Test: [iOS]
```bash
/usr/bin/xcrun simctl openurl booted "poc://flutter.demo/github_user?keyword=wcl"
```

Ref: https://pub.dev/packages/uni_links

#### i18n
install IDE plugin `flutter_intl`
- Android Studio ref: https://plugins.jetbrains.com/plugin/13666-flutter-intl
- VS Code ref: https://marketplace.visualstudio.com/items?itemName=localizely.flutter-intl

## iOS Part

Some examples need configuration or coding at platform side, miss iOS part currently.

- `Deeps Links` / `Custom URL schemes`: https://pub.dev/packages/uni_links
- Image Picker: https://pub.dev/packages/image_picker
- WebView: https://pub.dev/packages/webview_flutter
