import 'dart:convert';

import 'package:file_picker_cross/file_picker_cross.dart';
import 'package:flutter/material.dart';

class LerArquivoPage extends StatefulWidget {
  @override
  _LerArquivoPageState createState() => _LerArquivoPageState();
}

class _LerArquivoPageState extends State<LerArquivoPage> {
  List<String> buffer = [];

  FilePickerCross filePicker = FilePickerCross();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: lerArquivoTela(),
    );
  }

  lerArquivoTela() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Arquivo'),
        RaisedButton(
          onPressed: () async {
            filePicker.pick().then((value) {
              setState(() {
                var decode = latin1.decode(filePicker.toUint8List());

                var ln = decode.split('\n');

                ln.removeWhere(
                    (element) => element.replaceAll(r';', '').length <= 1);

                buffer = ln.map((e) => e.replaceAll(r'#N/D', '')).toList();
              });
            });
          },
          child: Text('Buscar'),
          color: Colors.blue,
        ),
        Container(
            height: 500,
            child: SingleChildScrollView(
              child: Table(
                children: buffer.map((e) => _criarLinhaTable(e)).toList(),
              ),
//                      child: Text(
//                        'buffer: $buffer',
//                        textAlign: TextAlign.justify,
//                      ),
            )),
      ],
    );
  }

  TableRow _criarLinhaTable(String listDados) {
    return TableRow(
      children: listDados.split(';').map((dados) {
        return Container(
          alignment: Alignment.center,
          child: Text(
            dados,
            style: TextStyle(fontSize: 12.0),
          ),
          padding: EdgeInsets.all(8.0),
        );
      }).toList(),
    );
  }
}
