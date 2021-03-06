import 'package:api_base/view_models/video_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'views/video_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_)=>VideoListProvider()),
        ],
       child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: VideoListScreen()
        )
    );
  }
}

