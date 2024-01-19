import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/home_c.dart';
import 'package:provider/provider.dart';
import 'home.dart';

class Addscreen extends StatelessWidget {
  const Addscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController title = TextEditingController();
    TextEditingController description = TextEditingController();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Welcome"),
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Home()),
              );
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 250,
                  child: TextFormField(
                    controller: title,
                    decoration: const InputDecoration(
                      hintText: "Title",
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 250,
                  child: TextFormField(
                    controller: description,
                    decoration: const InputDecoration(
                      hintText: "Description",
                    ),
                  ),
                ),
                Consumer<TodoProvider>(builder: (context, value, child) => 
                ElevatedButton(
                      onPressed: () {
                        value.addTodo(context);
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "save",
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 98, 0),
                        ),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
