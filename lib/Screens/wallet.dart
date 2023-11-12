import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ghost_bank/components/homeComponents/cards.dart';
import 'package:ghost_bank/components/walletcomponent/accountdetails.dart';
import 'package:ghost_bank/main.dart';

class Wallet extends ConsumerWidget {
  const Wallet({super.key});

  changetoggle(WidgetRef ref, bool value) {
    ref.read(contactlessIsSwitched.notifier).update((state) => value);
  }

  changeOnlinePayment(WidgetRef ref, bool value) {
    ref.read(onlinepaymentSwitch.notifier).update((state) => value);
  }

  changeAtmWithdrawal(WidgetRef ref, bool value) {
    ref.read(atmWithdrawal.notifier).update((state) => value);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var contactlessIsSwitchd = ref.watch(contactlessIsSwitched);
    var onlinepaymentToggle = ref.watch(onlinepaymentSwitch);
    var atmWithdrawalToggle = ref.watch(atmWithdrawal);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Your Cards',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const Text(
              '0 Physical Cards, 1 Virtual Card',
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 12),
            ),
            const SizedBox(
              height: 20,
            ),
            const Align(
              alignment: Alignment.center,
              child: Cardss(),
            ),
            const SizedBox(
              height: 20,
            ),
            const Card(
              color: Colors.red,
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Icon(Icons.calendar_month),
                    Text(
                      ' No Scheduled Payment',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const AccountDetails(),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Card Settings',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            ListView(
              shrinkWrap: true,
              primary: false,
              children: [
                Card(
                  elevation: 0.5,
                  child: ListTile(
                    leading: const Icon(Icons.qr_code_outlined),
                    title: const Text('Contactless Payment'),
                    trailing: Switch(
                      value: contactlessIsSwitchd,
                      onChanged: (value) => changetoggle(ref, value),
                      activeColor: Colors.white,
                      activeTrackColor: Colors.indigoAccent,
                      dragStartBehavior: DragStartBehavior.start,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Card(
                  elevation: 0.5,
                  child: ListTile(
                    leading: const Icon(Icons.qr_code_outlined),
                    title: const Text('Online Payment'),
                    trailing: Switch(
                      value: onlinepaymentToggle,
                      onChanged: (value) => changeOnlinePayment(ref, value),
                      activeColor: Colors.white,
                      activeTrackColor: Colors.indigoAccent,
                      dragStartBehavior: DragStartBehavior.start,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Card(
                  elevation: 0.5,
                  child: ListTile(
                    leading: const Icon(Icons.qr_code_outlined),
                    title: const Text('ATM Withdraws'),
                    trailing: Switch(
                      value: atmWithdrawalToggle,
                      onChanged: (value) => changeAtmWithdrawal(ref, value),
                      activeColor: Colors.white,
                      activeTrackColor: Colors.indigoAccent,
                      dragStartBehavior: DragStartBehavior.start,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
