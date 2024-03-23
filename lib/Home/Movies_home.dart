import 'package:flutter/material.dart';
import 'package:movieapp/APis/APi_Manager.dart';
import 'package:movieapp/Home/Home_ScreenDeatils.dart';
import 'package:movieapp/Models/Movies.dart';
import 'package:movieapp/Theme.dart';

class Movies_Home extends StatefulWidget {
  @override
  State<Movies_Home> createState() => _Movies_HomeState();
}

class _Movies_HomeState extends State<Movies_Home> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<HeaderResponse>(
        future: Apimanager.FetchDataFromHeader(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Mytheme.whitecolor,
              ),
            );
          } else if (snapshot.hasError) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: AlertDialog(
                    content: Text(
                      "SomethingWentWrong",
                      style: TextStyle(color: Mytheme.blackcolor),
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Apimanager.FetchDataFromHeader();
                            setState(() {});
                          },
                          child: Text(
                            "Try Again",
                            style: TextStyle(color: Mytheme.blackcolor),
                          ))
                    ],
                  ),
                ),
              ],
            );
          }
          /*else if (snapshot.data?.success != "true") {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: AlertDialog(
                    content: Text(
                      snapshot.data!.status_message!,
                      style: TextStyle(color: Mytheme.blackcolor),
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Apimanager.FetchDataFromHeader();
                            setState(() {});
                          },
                          child: Text(
                            "Try Again",
                            style: TextStyle(color: Mytheme.blackcolor),
                          ))
                    ],
                  ),
                ),
              ],
            );
          }
          */
          var sourceList = snapshot.data?.results ?? [];
          return ListView.builder(
            itemBuilder: (context, index) {
              return HomeScreenDetails(results: sourceList[index]);
            },
            itemCount: sourceList.length,
          );
        });
  }
}
