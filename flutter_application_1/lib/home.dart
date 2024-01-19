import 'package:flutter/material.dart';
import 'package:flutter_application_1/add_screen.dart';
import 'package:flutter_application_1/controller/home_c.dart';
import 'package:flutter_application_1/service/apiservice.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    Provider.of<TodoProvider>(context,listen: false).fetchTodo();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: 250,
                  width: 300,
                  color: const Color.fromARGB(255, 235, 231, 231),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Image.asset("assets/note3.jpg"),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Addscreen(),));
                          },
                          child: const Text(
                            "Add notes",
                            style: TextStyle(
                                color: Color.fromARGB(255, 9, 105, 122)),
                          ))
                    ],
                  )),
              Expanded(
                child: Consumer<TodoProvider>(builder: (context, pro, child) => 
                  FutureBuilder(future: TodoSevice().getTodo(),
                    builder: (context, snapshot) => 
                     ListView.builder(
                      // itemCount: 10,
                      itemCount: pro.TodoList.length,
                      itemBuilder: (ctx, index) {
                        final dataa=pro.TodoList[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: ListTile(
                              onTap: () {},
                              leading: CircleAvatar(
                                backgroundColor:
                                    const Color.fromARGB(255, 255, 98, 0),
                                child: Text(
                                  '${index + 1}',
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                              title: Text(
                                // "title",
                                dataa.title??'N/A',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              subtitle:  Text(
                                // 'description',s
                                dataa.description??"N/A",

                                style: TextStyle(fontSize: 16),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              trailing: PopupMenuButton(
                                onSelected: (value) {
                                  if (value == "Edit") {
                                   
                                  } else if (value == "Delete") {
                                
                                  }
                                },
                                itemBuilder: (context) {
                                  return [
                                    const PopupMenuItem(
                                      value: "Edit",
                                      child: Text("Edit"),
                                    ),
                                    const PopupMenuItem(
                                      value: "Delete",
                                      child: Text("Delete"),
                                    )
                                  ];
                                },
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
