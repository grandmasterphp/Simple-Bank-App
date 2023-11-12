import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ghost_bank/constants/themeprovider.dart';

class Account extends ConsumerWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkmode = ref.watch(darkmodeNotifierProvider);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 53,
                    child: CircleAvatar(
                      radius: 50,
                      foregroundImage: AssetImage('lib/assets/images/ppp4.jpg'),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Damien Somto',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text.rich(TextSpan(
                      text: '@AfricanGhost ',
                      style: TextStyle(fontSize: 14),
                      children: [
                        WidgetSpan(
                            child: Icon(
                          Icons.verified,
                          size: 19,
                        ))
                      ])),
                  SizedBox(
                    height: 15,
                  )
                ],
              ),
            ),
            const ListTile(
              contentPadding: EdgeInsets.all(5),
              horizontalTitleGap: 10,
              leading: Icon(Icons.account_circle),
              title: Text(
                'User Profile',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              subtitle: Text('Change profile image, name or password'),
              trailing: Icon(Icons.keyboard_arrow_right_sharp),
            ),
            const ListTile(
              contentPadding: EdgeInsets.all(5),
              horizontalTitleGap: 10,
              leading: Icon(Icons.category_outlined),
              title: Text(
                'Categories',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              subtitle: Text('Mange categories and add sub-categories'),
              trailing: Icon(Icons.keyboard_arrow_right_sharp),
            ),
            const ListTile(
              contentPadding: EdgeInsets.all(5),
              horizontalTitleGap: 10,
              leading: Icon(Icons.verified),
              title: Text(
                'Accounts',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              subtitle: Text('Manage accounts and subscription'),
              trailing: Icon(Icons.keyboard_arrow_right_sharp),
            ),
            const ListTile(
              contentPadding: EdgeInsets.all(5),
              horizontalTitleGap: 10,
              leading: Icon(Icons.currency_exchange),
              title: Text(
                'Currencies',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              subtitle: Text('Add other curriencies, adjust exchange rate'),
              trailing: Icon(Icons.keyboard_arrow_right_sharp),
            ),
            const ListTile(
              contentPadding: EdgeInsets.all(5),
              horizontalTitleGap: 10,
              leading: Icon(Icons.security),
              title: Text(
                'Security',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              subtitle: Text('Protect your app with PIN or Fingerprint'),
              trailing: Icon(Icons.keyboard_arrow_right_sharp),
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(5),
              horizontalTitleGap: 10,
              leading: const Icon(Icons.dark_mode),
              title: const Text(
                'Change to DarkMode',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              trailing: Switch(
                  value: darkmode,
                  onChanged: (val) {
                    ref.read(darkmodeNotifierProvider.notifier).toggle();
                  }),
            ),
            const SizedBox(
              height: 15,
            ),
            TextButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.redAccent),
                    foregroundColor: MaterialStatePropertyAll(Colors.white)),
                onPressed: () {},
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Text('Logout'),
                ))
          ],
        ),
      ),
    );
  }
}
