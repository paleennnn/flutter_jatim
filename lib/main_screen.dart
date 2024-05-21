import 'package:flutter/material.dart';
import 'package:flutter_layout/detail_screen.dart';
import 'package:flutter_layout/model/city.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kota/Kabupaten di Jawa Timur'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final City city = cityList[index];
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailScreen(city: city);
              }));
            },
            child: ListItem(city),
          );
        },
        itemCount: cityList.length,
      ),
    );
  }
}

Widget ListItem(City city) {
  return Card(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget> [
        Expanded(
          flex: 1,
          child: Image(
            image: AssetImage(city.imageAsset),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  city.name,
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(height: 10),
                Text(city.location),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}