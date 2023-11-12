import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';

class QrCodePayment extends StatelessWidget {
  const QrCodePayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My QR Code',
          style: TextStyle(fontSize: 17),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 198, 195, 195),
                      radius: 53,
                      child: CircleAvatar(
                        radius: 50,
                        foregroundImage:
                            AssetImage('lib/assets/images/ppp4.jpg'),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Damien Somto',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 168, 133, 5)),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text.rich(TextSpan(
                        text: '@AfricanGhost ',
                        style: TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 168, 133, 5)),
                        children: [
                          WidgetSpan(
                              child: Icon(
                            Icons.verified,
                            size: 19,
                            color: Color.fromARGB(255, 168, 133, 5),
                          ))
                        ])),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: BarcodeWidget(
                    data: '@AfricanGhost',
                    barcode: Barcode.qrCode(),
                    height: 200,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                OutlinedButton(
                    style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(
                            EdgeInsets.symmetric(horizontal: 40, vertical: 18)),
                        foregroundColor: MaterialStatePropertyAll(
                            Color.fromARGB(255, 198, 156, 5)),
                        side: MaterialStatePropertyAll(BorderSide(
                            color: Color.fromARGB(255, 168, 133, 5)))),
                    onPressed: () {},
                    child: const Text.rich(TextSpan(text: 'Share my QR Code'))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
