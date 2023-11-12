import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Bank of Ghost',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        IconButton(
          onPressed: () {
            showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                isDismissible: true,
                enableDrag: true,
                context: (context),
                builder: (ctx) {
                  return const SizedBox(
                    height: 600,
                    child: Center(
                      child: Text('Notification'),
                    ),
                  );
                });
          },
          icon: Badge(
              label: const Text('3'),
              child: Image.asset(
                'lib/assets/images/notification.png',
                height: 25,
              )),
        )
      ],
    );
  }
}
