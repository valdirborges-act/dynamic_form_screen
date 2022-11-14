import 'dart:convert';
import 'package:flutter/material.dart';

class DynamicFormScreen extends StatefulWidget {
  const DynamicFormScreen({super.key});

  @override
  State<DynamicFormScreen> createState() => _DynamicFormScreenState();
}

class _DynamicFormScreenState extends State<DynamicFormScreen> {
  late int _count;
  late String _result;
  late List<Map<String, dynamic>> _values;

  @override
  void initState() {
    super.initState();
    _count = 0;
    _result = '';
    _values = [];
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
                _result = '';
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
            SizedBox(height: 10.0),
            Text(_result),
          ],
        ),
      ),
    );
  }

  _row(int key) {
    return Row(
      children: [
        Text('ID: $key'),
        SizedBox(width: 30.0),
        Expanded(child: TextFormField(
          onChanged: (val) {
            _onUpdate(key, val);
          },
        )),
      ],
    );
  }

  _onUpdate(int key, String val) {
    int foundKey = -1;
    for(var map in _values) {
      if (map.containsKey('id')) {
        if (map['id'] == key) {
          foundKey = key;
          break;
        }
      }
    }
    if (-1 != foundKey) {
      _values.removeWhere((map) {
        return map['id'] == foundKey;
      });
    }
    Map<String, dynamic> json = {
      'id':key, 
      'value':{
        "text": val,
      }
    };
    _values.add(json);

    setState(() {
      _result = _prettyPrint(_values);
    });
  }

  String _prettyPrint(jsonObject) {
    var encoder = const JsonEncoder.withIndent('      ');
    return encoder.convert(jsonObject);
  }
}