import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/home_controller.dart';
import 'package:provider/provider.dart';
class AddScreen extends StatefulWidget {
  String id;
  String title;
  String description;
  AddScreen({super.key,required this.id,required this.title,required this.description});

  @override
  State<AddScreen> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddScreen> {
  @override
  void initState() {
    final editpro = Provider.of<TodoProvider>(context,listen: false);
    editpro.title=TextEditingController(text: widget.title);
    editpro.description=TextEditingController(text: widget.description);
    super.initState();
  }
  bool isEdit = false;

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
        appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: Colors.black,
            title: Text(  
              isEdit ? "Edit Note": "Add Note" ,
              style: const TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold),
            )),
        body: Center(
            child: Card(
                color: Colors.black26,
                child: SizedBox(
                    height: 400,
                    width: 400,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 40, left: 40),
                            child: Consumer<TodoProvider>(
                              builder: (context, value, child) => TextFormField(
                                controller: value.title,
                                decoration: const InputDecoration(
                                  hintText: "Title",
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 40, right: 40),
                            child: Consumer<TodoProvider>(
                              builder: (context, value, child) => TextFormField(
                                controller: value.description,
                                maxLines: 4,
                                decoration: const InputDecoration(
                                  hintText: "Notes",
                                  prefixStyle: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Consumer<TodoProvider>(
  builder: (context, value, child) => GestureDetector(
    onTap: () async {
      if (isEdit) {
         value.updateTodo(id: widget.id);
       
      } else {
         value.addTodo(context);
      }
      Navigator.of(context).pop();
    },
    child: Container(
      height: 35,
      width: 70,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          isEdit ? "Update" : "Add"  ,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    ),
  ),
)

                        ])))));
  }
}
