import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Wikipedia Search',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
          body: MyHomePage(),
        ),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var currentArticle = '';
  void registerUserArticleCommand({userArticleInput}) {
    currentArticle = userArticleInput;
    notifyListeners();
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController inputBar = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('Enter the name of the article you want to look up.'),
        ),
        Padding(
          padding: const EdgeInsets.all(40),
          child: TextField(
            controller: inputBar,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(30),
          child: ElevatedButton(
              onPressed: () {
                String current = inputBar.text;
                appState.registerUserArticleCommand(userArticleInput: current);
                print(current);
                inputBar.clear();
              },
              child: const Text('Enter')),
        ),
      ],
    );
  }
}
