import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/provider/slider_provider.dart';

class SliderExample extends StatefulWidget {
  const SliderExample({super.key});

  @override
  State<SliderExample> createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {
  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<SliderProvider>(context, listen: false);
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider Example'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<SliderProvider>(
            builder: (context, value, child) {
              return Slider(
                min: 0,
                max: 1,
                value: value.value,
                onChanged: (val) {
                  value.setValue(val);
                },
              );
            },
          ),
          Consumer<SliderProvider>(
            builder: (context, value, child) {
              return Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.green.withOpacity(value.value),
                      height: 100,
                      child: const Center(
                        child: Text('Container 1'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.red.withOpacity(value.value),
                      height: 100,
                      child: const Center(
                        child: Text('Container 2'),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
