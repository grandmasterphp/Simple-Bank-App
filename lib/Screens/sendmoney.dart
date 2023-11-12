import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:ghost_bank/Screens/bankdeposit.dart';
import 'package:ghost_bank/components/homeComponents/quicksendinfo.dart';
import 'package:ghost_bank/data/users.dart';

class SendMoneyPage extends StatefulWidget {
  const SendMoneyPage({super.key});

  @override
  State<SendMoneyPage> createState() => _SendMoneyPageState();
}

class _SendMoneyPageState extends State<SendMoneyPage> {
  late String qrCodeDetails;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Send Money',
          style: TextStyle(fontSize: 17),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Select how you may want to send your payment',
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 300,
              child: ListView(
                primary: true,
                shrinkWrap: true,
                children: [
                  const ListTile(
                    style: ListTileStyle.drawer,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        side: BorderSide(color: Colors.white38)),
                    leading: Icon(Icons.person_2),
                    title: Text('Ghost User',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('Send to another ghost user'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => BankDeposit())),
                    child: const ListTile(
                      style: ListTileStyle.drawer,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          side: BorderSide(color: Colors.white38)),
                      leading: Icon(Icons.business),
                      title: Text('Send To A Bank Account',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text('Deposit to a bank account'),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () => scanQRcode(),
                    child: const ListTile(
                      style: ListTileStyle.drawer,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          side: BorderSide(color: Colors.white38)),
                      leading: Icon(Icons.qr_code),
                      title: Text('QR-Code',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text('Scan QR-Code To Pay'),
                    ),
                  )
                ],
              ),
            )
          ],
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

      return showQRCode(result);
    } on PlatformException {
      qrCodeDetails = 'Platform couldn\'t be verified';
    }
  }
}
