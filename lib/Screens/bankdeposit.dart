import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ghost_bank/Providers/transactionhistoryprovider.dart';
import 'package:ghost_bank/Screens/transfer_result.dart';
import 'package:ghost_bank/Services/notifications.dart';
import 'package:ghost_bank/constants/datetimeformat.dart';
import 'package:ghost_bank/data/banks.dart';
import 'package:ghost_bank/data/users.dart';
import 'package:ghost_bank/main.dart';

class BankDeposit extends ConsumerWidget {
  BankDeposit({super.key});

  final TextEditingController accountNumber = TextEditingController();
  TextEditingController accountName = TextEditingController();
  final TextEditingController depositAmount = TextEditingController();
  final TextEditingController depositNarration = TextEditingController();

  String? dpdown;

  final _formkey = GlobalKey<FormState>();

  void onDone(WidgetRef ref, int value) {
    final newBalance = ref.read(balanceProvider) - value;
    ref.read(balanceProvider.notifier).update((state) => newBalance);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notiID = ref.watch(notificationId);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Send To Bank Account',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: const EdgeInsets.only(top: 60),
            child: Form(
                key: _formkey,
                child: Center(
                  child: Column(
                    children: [
                      const Text(
                        'Fill in the details to make the transfer',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      DropdownButtonFormField(
                        style: const TextStyle(fontSize: 20),
                        value: dpdown,
                        hint: const Text('Select Bank'),
                        decoration: InputDecoration(
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11),
                                borderSide: BorderSide.none)),
                        items: banks.map((e) {
                          return DropdownMenuItem(
                            value: e.toString(),
                            child: Text(e),
                          );
                        }).toList(),
                        onChanged: (val) {
                          dpdown = val.toString();
                          accountName.clear();
                          accountNumber.clear();
                        },
                        validator: (value) {
                          if (value == null || value.toString().isEmpty) {
                            return 'Select Bank';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                          style: const TextStyle(fontSize: 26),
                          keyboardType: TextInputType.number,
                          maxLength: 10,
                          maxLengthEnforcement: MaxLengthEnforcement.enforced,
                          validator: (value) {
                            if (value.toString().isEmpty) {
                              return 'account number is empty';
                            } else {
                              if (value!.length < 10) {
                                return 'Account number must be 10 digits';
                              } else {
                                final searcAccountDetails = user
                                    .where((aCNumber) => aCNumber['acct_no']
                                        .toString()
                                        .contains(accountNumber.text))
                                    .toList();

                                if (searcAccountDetails.isEmpty ||
                                    searcAccountDetails[0]['bankname'] !=
                                        dpdown) {
                                  return 'No Record found';
                                }
                              }
                            }
                            return null;
                          },
                          onChanged: (accountNumbervalue) {
                            if (accountNumbervalue.length == 10) {
                              final searcAccountDetails = user
                                  .where((aCNumber) => aCNumber['acct_no']
                                      .toString()
                                      .contains(accountNumbervalue))
                                  .toList();

                              if (searcAccountDetails.isEmpty ||
                                  searcAccountDetails[0]['bankname'] !=
                                      dpdown) {
                                accountName.text = 'No Record found';
                              } else {
                                accountName.text =
                                    '${searcAccountDetails[0]['firstname']} ${searcAccountDetails[0]['lastname']}';
                              }
                            }
                          },
                          controller: accountNumber,
                          decoration: const InputDecoration(
                              labelText: 'Account Number',
                              filled: true,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(11))))),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                          enabled: false,
                          style: const TextStyle(fontSize: 26),
                          validator: (value) {
                            if (value.toString().isEmpty) {
                              return 'account name is empty';
                            }
                            return null;
                          },
                          controller: accountName,
                          decoration: const InputDecoration(
                              labelText: 'Account Name',
                              filled: true,
                              fillColor: Colors.white10,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(11))))),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                          style: const TextStyle(fontSize: 26),
                          validator: (value) {
                            if (value == null || value.toString().isEmpty) {
                              return 'Amount is empty';
                            } else {
                              if (int.parse(value) < 5) {
                                return 'Minimum amount to send is \$5';
                              }
                            }
                            return null;
                          },
                          controller: depositAmount,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              prefixIcon: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  '\$',
                                  style: TextStyle(
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                              labelText: 'Amount',
                              filled: true,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(11))))),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                          controller: depositNarration,
                          decoration: const InputDecoration(
                              labelText: 'Narration',
                              filled: true,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(11))))),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            final newNotiD = notiID + 1;
                            if (_formkey.currentState!.validate()) {
                              Map<dynamic, Object> tHistory = {
                                'title':
                                    'Sent \$${depositAmount.text} to ${accountName.text}',
                                'sub_title': DateTime.now().fullDate(),
                                'amount': depositAmount.text,
                                'transactionType': 0,
                                'transactionRef':
                                    Random(16).nextInt(50000).toString(),
                                'status': 'Successful',
                                'sessionID': 161244344851.toString(),
                                'name': accountName.text,
                                'description': depositNarration.text
                              };
                              onDone(ref, int.parse(depositAmount.text));
                              ref
                                  .read(transactionHistoryProvider.notifier)
                                  .addNewTransactionHistory(tHistory);

                              NotificationService().showNotification(
                                  id: ref
                                      .read(notificationId.notifier)
                                      .update((state) => newNotiD),
                                  title: 'Transaction Successful',
                                  body:
                                      'Sent \$${depositAmount.text} to ${accountName.text}');

                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return TransferResultPage(
                                    tag: null,
                                    amount: int.parse(depositAmount.text),
                                    fname: accountName.text,
                                    lname: null,
                                    transferstatusCode: 1);
                              }));
                            }
                          },
                          style: ButtonStyle(
                              minimumSize: MaterialStatePropertyAll(
                                  Size(MediaQuery.of(context).size.width, 60))),
                          child: const Text('Transfer'))
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
