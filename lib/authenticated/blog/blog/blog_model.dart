import '/component/blog_card/blog_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BlogModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for BlogCard component.
  late BlogCardModel blogCardModel1;
  // Model for BlogCard component.
  late BlogCardModel blogCardModel2;
  // Model for BlogCard component.
  late BlogCardModel blogCardModel3;
  // Model for BlogCard component.
  late BlogCardModel blogCardModel4;
  // Model for BlogCard component.
  late BlogCardModel blogCardModel5;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    blogCardModel1 = createModel(context, () => BlogCardModel());
    blogCardModel2 = createModel(context, () => BlogCardModel());
    blogCardModel3 = createModel(context, () => BlogCardModel());
    blogCardModel4 = createModel(context, () => BlogCardModel());
    blogCardModel5 = createModel(context, () => BlogCardModel());
  }

  void dispose() {
    unfocusNode.dispose();
    blogCardModel1.dispose();
    blogCardModel2.dispose();
    blogCardModel3.dispose();
    blogCardModel4.dispose();
    blogCardModel5.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
