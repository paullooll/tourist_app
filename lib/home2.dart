import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const FigmaToCodeApp());
}

class FigmaToCodeApp extends StatelessWidget {
  const FigmaToCodeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: MyHomePage2(),
    );
  }
}

class MyHomePage2 extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage2> {
  late List data = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    var uri = Uri.parse(
        "https://touristspot-be5ea-default-rtdb.asia-southeast1.firebasedatabase.app/.json");

    var response = await http.get(uri);
    var jsonData = jsonDecode(response.body);

    var spotsMap = jsonData as Map<String, dynamic>;

    // Get list from Map
    data = spotsMap["spot"] ?? [];

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: data.isNotEmpty
          ? ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return buildSpotCard(data[index]);
              },
            )
          : Center(child: CircularProgressIndicator()),
    );
  }

  Widget buildSpotCard(item) {
    return Container(
      width: 390,
      height: 844,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(color: Color(0xFF141414)),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 390,
              height: 519,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: NetworkImage(item['imageurl']),
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(43.48),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 447,
            child: Container(
              width: 390,
              height: 403,
              decoration: ShapeDecoration(
                color: Color(0xFF141414),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          Positioned(
            left: 34,
            top: 459,
            child: Text(
              item['name'],
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
          ),
          Positioned(
            left: 34,
            top: 549,
            child: SizedBox(
              width: 318,
              height: 220,
              child: Text(
                item['description'],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
          ),
          Positioned(
            left: 34,
            top: 502,
            child: Text(
              item['location'],
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
          ),
          Positioned(
            left: 34,
            top: 23,
            child: Container(
              width: 24,
              height: 24,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(color: Color(0xFFD9D9D9)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //carousel name
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.black38,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                item['name'],
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
