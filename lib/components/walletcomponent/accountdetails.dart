import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ghost_bank/constants/formattedamount.dart';
import 'package:ghost_bank/main.dart';

class AccountDetails extends ConsumerWidget {
  const AccountDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lastStatementBalance = formatter.format(ref.watch(balanceProvider));
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 12),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Account Status:',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text(
                  'Active',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.green),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Due Date:',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text(
                  'Dec 24, 2028',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Minimum Payment:',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text(
                  '\$164.27',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Last Statement Balance:',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text(
                  lastStatementBalance.toString(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
