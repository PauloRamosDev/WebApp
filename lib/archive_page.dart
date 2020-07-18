import 'package:WebApp/archive_org_api.dart';
import 'package:WebApp/detais_page.dart';
import 'package:flutter/material.dart';

class ArchivePage extends StatefulWidget {
  @override
  _ArchivePageState createState() => _ArchivePageState();
}

class _ArchivePageState extends State<ArchivePage> {
  List<Widget> busca;
  var controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListTile(
            trailing: IconButton(
              icon: Icon(Icons.search),
              onPressed: () async {
                if (controller.text.isNotEmpty) {
                  var api = ArchiveorgApi();
                  var busca = await api.getResult(controller.text);

                  if (busca != null)
                    setState(() {
                      this.busca = busca
                          .map((e) => ListTile(
                                onTap: () {
                                  api.getDetails(e.identifier).then((value) {
                                    if (value != null)
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (ctx) =>
                                                  DetaisPage(map: value)));
                                  });
                                },
                                title: Text(e.identifier.toString()),
                                subtitle: Text(e.mediatype),
                              ))
                          .toList();
                    });
                }
              },
            ),
            subtitle: TextFormField(
              controller: controller,
            ),
          ),
          Expanded(
            child: ListView(
              children: busca ?? [Container()],
              shrinkWrap: true,
            ),
          )
        ],
      ),
    );
  }
}
