import 'package:flutter/material.dart';

import 'package:sentry_flutter/sentry_flutter.dart';

import 'app.dart';
import 'utils/ConfigReader/config_reader.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ConfigReader.initialize();
  await SentryFlutter.init(
    (options) {
      //TODO:
      options.dsn = 'Add Your Sentry Key';
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
      // We recommend adjusting this value in production.
      options.tracesSampleRate = 1.0;
    },
    appRunner: () => runApp(
        DefaultAssetBundle(bundle: SentryAssetBundle(), child: const MyApp())),
  );
}