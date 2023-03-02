// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';

class FlutterMap extends StatefulWidget {
  const FlutterMap({Key? key}) : super(key: key);

  @override
  State<FlutterMap> createState() => FlutterMapState();
}

class FlutterMapState extends State<FlutterMap> {
  List<String> items = [];
  final listKey = GlobalKey<AnimatedListState>();

  void insertItem() {
    int index = items.length;
    items.add('item ${index + 1} ');
    listKey.currentState!.insertItem(index);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade500,
      body: Column(
        children: [
          Container(
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Flutter Map',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
            decoration: BoxDecoration(
                color: Colors.grey.shade700,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0))),
            width: double.infinity,
            height: size.height * 1 / 5,
          ),
          IconButton(
            onPressed: () {
              insertItem();
            },
            icon: Icon(
              Icons.add,
              color: Colors.white,
              size: 30.0,
            ),
          ),
          Expanded(
            child: AnimatedList(
              key: listKey,
              initialItemCount: items.length,
              itemBuilder: ((context, index, animation) {
                return ScaleTransition(
                  scale: animation,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    child: Container(
                      color: Colors.amber,
                      child: Row(
                        children: [
                          Expanded(
                            child: ListTile(
                              title: Text(items[index]),
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  items.removeAt(index);
                                  listKey.currentState!.removeItem(
                                      index,
                                      (context, animation) => SizeTransition(
                                          sizeFactor: animation));
                                });
                              },
                              icon: Icon(Icons.delete))
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
