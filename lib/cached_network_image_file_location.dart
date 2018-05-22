import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class TopComponent extends StatefulWidget {
  @override
  _TopComponentState createState() => _TopComponentState();
}

class _TopComponentState extends State<TopComponent> {
  bool pressed = false;
  final imageUrl = 'https://i.imgur.com/80Mh9uc.png';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            constraints: BoxConstraints(maxHeight: 300.0),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
            ),
          ),
          FloatingActionButton(
            onPressed: () async =>
                print('file path="${await _findPath(imageUrl)}"'),
            child: Icon(Icons.play_arrow),
          ),
        ],
      ),
    );
  }

  Future<String> _findPath(String imageUrl) async {
    final cache = await CacheManager.getInstance();
    final file = await cache.getFile(imageUrl);
    return file.path;
  }
}
