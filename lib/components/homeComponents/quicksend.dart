import 'package:flutter/material.dart';
import 'package:ghost_bank/components/homeComponents/quicksendinfo.dart';
import 'package:ghost_bank/data/users.dart';

class QuickSend extends StatelessWidget {
  QuickSend({super.key});
  final List<Map<String, dynamic>> beneficiary = user;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: user.length,
      itemBuilder: (context, index) {
        final data = user[index];
        return Row(
          children: [
            Column(
              children: [
                InkWell(
                  onTap: () => showModalBottomSheet(
                      useSafeArea: true,
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(40))),
                      elevation: 1,
                      isScrollControlled: true,
                      context: context,
                      builder: (ctxx) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 0.0),
                          child: QuickSendDetails(
                            tag: null,
                            imgUrl: data['imgUrl'].toString(),
                            fname: data['firstname'].toString(),
                            lname: data['lastname'].toString(),
                            accountNumber: data['acct_no'].toString(),
                          ),
                        );
                      }),
                  child: CircleAvatar(
                    radius: 27,
                    backgroundColor: const Color.fromARGB(153, 180, 179, 179),
                    child: CircleAvatar(
                      radius: 25,
                      foregroundImage: AssetImage(
                        data['imgUrl'].toString(),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                Text(data['firstname'].toString()),
              ],
            ),
            const SizedBox(
              width: 10,
            )
          ],
        );
      },
    );
  }
}
