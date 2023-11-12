import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ghost_bank/constants/app_theme.dart';
import 'package:ghost_bank/constants/themeprovider.dart';
import 'package:ghost_bank/home.dart';

final balanceProvider = StateProvider((ref) => 1700);
final contactlessIsSwitched = StateProvider((ref) => true);
final onlinepaymentSwitch = StateProvider((ref) => true);
final atmWithdrawal = StateProvider((ref) => false);
final notificationId = StateProvider((ref) => 1);

void main() {
  runApp(const ProviderScope(
    child: Theming(),
  ));
}

class Theming extends ConsumerWidget {
  const Theming({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkMode = ref.watch(darkmodeNotifierProvider);
    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}
