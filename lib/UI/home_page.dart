import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'widgets/send_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();

  String text = '';
  List<int> list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Podaj liczby'),
        backgroundColor: const Color.fromRGBO(115, 0, 85, 1),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextFormField(
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp('[.]'))
                  ],
                  onChanged: (value) => setState(() {
                    text = value;
                  }),
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                  ),
                  validator: validation,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: SendButton(formKey: _formKey, text: text),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? validation(String? value) {
    int k = 0;
    int j = 0;
    List<int> list2 = value!.endsWith(',') == false
        ? value.split(',').map<int>((e) {
            return int.parse(e);
          }).toList()
        : [];

    if (list2.isEmpty) {
      return 'Lista nie może się kończyć przecinkiem';
    }
    if (list2.length < 3) {
      return 'Musisz podać co najmniej 3 wartości typu int';
    }
    for (int i = 0; i < list2.length; i++) {
      if (list2[i] % 2 == 0) {
        k++;
      } else {
        j++;
      }
    }
    if ((k > j && j > 1) || (k < j && k > 1)) {
      return 'Należy podać tylko jedną "odstającą" liczbę';
    } else {
      return null;
    }
  }
}
