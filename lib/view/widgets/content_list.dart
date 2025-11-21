import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rare_crew/view/widgets/content_item.dart';
import 'package:rare_crew/view_model/content_viewmodel.dart';

class ContentList extends ConsumerWidget{
  const ContentList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final content = ref.watch(contentStreamProvider);
    return content.when(
        data: (list) {
      if(list.isEmpty){
        return const Center(child: Text("No content"),
        );
      }
      return ListView.builder(
        itemCount: list.length,
          itemBuilder: (context, index){
            final contentModel = list[index];
            return ContentItem(contentModel: contentModel);
      });
    }, error: (error, _) {
          return Center (child: Text(error.toString()),);
    }, loading: () {
         return  const Center(child: CircularProgressIndicator(),);
    });
  }
}