import 'package:rare_crew/model/content_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ContentService {
  final _contentReference = FirebaseFirestore.instance.collection('content');

  Stream<List<ContentModel>> loadContent() {
    return _contentReference.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return ContentModel.fromJson(doc.data());
      }).toList();
    });
  }

  Future<void> addContent(String title) async {
    final id = _contentReference.doc().id;
    await _contentReference.doc(id).set({
      'id': id,
      'title': title,
      'done': false,
      'sharedWith': [],
    });
  }

  Future<void> updateDone(ContentModel content) async {
    await _contentReference.doc(content.id).update({
      'done': !content.done,
    });
  }

  Future<void> shareTask(String taskId, String email) async {
    await _contentReference.doc(taskId).update({
      'sharedWith': FieldValue.arrayUnion([email]),
    });
  }
}