import 'package:dark_light_mode_language/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  return runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => ThemeNotifier(),
        child: Consumer<ThemeNotifier>(
          builder: (_, mode, __) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Modes',
              darkTheme: ThemeData(
                brightness: Brightness.dark,
              ),
              themeMode: mode.mode,
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
                brightness: Brightness.light,
              ),
              home: const MyHomePage(title: 'Flutter Demo Home Page'),
            );
          },
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              themeNotifier.mode == ThemeMode.dark
                  ? "Dark Mode "
                  : "Light Mode ",
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          bool isDarkMode =
              MediaQuery.of(context).platformBrightness == Brightness.dark;
          if (isDarkMode) {
            themeNotifier.toggleMode();
          }
        },
        tooltip: 'Change Mode',
        child: const Icon(Icons.dark_mode),
      ),
    );
  }
}
