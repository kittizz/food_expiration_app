// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:markdown_editor_plus/markdown_editor_plus.dart';

class MarkdownEditorWidget extends StatefulWidget {
  const MarkdownEditorWidget({
    Key? key,
    this.width,
    this.height,
    this.content,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? content;

  @override
  _MarkdownEditorWidgetState createState() => _MarkdownEditorWidgetState();
}

class _MarkdownEditorWidgetState extends State<MarkdownEditorWidget> {
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = widget.content ?? '';
  }

  @override
  Widget build(BuildContext context) {
    _controller.text = widget.content ?? '';
    return SingleChildScrollView(
        child: Padding(
      padding: EdgeInsets.all(20),
      child: MarkdownAutoPreview(
        onChanged: (value) {
          FFAppState().update(() {
            FFAppState().markdownEditor = value;
          });
        },
        controller: _controller,
        emojiConvert: true,
        enableToolBar: true,
        minLines: 10,
        decoration: InputDecoration(
          hintText: '<กดพิมพ์ markdown ที่นี่>',
        ),
      ),
    ));
  }
}
