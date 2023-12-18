import 'package:flutter/material.dart';
import 'package:tourist_spot/land1.dart';
import 'package:tourist_spot/loading_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 5));
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: NetworkImage(
            'https://images.unsplash.com/photo-1497250681960-ef046c08a56e?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Z3JlZW4lMjBsZWF2ZXMlMjBiYWNrZ3JvdW5kfGVufDB8fDB8fHww'),
        fit: BoxFit.cover,
      )),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: isLoading ? Loading() : Land1(),
      ),
    );
  }
}
