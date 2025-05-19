import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class FundAccountScreen extends StatelessWidget {
  const FundAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const walletAddress = '0x6a6252...3f6e7311';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Address'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: QrImageView(
                    data: walletAddress,
                    version: QrVersions.auto,
                    size: 200.0,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(walletAddress),
                      const Icon(Icons.copy_outlined),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Only transfer USDT, USDC or cUSD on the CELO network. Transfer of any other asset may result in loss of funds.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black54),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
