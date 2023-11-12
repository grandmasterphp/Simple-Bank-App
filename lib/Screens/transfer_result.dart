import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TransferResultPage extends ConsumerStatefulWidget {
  const TransferResultPage(
      {super.key,
      required this.amount,
      required this.fname,
      required this.lname,
      required this.transferstatusCode,
      required this.tag});

  final int amount;
  final String? fname;
  final String? lname;
  final String? tag;
  final int transferstatusCode;

  @override
  ConsumerState<TransferResultPage> createState() => _TransferResultPageState();
}

class _TransferResultPageState extends ConsumerState<TransferResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset(
              'lib/assets/images/successs.png',
              color: Colors.green,
              height: 120,
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Payment Successful!!',
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              '\$${widget.amount}'.toString(),
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              widget.lname == null
                  ? 'has been sent to ${widget.fname} from your wallet'
                  : 'has been sent to ${widget.fname} '
                      '${widget.lname} from your wallet',
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  style: const ButtonStyle(
                      minimumSize:
                          MaterialStatePropertyAll(Size(double.maxFinite, 50))),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                  child: const Text('Done')),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
