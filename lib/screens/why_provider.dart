import 'dart:async';

import 'package:flutter/material.dart';

class WhyProviderScreen extends StatefulWidget {
  const WhyProviderScreen({super.key});

  @override
  State<WhyProviderScreen> createState() => _WhyProviderScreenState();
}

class _WhyProviderScreenState extends State<WhyProviderScreen> {
  int count = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      count++;
      print(count);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Why Provider'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              // ignore: prefer_interpolation_to_compose_strings
              DateTime.now().hour.toString() +
                  ':' +
                  DateTime.now().minute.toString() +
                  ':' +
                  DateTime.now().second.toString(),
              style: const TextStyle(fontSize: 25),
            ),
          ),
          Center(
            child: Text(
              count.toString(),
              style: const TextStyle(fontSize: 50),
            ),
          ),
        ],
      ),
    );
  }
}
