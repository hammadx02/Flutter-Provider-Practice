import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/favourite_provider.dart';

class MyFavouriteItemScreen extends StatefulWidget {
  const MyFavouriteItemScreen({super.key});

  @override
  State<MyFavouriteItemScreen> createState() => _MyFavouriteItemScreenState();
}

class _MyFavouriteItemScreenState extends State<MyFavouriteItemScreen> {
  @override
  Widget build(BuildContext context) {
    final favouriteProvider =
        Provider.of<FavouriteItemProvider>(context, listen: false);
    print('build');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Favourite App'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: favouriteProvider.selectedItem.length,
              itemBuilder: (context, index) {
                return Consumer<FavouriteItemProvider>(
                    builder: (context, value, child) {
                  return ListTile(
                    onTap: () {
                      if (value.selectedItem.contains(index)) {
                        value.removeItem(index);
                      } else {
                        value.addItem(index);
                      }
                    },
                    title: Text(
                      // ignore: prefer_interpolation_to_compose_strings
                      'Item ' + index.toString(),
                    ),
                    trailing: Icon(
                      value.selectedItem.contains(index)
                          ? Icons.favorite
                          : Icons.favorite_outline_rounded,
                    ),
                  );
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
