import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ghost_bank/Providers/transactionhistoryprovider.dart';
import 'package:ghost_bank/Screens/transfer_result.dart';
import 'package:ghost_bank/Services/notifications.dart';
import 'package:ghost_bank/components/homeComponents/quicksendcomponent.dart';
import 'package:ghost_bank/constants/datetimeformat.dart';
import 'package:ghost_bank/constants/formattedamount.dart';
import 'package:ghost_bank/main.dart';

class QuickSendDetails extends ConsumerWidget {
  QuickSendDetails(
      {super.key,
      required this.imgUrl,
      required this.fname,
      required this.lname,
      required this.accountNumber,
      required this.tag});

  final String? imgUrl;
  final String? fname;
  final String? lname;
  final String? accountNumber;
  final List<Map<String, Object>>? tag;

  final TextEditingController quickSendAmount = TextEditingController();

  onNumTapped(number) {
    quickSendAmount.text += number.toString();
  }

  onDelete() {
    quickSendAmount.clear();
  }

  void onDone(WidgetRef ref, int value) {
    final newBalance = ref.read(balanceProvider) - value;
    ref.read(balanceProvider.notifier).update((state) => newBalance);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int notiID = ref.watch(notificationId);
    int balanceAccount = ref.watch(balanceProvider);
    var formattedBalanceAccount = formatter.format(balanceAccount);
    return SingleChildScrollView(
      child: Column(
        children: [
          tag == null
              ? ListTile(
                  leading: CircleAvatar(
                    radius: 27,
                    backgroundColor: const Color.fromARGB(153, 180, 179, 179),
                    child: CircleAvatar(
                      radius: 25,
                      foregroundImage: AssetImage(
                        imgUrl.toString(),
                      ),
                    ),
                  ),
                  title: Text('$fname' ' $lname'),
                  subtitle: Text(accountNumber.toString()),
                )
              : ListTile(
                  leading: CircleAvatar(
                    radius: 27,
                    backgroundColor: const Color.fromARGB(153, 180, 179, 179),
                    child: CircleAvatar(
                      backgroundColor: Colors.orangeAccent,
                      foregroundColor: Colors.black,
                      radius: 25,
                      child: Text(
                        tag![0]['firstname'].toString().substring(0, 1),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 23),
                      ),
                    ),
                  ),
                  title: Text(
                    '${tag![0]['firstname']} ${tag![0]['lastname']}'.toString(),
                    style: const TextStyle(fontSize: 20),
                  ),
                  subtitle: Text(tag![0]['tag'].toString()),
                ),
          const Divider(),
          const SizedBox(
            height: 0,
          ),
          Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: const Padding(
                    padding: EdgeInsets.only(top: 9.0, left: 15),
                    child: Text(
                      '\$',
                      style: TextStyle(fontSize: 50),
                    ),
                  ),
                  suffix: IconButton(
                      onPressed: onDelete,
                      icon: const Icon(Icons.backspace_rounded)),
                  border: InputBorder.none,
                ),
                keyboardType: TextInputType.none,
                controller: quickSendAmount,
                style: const TextStyle(fontSize: 50),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 0,
              ),
              Text(
                'Your balance: $formattedBalanceAccount (Available)',
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () => onNumTapped(1),
                        child: const QuickSendComponent(numPadNumber: '1'),
                      ),
                      InkWell(
                        onTap: () => onNumTapped(2),
                        child: const QuickSendComponent(numPadNumber: '2'),
                      ),
                      InkWell(
                        onTap: () => onNumTapped(3),
                        child: const QuickSendComponent(numPadNumber: '3'),
                      ),
                    ]),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () => onNumTapped(4),
                        child: const QuickSendComponent(numPadNumber: '4'),
                      ),
                      InkWell(
                        onTap: () => onNumTapped(5),
                        child: const QuickSendComponent(numPadNumber: '5'),
                      ),
                      InkWell(
                        onTap: () => onNumTapped(6),
                        child: const QuickSendComponent(numPadNumber: '6'),
                      ),
                    ]),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () => onNumTapped(7),
                        child: const QuickSendComponent(numPadNumber: '7'),
                      ),
                      InkWell(
                        onTap: () => onNumTapped(8),
                        child: const QuickSendComponent(numPadNumber: '8'),
                      ),
                      InkWell(
                        onTap: () => onNumTapped(9),
                        child: const QuickSendComponent(numPadNumber: '9'),
                      ),
                    ]),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () => onNumTapped(0),
                      child: const QuickSendComponent(numPadNumber: '0'),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ElevatedButton(
                    style: const ButtonStyle(
                        fixedSize: MaterialStatePropertyAll(
                            Size(double.maxFinite, 50)),
                        backgroundColor: MaterialStatePropertyAll(Colors.green),
                        foregroundColor:
                            MaterialStatePropertyAll(Colors.white)),
                    onPressed: () {
                      final newNotiD = notiID + 1;
                      if (int.parse(quickSendAmount.text) > balanceAccount ||
                          balanceAccount == 0 ||
                          int.parse(quickSendAmount.text) == 0) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return const AlertDialog(
                                content: Text.rich(TextSpan(children: [
                                  WidgetSpan(
                                      child: Icon(
                                    Icons.cancel_outlined,
                                    color: Colors.red,
                                  )),
                                  TextSpan(text: ' Insufficient Funds'),
                                ])),
                              );
                            });
                      } else {
                        if (tag == null) {
                          ///////////start
                          Map<dynamic, Object> tHistory = {
                            'title':
                                'Sent \$${quickSendAmount.text} to $fname $lname',
                            'sub_title': DateTime.timestamp().fullDate(),
                            'amount': quickSendAmount.text,
                            'transactionType': 0,
                            'transactionRef':
                                Random(16).nextInt(50000).toString(),
                            'status': 'Successful',
                            'sessionID': 161244344851.toString(),
                            'name': '$fname $lname',
                            'description': 'QuickSend'
                          };
                          onDone(ref, int.parse(quickSendAmount.text));
                          ref
                              .read(transactionHistoryProvider.notifier)
                              .addNewTransactionHistory(tHistory);

                          NotificationService().showNotification(
                              id: ref
                                  .read(notificationId.notifier)
                                  .update((state) => newNotiD),
                              title: 'Transaction Successful',
                              body:
                                  'Sent \$${quickSendAmount.text} to $fname $lname');

                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return TransferResultPage(
                                tag: null,
                                amount: int.parse(quickSendAmount.text),
                                fname: fname.toString(),
                                lname: lname.toString(),
                                transferstatusCode: 1);
                          }));
                        }

                        //////////end

                        else {
                          /////..lfnknedknkegkd
                          Map<dynamic, Object> tHistory = {
                            'title':
                                'Sent \$${quickSendAmount.text} to ${tag![0]['tag']}',
                            'sub_title': DateTime.now().fullDate(),
                            'amount': quickSendAmount.text,
                            'transactionType': 0,
                            'transactionRef':
                                Random(16).nextInt(50000).toString(),
                            'status': 'Successful',
                            'sessionID': 161244344851.toString(),
                            'name':
                                '${tag![0]['firstname'].toString()} ${tag![0]['lastname'].toString()}',
                            'description': 'QuickSend'
                          };
                          onDone(ref, int.parse(quickSendAmount.text));
                          ref
                              .read(transactionHistoryProvider.notifier)
                              .addNewTransactionHistory(tHistory);

                          NotificationService().showNotification(
                              id: 1,
                              title: 'Transaction Successful',
                              body:
                                  'Sent \$${quickSendAmount.text} to ${tag![0]['firstname'].toString()} ${tag![0]['lastname'].toString()}');

                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return TransferResultPage(
                                tag: tag![0]['tag'].toString(),
                                amount: int.parse(quickSendAmount.text),
                                fname: tag![0]['firstname'].toString(),
                                lname: tag![0]['lastname'].toString(),
                                transferstatusCode: 1);
                          }));
                        }
                        /////////////hdhdhdhdj
                      }
                    },
                    child: const Text(
                      'Send',
                      style: TextStyle(fontSize: 27),
                    )),
              )
            ],
          )
        ],
      ),
    );
  }
}
