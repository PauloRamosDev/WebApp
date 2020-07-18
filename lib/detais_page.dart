import 'package:WebApp/video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetaisPage extends StatelessWidget {
  //base url
  //files
  final Map map;

  const DetaisPage({Key key, this.map}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var files = map['files'] as List;

    return Scaffold(
        body: ListView(
      children: files
          .map((e) => ListTile(
                title: Text(e.toString()),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (ctx) => VideoApp(
                              link: map['base'] + e.toString(),
                            ))),
              ))
          .toList(),
    ));
  }
}
