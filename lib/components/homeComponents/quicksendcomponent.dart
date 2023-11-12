import 'package:flutter/material.dart';

class QuickSendComponent extends StatelessWidget {
  const QuickSendComponent({super.key, required this.numPadNumber});

  final String numPadNumber;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 40,
      backgroundColor: Colors.yellow[200],
      child: Text(
        numPadNumber,
        style: const TextStyle(
            color: Colors.black, fontSize: 33, fontWeight: FontWeight.bold),
      ),
    );
  }
}
