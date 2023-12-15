import 'package:flutter/material.dart';
import 'package:tourist_spot/home.dart';

class Land2 extends StatelessWidget {
  const Land2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        body: ListView(children: [
          Iphone13148(),
        ]),
      ),
    );
  }
}

class Iphone13148 extends StatelessWidget {
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
                      image: NetworkImage(
                          "https://s3-alpha-sig.figma.com/img/3ef8/c4dd/7d902bb4aac223466a8db8897333a867?Expires=1703462400&Signature=SA3hfv4KKcOew0gWI~4vbG2zb-IpxhPdm07jdjyfkHBG1FVhH88xJ8vk8bsVPvPP9plUeFtDg9GjJH8cyWHZbQ52i8Kj8SPxq12JCoe1lBy4piADaNQU2yMI-5r4dHAZIsEA840qL-1miMV9ysN43TxKtlGWA03448Psdmq6~IRVPJcZIJIXSavKFc7pR6~7vdaU-MlqC7lfvu7mXDIDHEbWkk-2fN-p8GgdDpUCLEdoJawrljHIA8XMOCdGE6OT1fApBlQitCIwoEdIJXlam7wPDr-JQOuqlctxOC6Xkfz7u8F20nCO6lnZnwxJ9KhvAmVGAVWYeQz-~16vLaE7Fg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"),
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
                    'Enjoy your travel experience!',
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
                left: 294,
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
                left: 308,
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
                          icon: const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyHomePage()),
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
