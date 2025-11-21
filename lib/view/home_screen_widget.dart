import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rare_crew/view/widgets/content_input.dart';
import 'package:rare_crew/view/widgets/content_list.dart';

class HomeScreen extends ConsumerWidget{
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "Content Sharing",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/app_bar_image.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
        body: const Column(
          children: [
            Expanded(child: ContentList()),
            ContentInput(),
          ],
        ),
      );
  }
}