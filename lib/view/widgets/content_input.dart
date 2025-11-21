import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rare_crew/view_model/content_viewmodel.dart';

class ContentInput extends ConsumerStatefulWidget{
  const ContentInput({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ContentInputState();
}

class _ContentInputState extends ConsumerState<ContentInput>{
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
  final viewModel = ref.watch(contentViewModelProvider);
  return Container(
    child: Padding(
        padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Expanded(
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(width: 1, color: Color(0XFFC0D0DA)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                        width: 1,
                        color: Color(0XFF53616A),
                        style: BorderStyle.solid),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                        width: 1,
                        color: Color(0XFFEF7E2C),
                        style: BorderStyle.solid),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                        width: 1,
                        color: Color(0XFFEF7E2C),
                        style: BorderStyle.solid),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                        width: 1,
                        color: Color(0XFFC0D0DA),
                        style: BorderStyle.solid),
                  ),
                  isDense: true,
                  contentPadding: EdgeInsets.all(15),
                  labelText: "Add new content to share",
                  labelStyle: TextStyle(fontWeight: FontWeight.w400,fontSize: 14.0,color: Color(0xFF051F2F), fontFamily:'dubaiFontNRegular'),
                ),

                // decoration: const InputDecoration(hintText: "Add a new content"),
              )
          ),
          IconButton(
            tooltip: "Enter text and Tap to Upload",
            onPressed: (){
            if(_controller.text.trim().isNotEmpty){
              viewModel.addContent(_controller.text);
              _controller.clear();
            }
          }, icon: const Icon(Icons.abc_outlined, color: Colors.red,size: 50,),)
        ],
      ),
    ),
  );
  }
}