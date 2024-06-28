import 'package:firebase_database/firebase_database.dart';

import '../model/notes_model.dart';

class FCService {
  //? instance
  static final DatabaseReference ref = FirebaseDatabase.instance.ref();

//! create a new instance

  static Future<void> create(
      {required String dbPaht, required Map<String, dynamic> data}) async {
    String? childPath = ref.child(dbPaht).push().key;
    await ref.child(dbPaht).child(childPath!).set(data);
  }

  static Future<List<DataSnapshot>> read({
    required String parentPath,
  }) async {
    List<DataSnapshot> list = [];
    //? api dagi ma'lumotlar path i
    final parentp = ref.child(parentPath);
    //? api dagi ma'lumotlarni o'qish metodi 1 marotaba

    DatabaseEvent databaseEvent = await parentp.once();

    final childp = databaseEvent.snapshot.children;
    for (var e in childp) {
      list.add(e);
    }
    return list;
  }

  //! delete a notes model

  static Future<void> delete({required String id}) async {
    ref.child('notes').child(id).remove();
  }

  //! update a notes model
  static Future<void> update(
      {required NotesModel data, required String id}) async {
    await ref.child('notes').child(id).update(
          data.toJson(),
        );
  }
}
