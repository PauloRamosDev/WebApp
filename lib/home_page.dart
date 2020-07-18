import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Container(
              decoration: new BoxDecoration(color: Colors.grey.withOpacity(0.1)),
              child: body(),
            ),
          ),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://fia.com.br/blog/wp-content/uploads/2018/10/gestao-de-projetos-o-que-e-guia-qual-importancia-PMI-730x518.jpg'),
                  fit: BoxFit.fill))),
    );
  }
}

body() {
  return SingleChildScrollView(
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            runSpacing: 10,
            spacing: 10,
            children: [
              Container(
                color: Colors.blue.withOpacity(0.8),
                height: 200,
                width: 400,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.notifications_active,
                      size: 80,
                      color: Colors.white,
                    ),
                    Text(
                      'Notificações'.toUpperCase(),
                      textScaleFactor: 2.5,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.lightBlueAccent.withOpacity(0.8),
                height: 200,
                width: 400,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.phone,
                      size: 80,
                      color: Colors.white,
                    ),
                    Text(
                      'Fale conosco'.toUpperCase(),
                      textScaleFactor: 2.5,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            miniCard(Icons.lightbulb_outline, '13', 'Projetos'),
            miniCard(Icons.people, '300', 'Funcionarios'),
            miniCard(Icons.home, '30', 'Bases'),
            miniCard(Icons.work, '200', 'Clientes'),
            miniCard(Icons.verified_user, '1.0.1', 'Beta')
          ],
        ),
        Container(
          margin: EdgeInsets.all(16),
          color: Colors.white54,
          padding: EdgeInsets.all(16),
          child: Text(
            'Where does it come from?  Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.',
            textScaleFactor: 1.5,
            textAlign: TextAlign.justify,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )
      ],
    ),
  );
}

miniCard(iconData, data, label) {
  return Card(
    child: Container(
      height: 100,
      width: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData,
            size: 30,
          ),
          Text(
            data,
            textScaleFactor: 2,
          ),
          Text(
            label,
            textScaleFactor: 0.7,
          )
        ],
      ),
    ),
  );
}
