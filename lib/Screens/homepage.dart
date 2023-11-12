import 'package:flutter/material.dart';
import 'package:ghost_bank/Screens/transactions.dart';
import 'package:ghost_bank/components/homeComponents/buttons.dart';
import 'package:ghost_bank/components/homeComponents/cards.dart';
import 'package:ghost_bank/components/homeComponents/quicksend.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  int timeOfDay = TimeOfDay.now().hour;

  String? time;

  @override
  Widget build(BuildContext context) {
    if (timeOfDay <= 12) {
      time = 'Good Morning!';
    } else {
      if (timeOfDay > 12 || timeOfDay <= 16) {
        time = 'Good Afternoon!';
      }

      if (timeOfDay > 16 || timeOfDay <= 24) {
        time = 'Good Evening!';
      }
    }

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  const InkWell(
                    child: CircleAvatar(
                      backgroundColor: Colors.blueGrey,
                      radius: 25,
                      child: Icon(Icons.person),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Hello @AfricanGhost',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          time.toString(),
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Cardss(),
            const SizedBox(
              height: 20,
            ),
            const ButtonSendnReceive(),
            const SizedBox(
              height: 25,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Quick Send',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text('see all')
              ],
            ),
            const SizedBox(height: 15),
            SizedBox(
              height: 90,
              child: QuickSend(),
            ),
            const SizedBox(
              height: 15,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Recent Transactions'), Text('see all')],
            ),
            const SizedBox(
              height: 15,
            ),
            const Transactions(),
            const SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}
