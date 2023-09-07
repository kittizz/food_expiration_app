import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';
import 'blog_card_model.dart';
export 'blog_card_model.dart';

class BlogCardWidget extends StatefulWidget {
  const BlogCardWidget({
    Key? key,
    this.blogId,
    required this.image,
    required this.title,
    this.blurHash,
  }) : super(key: key);

  final int? blogId;
  final String? image;
  final String? title;
  final String? blurHash;

  @override
  _BlogCardWidgetState createState() => _BlogCardWidgetState();
}

class _BlogCardWidgetState extends State<BlogCardWidget> {
  late BlogCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BlogCardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        context.pushNamed(
          'BlogPost',
          queryParameters: {
            'blogId': serializeParam(
              widget.blogId,
              ParamType.int,
            ),
          }.withoutNulls,
        );
      },
      child: Container(
        width: double.infinity,
        height: 195.0,
        decoration: BoxDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: OctoImage(
                placeholderBuilder: OctoPlaceholder.blurHash(
                  widget.blurHash!,
                ),
                image: NetworkImage(
                  widget.image!,
                ),
                width: double.infinity,
                height: 160.0,
                fit: BoxFit.cover,
              ),
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 10.0),
                child: Text(
                  widget.title!,
                  style: FlutterFlowTheme.of(context).labelLarge.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).labelLargeFamily,
                        color: FlutterFlowTheme.of(context).primaryText,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).labelLargeFamily),
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
