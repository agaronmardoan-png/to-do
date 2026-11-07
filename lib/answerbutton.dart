import 'package:flutter/material.dart';

class Answerbutton extends StatefulWidget {
  final String text;
  final VoidCallback onDelete;
  const Answerbutton({super.key, required this.text, required this.onDelete});

  @override
  State<Answerbutton> createState() => _AnswerbuttonState();
}

class _AnswerbuttonState extends State<Answerbutton> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),

      child: Container(
        height: 70,

        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(10),
        ),

        child: Row(
          children: [
            Transform.scale(
              scale: 1.5,
              child: Checkbox(
                value: isChecked,

                checkColor: Colors.white,

                fillColor: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.selected)) {
                    return Colors.blue;
                  }
                  return Colors.white;
                }),
                side: const BorderSide(color: Colors.grey, width: 2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                onChanged: (value) {
                  setState(() {
                    isChecked = value!;
                  });
                },
              ),
            ),
            Text(
              widget.text,
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),

            Spacer(),

            IconButton(
              onPressed: widget.onDelete,
              icon: Icon(Icons.delete, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
