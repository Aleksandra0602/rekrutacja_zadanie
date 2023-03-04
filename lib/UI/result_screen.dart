import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:zadanie_rek/data/find_number.dart';

class ResultScreen extends StatefulWidget {
  final List<int> numbers;
  const ResultScreen({Key? key, required this.numbers}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  int searchNumber = 0;

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    FindNumbers findNumbers = FindNumbers(widget.numbers);
    setState(() {
      searchNumber = findNumbers.checkNumber();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.secondAppBar),
        backgroundColor: const Color.fromRGBO(115, 0, 85, 1),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              searchNumber.toString(),
              style: const TextStyle(
                color: Color.fromRGBO(0, 0, 0, 0.7),
                fontSize: 52,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
