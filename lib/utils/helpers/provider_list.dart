import 'package:flutter_framework_v1/features/auth/provider/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providerList = [
  ChangeNotifierProvider(create: (context) => AuthProvider()),
];
