import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
      ),
      home: const MyHomePage(title: 'חישוב גימטריא'),
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
  int _total = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'הכנס מילים לחישוב גימטריא:',
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.right,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.right,
                keyboardType: TextInputType.multiline,
                minLines: 3,
                maxLines: 8,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'הכנס טקסט כאן',
                ),
                onChanged: (text) {
                  int total = 0;
                  String letters = 'אבגדהוזחטיכלמנסעפצקרשתךםןףץ';
                  List<int> values = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 200, 300, 400, 20, 40, 50, 80, 90];
                  for (int i = 0; i < text.length; i++) {
                    int index = letters.indexOf(text[i]);
                    if (index != -1) {
                      total += values[index];
                    }
                  }
                  setState(() {
                    _total = total;
                  });
                },
              ),
            ),
            // const Text('תוצאה:'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '$_total',
                style: Theme.of(context).textTheme.headlineMedium,
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
      ),
    );
  }
}