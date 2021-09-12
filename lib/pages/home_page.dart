import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test_2_5/main.dart';
import 'package:flutter_test_2_5/pages/second_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _images = [
    'https://www.tooltyp.com/wp-content/uploads/2014/10/1900x920-8-beneficios-de-usar-imagenes-en-nuestros-sitios-web.jpg',
    'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg',
    'https://neliosoftware.com/es/wp-content/uploads/sites/3/2018/07/aziz-acharki-549137-unsplash-1200x775.jpg',
    'https://www.tooltyp.com/wp-content/uploads/2014/10/1900x920-8-beneficios-de-usar-imagenes-en-nuestros-sitios-web.jpg',
    'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg',
    'https://neliosoftware.com/es/wp-content/uploads/sites/3/2018/07/aziz-acharki-549137-unsplash-1200x775.jpg',
  ];

  Timer _setTimerToAutomaticClose() {
    ///*** Timer cancel automatic when end duration
    return Timer(
        const Duration(seconds: 5),
        () => ScaffoldMessenger.of(MyApp.navigatorKey.currentContext ?? context)
            .hideCurrentMaterialBanner());
  }

  ScaffoldFeatureController _buildMaterialBanner(BuildContext context) {
    return ScaffoldMessenger.of(MyApp.navigatorKey.currentContext ?? context)
        .showMaterialBanner(
      MaterialBanner(
        content: const Text('Material banner'),
        leading: const Icon(Icons.star),
        backgroundColor:
            Colors.primaries[Random().nextInt(Colors.primaries.length)],
        onVisible: () => _setTimerToAutomaticClose(),
        actions: [
          TextButton(
            child: const Text(
              'Dismiss',
              style: TextStyle(color: Colors.black),
            ),
            onPressed: () => ScaffoldMessenger.of(
                    MyApp.navigatorKey.currentContext ?? context)
                .hideCurrentMaterialBanner(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Global Material Banner'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemBuilder: (_, index) => Image.network(_images[index]),
              separatorBuilder: (_, __) => const SizedBox(height: 20),
              itemCount: _images.length,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () => _buildMaterialBanner(context),
                child: const Text('Show Material Banner'),
              ),
              const SizedBox(width: 20),
              TextButton(
                onPressed: () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => const SecondPage())),
                child: const Text('Go to next page'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
