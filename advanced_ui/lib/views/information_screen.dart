import 'package:advanced_ui/resources/widgets/button_widget.dart';
import 'package:advanced_ui/resources/widgets/cover_image_widget.dart';
import 'package:advanced_ui/resources/widgets/description_widget.dart';
import 'package:advanced_ui/resources/widgets/title_widget.dart';
import 'package:flutter/material.dart';
class InformationScreen extends StatefulWidget {
  const InformationScreen({Key? key}) : super(key: key);

  @override
  _InformationScreenState createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            // cover image
            CoverImageWidget(imageUrl: "assets/images/lake.jpeg"),
            // title Widget
            TitleWidget(
                title: "Oschinen Lake Campground",
                address: "Kandersteg, Swizerland",
                rate: 41),

            // buttons widget
            Container(
              padding: const EdgeInsets.only(right: 30, left: 30, top: 30),
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: ButtonWidget(
                          onPressed: (){
                            print("Calling");
                          },
                          iconData: Icons.call,
                          text: "call"),),
                  Expanded(
                      flex: 1,
                      child: ButtonWidget(
                          onPressed: (){
                            print("routting");
                          },
                          iconData: Icons.navigation,
                          text: "route"),),
                  Expanded(
                      flex: 1,
                      child: ButtonWidget(
                          onPressed: (){
                            print("shareing");
                          },
                          iconData: Icons.share,
                          text: "share"),),
                ],
              ),
            ),
            // description
            DescriptionWidget(text: "Oeschinen Lake or Oeschinensee as the Swiss call it, is one of the best lakes in Switzerland, if not on the earth."
                " Oeschinen Lake lies in the Kandertal valley in Bernese Oberland region of Switzerland."
                " If you love swimming, rowing, fishing and a barbeque by the lake, or just the breathtaking Alpine views, then this place must be on top of your Switzerland Bucketlist."
                " Moreover, The mountains and valleys around here are an open invitation to serious hikers!")
          ],

        ),
      ),
    );
  }
}
