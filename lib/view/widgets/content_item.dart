import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rare_crew/model/content_model.dart';
import 'package:rare_crew/view_model/content_viewmodel.dart';

class ContentItem extends ConsumerWidget{
  final ContentModel contentModel;
  const ContentItem({super.key, required this.contentModel});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(contentViewModelProvider);
    return ListTile(
      leading: Checkbox(
          value: contentModel.done,
          onChanged: (_){
        viewModel.toggleDone(contentModel);
      }),
      title: Text(contentModel.title,style: TextStyle(
        color: Color(0XFFFFA500),
        fontWeight: FontWeight.bold,
        fontSize: 18.0,
      ),),
      trailing: IconButton(
        onPressed: () {
          final email = TextEditingController();
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text("Share Content"),
              content: TextField(
                controller: email,
                decoration: const InputDecoration(hintText: "Enter email"),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    viewModel.share(contentModel.id, email.text.trim());
                    final snackBar = SnackBar(
                      content: Text('Content shared to the given email account'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    Navigator.pop(context);
                  },
                  child: const Text("Share"),
                )
              ],
            ),
          );
        },
      icon: const Icon(Icons.share, color: Colors.blue,),),
    );
  }

}