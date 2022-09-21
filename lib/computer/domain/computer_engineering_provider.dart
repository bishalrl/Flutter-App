import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'model/note.dart';

class ComputerEngineeringProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<Note> _notes = [];
  List<Note> get notes => _notes;

//cloud_firestore
  final _firestore = FirebaseFirestore.instance;

  Future<String> getSem1Notes() async {
    String result = "OK";
    List<Note> fetchedNote = [];

    try {
      final data = await _firestore
          .collection('computer')
          .doc('sem1')
          .collection('notes')
          .get();

      data.docs.forEach((element) {
        fetchedNote.add(Note.fromJson(element.data()));
      });
    } catch (e) {
      result = e.toString();
    }
    _notes = fetchedNote;
    notifyListeners();

    return result;
  }
}
