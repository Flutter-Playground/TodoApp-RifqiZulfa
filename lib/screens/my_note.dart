import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model.dart';
import 'controller.dart';

class MyNote extends StatelessWidget {

  int index = 0;
  MyNote({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NoteController nc = Get.find();
    String text = "";
    if (index == 0){
      text = " ";
    } else {
      text = nc.notes[index].title;
    }
    TextEditingController textEditingController = new TextEditingController(text: text);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: index == 0 ? Text('Create a New Note') : Text('Update note'),
        ),
        body: Padding(
          padding: EdgeInsets.all(15),
          child: Container(
            height: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget> [
                Expanded(
                  child: TextField(
                    controller: textEditingController,
                    autofocus: true,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration(
                      hintText: 'Create a new note!',
                      labelText: 'My Note',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black87),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    style: TextStyle(fontSize: 20),
                    keyboardType: TextInputType.text,
                    maxLines: 5,
                  ), 
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget> [
                    ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text('Cancel'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (index == 0) {
                          nc.notes.add(Note(title: textEditingController.text));
                        } else{
                          var updatenote = nc.notes[index];
                          updatenote.title = textEditingController.text;
                          nc.notes[index] = updatenote;
                        }
                        Get.back();
                      },
                      child: index == 0 ? Text('Add') : Text('Update'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}