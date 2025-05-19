import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Drawer(
      elevation: 7,
      width: width,
      shape: const RoundedRectangleBorder(),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.teal.shade50,
                          radius: 30,
                          child: Text(
                            'JK',
                            style: TextStyle(
                                fontSize: 20, color: Colors.teal.shade500),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  'Coming Soon',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(width: 10),
                                const Icon(Icons.edit)
                              ],
                            ),
                            const Text(
                              'king9jim6@gmail.com',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const Divider(),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.money,
                          color: Constants.backgroundColor,
                        ),
                        title: const Text('Currency'),
                        trailing: const Text('KES'),
                        onTap: () {},
                      ),
                      const Divider(),
                      ListTile(
                        leading: Icon(Icons.account_balance_wallet_outlined,
                            color: Constants.backgroundColor),
                        title: const Text('Assets'),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () {},
                      ),
                      const Divider(),
                      ListTile(
                        leading: Icon(Icons.swap_horiz,
                            color: Constants.backgroundColor),
                        title: const Text('Wallet Address'),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () {},
                      ),
                      const Divider(),
                      ListTile(
                        leading:
                            Icon(Icons.send, color: Constants.backgroundColor),
                        title: const Text('Contact Support'),
                        trailing: const Icon(Icons.open_in_new),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: Icon(Icons.description_outlined,
                            color: Constants.backgroundColor),
                        title: const Text('Terms and Conditions'),
                        trailing: const Icon(Icons.open_in_new),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: Icon(Icons.security_outlined,
                            color: Constants.backgroundColor),
                        title: const Text('Privacy Policy'),
                        trailing: const Icon(Icons.open_in_new),
                        onTap: () {},
                      ),
                      const Divider(),
                      ListTile(
                        leading: Icon(Icons.smartphone,
                            color: Constants.backgroundColor),
                        title: const Text('App Version'),
                        trailing: const Text('1.0.0+16'),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: Icon(Icons.logout,
                            color: Constants.backgroundColor),
                        title: const Text('Sign out'),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: Icon(Icons.delete_outline,
                            color: Constants.backgroundColor),
                        title: const Text('Delete Account'),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () {},
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              children: [
                                const Text('Rate App'),
                                const SizedBox(width: 10),
                                const Icon(Icons.thumb_up, color: Colors.brown),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
