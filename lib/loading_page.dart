import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        body: ListView(children: [
          Iphone13145(),
        ]),
      ),
    );
  }
}

class Iphone13145 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 390,
          height: 844,
          padding: const EdgeInsets.only(top: 353, bottom: 310),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: Colors.black),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 250,
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://s3-alpha-sig.figma.com/img/b67d/69b9/fd992e59ffdb1913ebd07aa1839dae77?Expires=1703462400&Signature=Bg6dikjave338xtqincRxgyX82hFhQZxNRoW5yhV0paLcBYRkSjvOvzFDaeqzultNaalfgY8DSp6N0KHDfcHvpK0PkRHYJBCHgqNvqqUpdj5ZP6wm5zOYNcGX6st6qsOP317l5nObmPOwVEGCjub27YcfvBO6v1~nR-k32WNdLwhRvdb0KG9Umu4Ta7XuAIzGHcety05AGJiQafbx14bQh8Mo9tBvQPyIaaQrao4rKWIxRdnUBPCzuZw5dezktydeUdUZCwRdreQiz4BxT3K4X01JhEFM9PKyYrAUTAw63f72rkqhCGfj2xq91slSEFgK~PYBjZ8-5sHlnw11Rryvg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"),
                    fit: BoxFit.cover,
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