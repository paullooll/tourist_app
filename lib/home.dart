import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const TouristSpotApp());
}

class TouristSpotApp extends StatelessWidget {
  const TouristSpotApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
          ? CarouselSlider(
              items: buildCarouselItems(),
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height,
                aspectRatio: 3 / 4,
                enlargeCenterPage: true,
              ),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }

  List<Widget> buildCarouselItems() {
    return data.map((item) {
      return Builder(
        builder: (BuildContext context) {
          return item != null ? buildCarouselCard(item) : Container();
        },
      );
    }).toList();
  }

  Widget buildCarouselCard(item) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TouristSpotDetails(spotData: item),
          ),
        );
      },
      child: Container(
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 390,
                height: 844,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://s3-alpha-sig.figma.com/img/6c76/ec4a/7dd5ce5e94a85f7a57eb57e45a0da502?Expires=1703462400&Signature=VrEaUnhwN7v5C6QGSQQ4iazoadJuthUdgcho0WRtyi5IjgVDCbfpeC6Hfobnxlqq7lUtMgp01WEjfJrcP7xPZO9V8c-X~yajHNDufUjTgWd1vndNRLiJYTPZlCsEBre4OlMynAw1-uhTmrnYOhuX7W1150ZXO-s4dJElZMCw7r1kyu2fEeg~UDgBugSZEZdiG5fxePrthUqFyqbYPCS7LN7ER9A9VhRcmR5I59LJvE5Snd1IYhf0v8C4MzUccidUuW1tcHGlDIdEZze-2et4ei5en3ZRP0MqfU4fSLvbBwpRwpW7SjjIdQewh7zh-WOMLMExGGykv-7aenscBki39w__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 390,
                height: 844,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3499999940395355),
                ),
              ),
            ),
            Positioned(
              left: 63,
              top: 251,
              child: Container(
                width: 273.71,
                height: 465.30,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 273.71,
                        height: 465.30,
                        decoration: ShapeDecoration(
                          image: DecorationImage(
                            image: NetworkImage(item['imageurl']),
                            fit: BoxFit.fill,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.79),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 13.69,
                      top: 398.58,
                      child: Text(
                        item['name'],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 29.94,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 110,
              top: 32,
              child: Container(
                width: 170,
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://s3-alpha-sig.figma.com/img/1744/d250/161d8e1005c7e7eddcf47991b0ca7daa?Expires=1703462400&Signature=Rc~J3JcUTJZ3YA-K5dvGBimrU0DS6o6fPAr4v~Z22wA~FoTnshLBwPS5o7lBhB5xYQ-s6kFhYdkX0yqyxKJ9PoPVYMOb51Vu6akJU7xz3vTQx-bCXxtlFjnIyB9C6uIBbvZHz-NAZJ3Z20bEJkPgTbS00o3qJBx9cQob2OP2qyRAsHsVrZuHWT1hRn5cQuXjJ0GBRSWcg17iUb7qqHVc7ebX53PnhT-pNux0304F1vYjuTMj8EthZ7FzOPxWQOs1~XXImfQDQ2AjXl1uRBcCW49TXvqgRz1065JtUySKoxshu9XbRRLsy7kM7SAA9y8CHgHAXa6-vCJTXG~h2KyZUQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TouristSpotDetails extends StatelessWidget {
  final Map<String, dynamic> spotData;

  const TouristSpotDetails({Key? key, required this.spotData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(spotData['name']),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spot(
              spotData: spotData,
            ),
          ],
        ),
      ),
    );
  }
}

class Spot extends StatelessWidget {
  final Map<String, dynamic> spotData;

  const Spot({Key? key, required this.spotData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
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
                      image: NetworkImage(spotData['imageurl']),
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
                  spotData['name'],
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
                    spotData['description'],
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
                  spotData['location'],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
