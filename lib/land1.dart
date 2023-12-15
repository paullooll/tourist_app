import 'package:flutter/material.dart';
import 'package:tourist_spot/land2.dart';

class Land1 extends StatelessWidget {
  const Land1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        body: ListView(children: [
          Iphone13147(),
        ]),
      ),
    );
  }
}

class Iphone13147 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 390,
          height: 844,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: Colors.black),
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
                      image: NetworkImage("https://s3-alpha-sig.figma.com/img/692a/4191/716efad1c9503798644ebce391ae7543?Expires=1703462400&Signature=NOfRO4SkAe~bWk-CeeQv69lnArlI8Rbd0aSsiRnYVpRjvUw~XV5LviLJ43LEog5BPulQP9j2hKlbMMxGtTes-IDVkJbMXbZYWZjWw8AxqNb31KkAZRcif5gFxRqDA-9ddnnXwAlLT3C~F3mh-g56p7Wf8spN0Po5VLyLarXaxbRVoc6qTQO82POamWOtY~WV3mbv4CGJQL6Nxgi0wU88pVgllJdvlreqjZWWOACXjop4enNLHWYlnjZ7~C5MSYBRMuIPLgM-zeFRkXPxtuBnl-y-GLsOrMpNRe5XZpa6oI3-Z3NU0JldqhtJZuLMMeWTRomdMmu9YMApayZiIfqMfg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                child: Opacity(
                  opacity: 0.30,
                  child: Container(
                    width: 390,
                    height: 844,
                    decoration: BoxDecoration(color: Color(0xFF333333)),
                  ),
                ),
              ),
              Positioned(
                left: 31,
                top: 549,
                child: SizedBox(
                  width: 328,
                  height: 135,
                  child: Text(
                    'Explore the beauty of the World!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w800,
                      height: 0,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 289,
                top: 747,
                child: Container(
                  width: 65,
                  height: 61,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 303,
                top: 759,
                child: Container(
                  width: 37,
                  height: 37,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        width: 37,
                        height: 37,
                        child: IconButton(
                          iconSize: 25,
                          icon: const Icon(Icons.arrow_forward_ios, color: Colors.black,),
                          onPressed: () {
                            Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const Land2()),
                            );
                          },
                        ),
                      ),
                    ],
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