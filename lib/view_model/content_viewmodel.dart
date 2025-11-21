import 'package:rare_crew/model/content_model.dart';
import 'package:rare_crew/service/content_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final contentServiceProvider = Provider((ref) => ContentService());

final contentStreamProvider = StreamProvider<List<ContentModel>>((ref) {
  return ref.watch(contentServiceProvider).loadContent();
});

class ContentViewmodel {
  final Ref ref;
  ContentViewmodel(this.ref);

  Future<void> addContent(String title) {
    return ref.read(contentServiceProvider).addContent(title);
  }

  Future<void> toggleDone(ContentModel content) {
    return ref.read(contentServiceProvider).updateDone(content);
  }

  Future<void> share(String contentId, String email) {
    return ref.read(contentServiceProvider).shareTask(contentId, email);
  }
}

final contentViewModelProvider = Provider((ref) => ContentViewmodel(ref));