import 'package:flutter/material.dart';

// class CreatePage extends StatelessWidget {
//   final Color color;

//   CreatePage(this.color);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: color,
//     );
//   }
// }

import 'package:flutter/material.dart';

class CreatePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CreatePageState();
  }
}

class _CreatePageState extends State<CreatePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Create something here."),
    );
  }
}
