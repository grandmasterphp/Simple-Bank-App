import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:ghost_bank/components/homeComponents/quicksendinfo.dart';
import 'package:ghost_bank/data/users.dart';

class Scan extends StatefulWidget {
  const Scan({super.key});

  @override
  State<Scan> createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  showQRCode(List<Map<String, Object>> qrDetails) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: QuickSendDetails(
                imgUrl: null,
                fname: null,
                lname: null,
                accountNumber: null,
                tag: qrDetails),
          );
        });
  }

  late String qrCodeDetails;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.photo_camera_outlined,
                        color: Color.fromARGB(255, 168, 133, 5),
                        weight: 700,
                        size: 30,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Please move your camera over another device\'s screen',
                    style: TextStyle(
                        color: Colors.black,
                        overflow: TextOverflow.visible,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(),
                  Image.asset(
                    'lib/assets/images/qr-code.png',
                    height: MediaQuery.of(context).size.height * 0.29,
                  ),
                  const Spacer(),
                  OutlinedButton(
                      style: const ButtonStyle(
                          padding: MaterialStatePropertyAll(
                              EdgeInsets.symmetric(horizontal: 70)),
                          side: MaterialStatePropertyAll(BorderSide(
                              color: Color.fromARGB(255, 168, 133, 5)))),
                      onPressed: () => scanQRcode(),
                      child: const Text(
                        'Scan QR Code',
                        style:
                            TextStyle(color: Color.fromARGB(255, 168, 133, 5)),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> scanQRcode() async {
    try {
      qrCodeDetails = await FlutterBarcodeScanner.scanBarcode(
          '#fcc234', 'Cancel', false, ScanMode.QR);

      final result = user
          .where((usertag) => usertag["tag"].toString().contains(qrCodeDetails))
          .toList();

      if (result.isEmpty) {
        null;
      } else {
        return showQRCode(result);
      }
    } on PlatformException {
      qrCodeDetails = 'Platform couldn\'t be verified';
    }
  }
}
