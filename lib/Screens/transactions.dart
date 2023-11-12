import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ghost_bank/Providers/transactionhistoryprovider.dart';
import 'package:share_plus/share_plus.dart';

class Transactions extends ConsumerWidget {
  const Transactions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactionnn = ref.watch(transactionHistoryProvider) as List;
    return SizedBox(
      child: ListView.builder(
          primary: false,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: transactionnn.length,
          itemBuilder: (context, index) {
            final sortedTransactions = transactionnn.reversed.toList();
            final transactionData = sortedTransactions[index];
            return InkWell(
              onTap: () => showModalBottomSheet(
                  isScrollControlled: true,
                  showDragHandle: true,
                  elevation: 20,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25))),
                  context: context,
                  builder: (ctxx) {
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          DataTable(columns: const [
                            DataColumn(label: Text('Transaction Details')),
                            DataColumn(label: Text(''))
                          ], rows: [
                            DataRow(cells: [
                              DataCell(transactionData['transactionType'] == 0
                                  ? const Text('Receiver')
                                  : const Text('Sender')),
                              DataCell(Text('${transactionData['name']}')),
                            ]),
                            DataRow(cells: [
                              const DataCell(Text('Amount')),
                              DataCell(Text(
                                '\$${transactionData['amount']}',
                                style: TextStyle(
                                    color:
                                        transactionData['transactionType'] == 0
                                            ? Colors.red
                                            : Colors.green,
                                    fontWeight: FontWeight.bold),
                              ))
                            ]),
                            DataRow(cells: [
                              const DataCell(Text('Transaction Ref')),
                              DataCell(Text(
                                '${transactionData['transactionRef']}',
                                style: const TextStyle(
                                    overflow: TextOverflow.ellipsis),
                              ))
                            ]),
                            DataRow(cells: [
                              const DataCell(Text('Date')),
                              DataCell(
                                  Text(transactionData['sub_title'].toString()))
                            ]),
                            DataRow(cells: [
                              const DataCell(Text('Status')),
                              DataCell(
                                  Text(transactionData['status'].toString()))
                            ]),
                            DataRow(cells: [
                              const DataCell(Text('Session ID')),
                              DataCell(
                                  Text(transactionData['sessionID'].toString()))
                            ]),
                            DataRow(cells: [
                              const DataCell(Text('Transaction Description')),
                              DataCell(Text(
                                  transactionData['description'].toString()))
                            ])
                          ]),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: ElevatedButton.icon(
                                style: const ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        Color.fromARGB(255, 137, 137, 3)),
                                    padding: MaterialStatePropertyAll(
                                        EdgeInsets.all(17))),
                                onPressed: () {
                                  Share.share('Transaction Receipt');
                                },
                                icon: const Icon(
                                  Icons.share,
                                  size: 16,
                                ),
                                label: const Text('Share')),
                          )
                        ],
                      ),
                    );
                  }),
              child: ListTile(
                leadingAndTrailingTextStyle:
                    const TextStyle(overflow: TextOverflow.ellipsis),
                style: ListTileStyle.drawer,
                dense: true,
                contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                horizontalTitleGap: 15,
                leading: transactionData['transactionType'] == 0
                    ? Image.asset(
                        'lib/assets/images/card.png',
                        color: Colors.red,
                        height: 30,
                      )
                    : Image.asset(
                        'lib/assets/images/receive-money (2).png',
                        color: Colors.green,
                        height: 30,
                      ),
                title: Text(
                  transactionData['title'].toString(),
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                subtitle: Text(transactionData['sub_title'].toString()),
                trailing: Text(
                  transactionData['transactionType'] == 0
                      ? '-\$${transactionData['amount']}'
                      : '+\$${transactionData['amount']}',
                  style: TextStyle(
                      color: transactionData['transactionType'] == 0
                          ? Colors.red
                          : Colors.green,
                      fontWeight: FontWeight.bold),
                ),
              ),
            );
          }),
    );
  }
}
