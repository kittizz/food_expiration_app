import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';
import 'blog_post_model.dart';
export 'blog_post_model.dart';

class BlogPostWidget extends StatefulWidget {
  const BlogPostWidget({
    Key? key,
    required this.blogId,
  }) : super(key: key);

  final int? blogId;

  @override
  _BlogPostWidgetState createState() => _BlogPostWidgetState();
}

class _BlogPostWidgetState extends State<BlogPostWidget> {
  late BlogPostModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BlogPostModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: FoodexpirationGroup.blogByIDCall.call(
        id: widget.blogId,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitDoubleBounce(
                  color: FlutterFlowTheme.of(context).error,
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        final blogPostBlogByIDResponse = snapshot.data!;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).info,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 54.0,
                icon: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              actions: [],
              centerTitle: false,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(0.0),
                      child: OctoImage(
                        placeholderBuilder: OctoPlaceholder.blurHash(
                          FoodexpirationGroup.blogByIDCall
                              .imageBlurHash(
                                blogPostBlogByIDResponse.jsonBody,
                              )
                              .toString(),
                        ),
                        image: NetworkImage(
                          functions.getImage(FoodexpirationGroup.blogByIDCall
                              .imagePath(
                                blogPostBlogByIDResponse.jsonBody,
                              )
                              .toString()),
                        ),
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 200.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 0.0, 0.0),
                      child: Text(
                        FoodexpirationGroup.blogByIDCall
                            .title(
                              blogPostBlogByIDResponse.jsonBody,
                            )
                            .toString(),
                        style: FlutterFlowTheme.of(context).headlineSmall,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 1.0,
                      child: custom_widgets.MarkdownWidget(
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        content: FoodexpirationGroup.blogByIDCall
                            .content(
                              blogPostBlogByIDResponse.jsonBody,
                            )
                            .toString(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
