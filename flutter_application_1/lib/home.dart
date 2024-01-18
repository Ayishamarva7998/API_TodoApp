import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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
                          onPressed: () {},
                          child: Text(
                            "Add notes",
                            style: TextStyle(
                                color: Color.fromARGB(255, 9, 105, 122)),
                          ))
                    ],
                  )),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (ctx, index) {
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
                          title: const Text(
                            "title",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          subtitle: const Text(
                            'description',
                            style: TextStyle(fontSize: 16),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          trailing: PopupMenuButton(
                            onSelected: (value) {
                              if (value == "Edit") {
                                // Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                                //   // AddNotes(id:data.id??'',note:data.notes??'',title: data.title??'',)
                                // ));
                              } else if (value == "Delete") {
                                // pro.deletNote(id: data.id);
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
            ],
          ),
        ),
      ),
    );
  }
}
