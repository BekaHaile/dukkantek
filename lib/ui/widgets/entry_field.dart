import 'package:flutter/material.dart';

class EntryField extends StatelessWidget{
  final String title;
  final bool isPassword;
  final Function(String value)? onChanged;

  const EntryField(this.title, this.isPassword, this.onChanged, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
              obscureText: isPassword,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true),
                  onChanged: onChanged,)
        ],
      ),
    );
  }
}