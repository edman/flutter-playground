import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TopComponent extends StatefulWidget {
  TopComponent({Key key}) : super(key: key);

  @override
  _TopComponentState createState() => _TopComponentState();
}

class _TopComponentState extends State<TopComponent> {
  final _itemExtent = 56.0;

  @override
  Widget build(BuildContext context) {
    final generatedList = List.generate(500, (index) => 'Item $index');
    return ListView(
      controller: ScrollController(initialScrollOffset: _itemExtent * 401),
      children: generatedList.map((i) => ListTile(title: Text(i, style: TextStyle(fontSize: 20.0)))).toList(),
    );
  }
  //   return CustomScrollView(
  //     controller: ScrollController(initialScrollOffset: _itemExtent * 401),
  //     slivers: [
  //       SliverFixedExtentList(
  //         itemExtent: _itemExtent,
  //         delegate: SliverChildBuilderDelegate(
  //           (context, index) => ListTile(
  //                 title: Text(
  //                   generatedList[index],
  //                   style: TextStyle(fontSize: 20.0),
  //                 ),
  //               ),
  //           childCount: generatedList.length,
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
