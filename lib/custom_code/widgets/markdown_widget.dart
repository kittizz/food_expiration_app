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

import 'package:flutter_markdown/flutter_markdown.dart';

class MarkdownWidget extends StatefulWidget {
  const MarkdownWidget({
    Key? key,
    this.width,
    this.height,
    required this.content,
    required this.title,
    required this.image,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String content;
  final String title;
  final String image;

  @override
  _MarkdownWidgetState createState() => _MarkdownWidgetState();
}

class _MarkdownWidgetState extends State<MarkdownWidget> {
  @override
  Widget build(BuildContext context) {
    return Markdown(
      selectable: true,
      // physics: NeverScrollableScrollPhysics(),
      data: "![title](" +
          widget.image +
          ")\n## " +
          widget.title +
          "\n" +
          widget.content,
    );
  }
}
