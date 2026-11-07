import 'package:flutter/material.dart';
import 'package:to_do/answerbutton.dart';

class Ui2 extends StatefulWidget {
  Ui2({super.key});

  @override
  State<Ui2> createState() => _Ui2State();
}

class _Ui2State extends State<Ui2> {
  final firstNameController = TextEditingController();

  List<String> g = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 70, top: 15),
          child: Column(
            children: [Icon(Icons.fact_check, color: Colors.white, size: 25)],
          ),
        ),

        centerTitle: true,
        title: Text(
          'To-Do List',
          style: TextStyle(
            fontWeight: .w900,
            fontSize: 25,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 23, 70, 152),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Container(
              height: 180,
              width: 350,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),

              child: Column(
                children: [
                  SizedBox(height: 10),
                  TextField(
                    controller: firstNameController,
                    decoration: InputDecoration(
                      hintText: 'e.g., Buy groceries',
                      prefixIcon: const Icon(Icons.search),
                      fillColor: Colors.grey[100],
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: 2,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      onPressed: () {
                        if (firstNameController.text.isNotEmpty) {
                          setState(() {
                            g.add(firstNameController.text);
                          });
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'ավելացնել',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          SizedBox(width: 5),
                          Icon(Icons.add_circle, color: Colors.white, size: 25),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 50),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: g.length,
              itemBuilder: (context, index) {
                return Answerbutton(
                  text: g[index],
                  onDelete: () {
                    setState(() {
                      g.removeAt(index);
                    });
                  },
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 1);
              },
            ),
          ),
        ],
      ),
    );
  }
}
