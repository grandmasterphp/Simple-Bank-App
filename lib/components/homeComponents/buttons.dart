import 'package:flutter/material.dart';
import 'package:ghost_bank/Screens/sendmoney.dart';
import 'package:ghost_bank/Screens/qrcodepayment.dart';

class ButtonSendnReceive extends StatelessWidget {
  const ButtonSendnReceive({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: ElevatedButton.icon(
              style: const ButtonStyle(
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(13)))),
                  elevation: MaterialStatePropertyAll(0),
                  backgroundColor: MaterialStatePropertyAll(
                      Color.fromARGB(255, 250, 189, 78)),
                  padding: MaterialStatePropertyAll(EdgeInsets.all(17))),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const SendMoneyPage();
                }));
              },
              icon: Image.asset(
                'lib/assets/images/send.png',
                color: Colors.black,
                height: 20,
              ),
              label: const Text(
                'Transfer',
                style: TextStyle(color: Colors.black),
              )),
        ),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: ElevatedButton.icon(
              style: const ButtonStyle(
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(13)))),
                  elevation: MaterialStatePropertyAll(0),
                  backgroundColor: MaterialStatePropertyAll(
                      Color.fromARGB(255, 160, 238, 160)),
                  padding: MaterialStatePropertyAll(EdgeInsets.all(17))),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const QrCodePayment();
                }));
              },
              icon: Image.asset(
                'lib/assets/images/receive.png',
                height: 20,
              ),
              label: const Text(
                'Receive',
                style: TextStyle(color: Colors.black),
              )),
        ),
      ],
    );
  }
}
