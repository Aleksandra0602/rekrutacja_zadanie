import 'package:flutter/material.dart';
import 'package:zadanie_rek/UI/result_screen.dart';

class SendButton extends StatelessWidget {
  const SendButton({
    Key? key,
    required GlobalKey<FormState> formKey,
    required this.text,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 72),
        child: Container(
          height: 50,
          color: const Color.fromRGBO(115, 0, 85, 1),
          child: const Center(
            child: Text(
              "WYSZUKAJ",
              style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 0.7),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      onTap: () {
        if (_formKey.currentState!.validate()) {
          List<int> variable = text.split(',').map<int>((e) {
            return int.parse(e);
          }).toList();
          FocusScope.of(context).unfocus();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResultScreen(numbers: variable),
            ),
          );
        }
      },
    );
  }
}
