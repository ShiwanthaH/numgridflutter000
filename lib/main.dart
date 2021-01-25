import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> numbers = List<String>();
  Future<List<String>> makeList() async {
    for (int i = 1; i < 91; i++) {
      numbers.add(i.toString());
    }
    return numbers;
  }

  void initState() {
    makeList();
    Future.delayed(Duration(seconds: 2), () {
      setState(() {});
    });
    super.initState();
  }

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: (numbers.isNotEmpty)
            ? GridView.builder(
                itemCount: 90,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    child: Text(numbers[index]),
                    onTap: () {
                      setState(() {
                        var tmp = numbers[index];
                        numbers.removeAt(index);
                        numbers.insert(0, tmp);
                      });
                    },
                  );
                },
              )
            : LinearProgressIndicator(),
      ),
    );
  }
}
