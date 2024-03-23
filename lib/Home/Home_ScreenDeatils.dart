import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:movieapp/Models/Movies.dart';
import 'package:movieapp/Theme.dart';

class HomeScreenDetails extends StatelessWidget {
  HomeScreenDetails({super.key, required this.results});

  Results results;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Mytheme.Graycolor,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Movies",
                style: TextStyle(fontSize: 22, color: Mytheme.Goldcolor),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "App",
                style: TextStyle(fontSize: 22, color: Mytheme.whitecolor),
              ),
            ],
          )),
      body: Container(
        child: Column(children: [
          CarouselSlider(
            items: [
              SizedBox(
                height: size.height,
                child: ClipRRect(
                  child: Image.network(results.posterPath ?? ""),
                ),
              )
            ],
            options: CarouselOptions(
              height: 200,
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              scrollDirection: Axis.horizontal,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            color: Mytheme.Graycolor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "New Releases  ",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Row(
                  children: [
                    SizedBox(
                      height: size.height,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 50,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.all(
                                8.0), // Adjust spacing between images
                            child: Image.network(
                              results.posterPath ?? "",
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            color: Mytheme.Graycolor,
            child: Column(
              children: [
                Text(
                  "Recomended  ",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Row(
                  children: [
                    SizedBox(
                      height: size.height,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 50,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                              padding: EdgeInsets.all(
                                  22), // Adjust spacing between images
                              child: Column(
                                children: [
                                  Image.network(
                                    results.posterPath ??
                                        " ", // URL of your image
                                    width: 150,
                                    height: 90,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Mytheme.Goldcolor,
                                      ),
                                      Text(
                                        '$results.voteAverage ?? " "',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      )
                                    ],
                                  ),
                                  Text(
                                    results.originalTitle ?? " ",
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                    textAlign: TextAlign.start,
                                  )
                                ],
                              ));
                        },
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
