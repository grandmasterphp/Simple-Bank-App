import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ghost_bank/constants/formattedamount.dart';
import 'package:ghost_bank/main.dart';
import 'package:flutter_credit_card_ui/flutter_credit_card_ui.dart';

class Cardss extends ConsumerWidget {
  const Cardss({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final balance = ref.watch(balanceProvider);
    var formattedBalance = formatter.format(balance);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CreditCardWidget(
          color: const Color.fromARGB(255, 3, 95, 6),
          gradient: const LinearGradient(colors: [
            Color.fromARGB(255, 3, 95, 6),
            Color.fromARGB(255, 28, 164, 33),
            Color.fromARGB(255, 3, 95, 6)
          ]),
          cardNumber: '4356 **** **** 0322',
          cardHolder: 'Damien Somto',
          cardExpiration: "7/28",
          cardtype: CardType.masterCard,
          cvvText: '327',
          accountBalance: formattedBalance,
        )
      ],
    );
  }
}
