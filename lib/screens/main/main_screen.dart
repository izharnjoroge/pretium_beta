import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';
import 'finance_page.dart';
import 'home_screen.dart';
import 'transactions_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const FinancePage(),
    const TransactionsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _showFinanceModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Wrap(
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.arrow_downward),
              title: const Text('Deposit'),
              subtitle: const Text('Send crypto to your Pretium wallet'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.add),
              title: const Text('Fund account'),
              subtitle: const Text('Buy crypto with mobile money'),
              onTap: () {
                Navigator.pop(context);
                Get.toNamed('/fund_account');
              },
            ),
            ListTile(
              leading: const Icon(Icons.trending_up),
              title: const Text('Withdraw'),
              subtitle: const Text('Transfer crypto from your Pretium wallet'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(25.0)),
        child: SizedBox(
          height: 80.0,
          child: BottomNavigationBar(
            elevation: 5,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_balance_wallet,
                  size: 25,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: CircleAvatar(
                  backgroundColor: Constants.backgroundColor,
                  child: Icon(
                    Icons.qr_code_rounded,
                    size: 35,
                    color: Colors.white,
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.list_alt,
                  size: 25,
                ),
                label: '',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Constants.backgroundColor,
            unselectedItemColor: Colors.grey,
            onTap: (index) {
              if (index == 1) {
                _showFinanceModal(context);
              } else {
                _onItemTapped(index);
              }
            },
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
          ),
        ),
      ),
    );
  }
}
