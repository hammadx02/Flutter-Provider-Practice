import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/provider/count_provider.dart';

class CountExampleScreen extends StatefulWidget {
  const CountExampleScreen({super.key});

  @override
  State<CountExampleScreen> createState() => _CountExampleScreenState();
}

class _CountExampleScreenState extends State<CountExampleScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    Timer.periodic(Duration(seconds: 0), (timer) {
      countProvider.setCount();
    });
  }

  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Count Screen',
        ),
      ),
      body: Center(child: Consumer<CountProvider>(
        builder: ((context, value, child) {
          return Text(
            countProvider.count.toString(),
            style: const TextStyle(
              fontSize: 50,
            ),
          );
        }),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProvider.setCount();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
