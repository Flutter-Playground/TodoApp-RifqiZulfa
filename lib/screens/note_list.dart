import 'package:flutter/material.dart';
import 'package:todo_list_app/screens/my_note.dart';
import 'package:get/get.dart';
import 'my_note.dart';
import 'controller.dart';

class NoteList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final NoteController nc = Get.put(NoteController());
    Widget getNoteList() {
      return Obx(
        () => nc.notes.length == 0 ? Center(child: Image.asset('assets/images/lists.jpg'), ) :
        ListView.builder(
          itemCount: nc.notes.length,
          itemBuilder: (context, index) =>
          Card(
            child: ListTile(
              title: Text(nc.notes[index].title,
              style: TextStyle(
                fontWeight: FontWeight.w500)),
                leading: Text(
                  (index + 1).toString() + ".",
                  style: TextStyle(fontSize: 15),
                ),
                trailing: Wrap(children: <Widget>[
                  IconButton(
                    onPressed: () =>
                    Get.to(MyNote(index: index)), 
                    icon: Icon(Icons.create),
                    ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      Get.defaultDialog(
                        title: 'Delete Note',
                        middleText: nc.notes[index].title,
                        onCancel:() => Get.back(),
                        confirmTextColor: Colors.white,
                        onConfirm:() {
                          nc.notes.removeAt(index);
                          Get.back();
                        },
                      );
                    }
                  ), 
                ],
              ),
            ),
          ),
        ),
      );
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Todo App'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Get.to(MyNote(index: 0,));
          },
        ),
        body: Container(
          child: Padding(
            padding: EdgeInsets.all(5),
            child: getNoteList(),
          ),
        ),
      ),
    );
  }
}