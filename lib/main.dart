import 'package:flutter/material.dart';
import 'package:flutter_show_images/widgets/image_with_label.dart';

import 'enums/image_type.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final appBar = AppBar(
      title: Text('Flutter App'),
    );

    final appBarHeight = appBar.preferredSize.height;
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final usedHeight = deviceHeight - appBarHeight - statusBarHeight;
    return Scaffold(
        appBar: appBar,
        body: Padding(
          padding:  EdgeInsets.all( usedHeight*0.01),
          child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: usedHeight * 0.48,
                  child: ImageWithLabel("local image", ImageType.LOCAL,
                      "assets/paris.jpg")),
              SizedBox(height: usedHeight*0.02,),

              Container(
                  height: usedHeight * 0.48,
                  child: ImageWithLabel("network image", ImageType.NETWORK,
                      "https://images.unsplash.com/photo-1499856871958-5b9627545d1a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=707&q=80"))
            ],
          )),
        ));
  }
}
