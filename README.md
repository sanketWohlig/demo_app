# flutter_framework_v1

A new Flutter project.

## Getting Started

### 1. Change the Package Name

To update the default package name `com.wohlig.flutter_framework_v1` to your desired package name, follow these steps:

- **Step 1:** Add the `change_app_package_name` package by running the command:
  ```bash
  flutter pub add -d change_app_package_name
  ```

- **Step 2:** Change the package name by running the following command:
  ```bash
  dart run change_app_package_name:main com.new.package.name
  ```

### 2. State Management

This template uses the `provider` package for state management. For more information on how to use `provider`, refer to the official [provider documentation](https://pub.dev/packages/provider).

### 3. Customizing the Splash Screen

To customize the splash screen with your app icon, follow these steps:

- Open the `flutter_native_splash.yaml` file and add the path to your splash screen image along with the background color:
  ```yaml
  image: images/logo.png
  image_dark: images/logo.png
  color_android: "#ffffff"
  color_dark_android: "#131314"
  color_ios: "#ffffff"
  color_dark_ios: "#131314"
  ```

- After making the changes, run the command:
  ```bash
  dart run flutter_native_splash:create
  ```

### 4. Adding an App Icon

To add an app icon:

- Uncomment the following code in `pubspec.yaml`:
  ```yaml
  flutter_launcher_icons:
    android: "ic_launcher"
    ios: true
    image_path: "images/sachai_logo.png"
  ```

- Update the `image_path` with the location of your app icon.

For more details, refer to the [flutter_launcher_icons documentation](https://pub.dev/packages/flutter_launcher_icons).

### 5. Publishing the App

This template integrates with Codemagic for publishing the app on the App Store and Play Store. To publish the app on the Play Store:

- **Step 1:** Generate a keystore by running the following command:
  ```bash
  keytool -genkeypair -v -keystore key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias key
  ```

- **Step 2:** Create a `key.properties` file inside the Android folder and add the following variables:
  ```properties
  storePassword=<your-store-password>
  keyPassword=<your-key-password>
  keyAlias=<your-key-alias>
  storeFile=<path-to-your-keystore-file>
  ```

- **Step 3:** Inside `android/app/build.gradle`, uncomment the `signingConfigs` section. If you plan to use Codemagic, retain the existing code; otherwise, you can modify or remove the conditional logic as needed.

For more details on publishing, refer to the [Codemagic documentation](https://codemagic.io).

### 6. Localization

The template uses the `intl` package for localization. Initialization is complete with support for two languages: English and Hindi.

To add a new language:

- **Step 1:** Create a new file named `app_<language_code>.arb` (e.g., `app_hi.arb`) inside the `l10n` folder and add the language-specific text.

- **Step 2:** Add the new language code to `l10n.dart` inside the `l10n` folder.

For more details on the `intl` package, refer to the [intl documentation](https://pub.dev/packages/intl).

### 7. Environment Variables

For environment variables, we use a `Config` folder, which is not included in the GitHub repository. Before running the app:

- **Step 1:** Create a folder named `Config` in the root directory.
- **Step 2:** Inside the `Config` folder, create a file named `app_config.json` and add your environment variables.

To access the environment variables inside the `lib/utils` folder, use the `ConfigReader` class located in `config_reader.dart`. 

To add a new environment variable, use the following method:

```dart
static String getBackendUrl() {
    return _config![<ENV_VARIABLE_NAME>] as String;
}
```

