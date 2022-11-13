import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DynamicFormScreen extends StatefulWidget {
  const DynamicFormScreen({super.key});

  @override
  State<DynamicFormScreen> createState() => _DynamicFormScreenState();
}

class _DynamicFormScreenState extends State<DynamicFormScreen> {
  late int _count;

  @override
  void initState() {
    super.initState();
    _count = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic Form'),
        actions: [
          IconButton(
            onPressed: () async {
              setState(() {
                _count++;
              });
            }, 
            icon: Icon(Icons.add),
          ),
          IconButton(
            onPressed: () async {
              setState(() {
                _count = 0;
              });
            }, 
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _count,
                itemBuilder: (context, index) {
                  return _row(index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  _row(int index) {
    return Row(
      children: [
        Text('ID: $index'),
        SizedBox(width: 30.0),
        Expanded(child: TextFormField()),
      ],
    );
  }
}