// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:my_shared_prefrences/models/theme_settings.dart';
import 'package:my_shared_prefrences/pages/settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeSettings(),
        ),
      ],
      child: Consumer<ThemeSettings>(builder: (context, value, child) {
        return value.doneLoading
            ? MaterialApp(
                theme: value.darkTheme ? darkTheme : lightTheme,
                home: const Settings(),
              )
            : LoadingScreen(
                context: context,
              );
      }),
    );
  }
}

class LoadingScreen extends StatefulWidget {
  final BuildContext context;
  const LoadingScreen({
    Key? key,
    required this.context,
  }) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    await Future.delayed(
      Duration(seconds: 4),
    );
    widget.context.read<ThemeSettings>().doneLoading = true;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png'),
            Text('Getting the Magic Ready')
          ],
        ),
      ),
    );
  }
}
