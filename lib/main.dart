import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FlutterLocalization localization = FlutterLocalization.instance;

  @override
  void initState() {
    localization.init(
      mapLocales: [
        const MapLocale('en', AppLocale.EN),
        const MapLocale('km', AppLocale.KM),
        const MapLocale('ja', AppLocale.JA),
      ],
      initLanguageCode: 'en',
    );
    localization.onTranslatedLanguage = _onTranslatedLanguage;
    super.initState();
  }

  /// the setState function here is a must to add
  void _onTranslatedLanguage(Locale? locale) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      supportedLocales: localization.supportedLocales,
      localizationsDelegates: localization.localizationsDelegates,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const <Widget>[
            SizedBox(height: 20),
            Text(
              'My hometown is a beautiful place nestled in a lush landscape surrounded by stunning mountains and crystal clear rivers. Growing up here has been an incredible experience, as I have been exposed to a variety of cultures, languages, and traditions. I have also been able to explore the diverse wildlife and ecosystems that make up my continent. I am deeply connected to this place, because it is where I have spent my entire life, and where I have formed meaningful relationships with my family and friends.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'The people here are incredibly welcoming and friendly, and I am always met with warmth and hospitality whenever I visit. As someone who has grown up here, I am proud of the rich history, culture, and heritage that shapes our continent. I love the way that different cultures coexist and intersect here, and I am in awe of the vibrant art, music, and dance that springs from the vibrant souls of the people here',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class Lang {
  static final all = [
    const Locale('en'),
    #english,
    const Locale('es'),
    #spanish,
    const Locale('de'),
    #german,
    const Locale('sw'),
    #kiswahili,
    const Locale('fr'),
    #french,
  ];
}

mixin AppLocale {
  static const String title = 'title';

  static const Map<String, dynamic> EN = {title: 'Localization'};
  static const Map<String, dynamic> KM = {title: 'ការធ្វើមូលដ្ឋានីយកម្ម'};
  static const Map<String, dynamic> JA = {title: 'ローカリゼーション'};
}
