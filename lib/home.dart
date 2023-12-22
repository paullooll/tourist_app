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
      home: ListView(children: [
        MyHomePage(),
      ]),
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
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: NetworkImage(
                  "https://images.unsplash.com/photo-1497250681960-ef046c08a56e?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Z3JlZW4lMjBsZWF2ZXMlMjBiYWNrZ3JvdW5kfGVufDB8fDB8fHww"),
              fit: BoxFit.cover,
            )),
            child: data.isNotEmpty
                ? Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: CarouselSlider(
                          items: buildCarouselItems(),
                          options: CarouselOptions(
                            height: MediaQuery.of(context).size.height,
                            aspectRatio: 16 / 9,
                            viewportFraction: 1,
                            initialPage: 1,
                            enableInfiniteScroll: true,
                            reverse: false,
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 3),
                            autoPlayAnimationDuration:
                                const Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: true,
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                      ),
                    ),
                  )
                : const Center(child: CircularProgressIndicator())));
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
      //bg
      child: Container(
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 390,
                height: 750,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3499999940395355),
                ),
              ),
            ),
            Positioned(
              left: 25,
              top: 240,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 300,
                        height: 400,
                        decoration: ShapeDecoration(
                          image: DecorationImage(
                            image: NetworkImage(item['imageurl']),
                            fit: BoxFit.fill,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 80),
                    Positioned(
                      left: 13.69,
                      top: 398.58,
                      child: Container(
                        constraints: const BoxConstraints(
                          maxWidth: 250.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['name'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 29.94,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //logo
            Positioned(
              left: 77,
              right: null,
              top: 15,
              child: Container(
                width: 195,
                height: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://s3-alpha-sig.figma.com/img/b67d/69b9/fd992e59ffdb1913ebd07aa1839dae77?Expires=1703462400&Signature=Bg6dikjave338xtqincRxgyX82hFhQZxNRoW5yhV0paLcBYRkSjvOvzFDaeqzultNaalfgY8DSp6N0KHDfcHvpK0PkRHYJBCHgqNvqqUpdj5ZP6wm5zOYNcGX6st6qsOP317l5nObmPOwVEGCjub27YcfvBO6v1~nR-k32WNdLwhRvdb0KG9Umu4Ta7XuAIzGHcety05AGJiQafbx14bQh8Mo9tBvQPyIaaQrao4rKWIxRdnUBPCzuZw5dezktydeUdUZCwRdreQiz4BxT3K4X01JhEFM9PKyYrAUTAw63f72rkqhCGfj2xq91slSEFgK~PYBjZ8-5sHlnw11Rryvg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"),
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

  const TouristSpotDetails({Key? key, required this.spotData})
      : super(key: key);

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
          height: 1000,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(color: Color(0xFF141414)),
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
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 447,
                child: Container(
                  width: 360,
                  height: 440,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        filterQuality: FilterQuality.low,
                        image: NetworkImage(spotData['imageurl']),
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.9), BlendMode.multiply),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              Positioned(
                left: 20,
                top: 459,
                child: Text(
                  spotData['name'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
              const SizedBox(width: 100),
              Positioned(
                left: 20,
                top: 549,
                child: SizedBox(
                  width: 325,
                  height: 500,
                  child: Text(
                    spotData['description'],
                    style: const TextStyle(
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
                left: 20,
                top: 502,
                child: Text(
                  '${spotData['location']} , ${spotData['address']}',
                  style: const TextStyle(
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
