import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'feedback_model.dart';
export 'feedback_model.dart';

class FeedbackWidget extends StatefulWidget {
  const FeedbackWidget({
    super.key,
    required this.feedbackText,
    int? numberVotes,
    required this.feedbacksDocument,
  }) : this.numberVotes = numberVotes ?? 0;

  final String? feedbackText;
  final int numberVotes;

  /// the document for the feedbacks
  final FeedbackRecord? feedbacksDocument;

  @override
  State<FeedbackWidget> createState() => _FeedbackWidgetState();
}

class _FeedbackWidgetState extends State<FeedbackWidget> {
  late FeedbackModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FeedbackModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          context.pushNamed(
            DescriptionPageWidget.routeName,
            queryParameters: {
              'feedbackDoc': serializeParam(
                widget.feedbacksDocument,
                ParamType.Document,
              ),
            }.withoutNulls,
            extra: <String, dynamic>{
              'feedbackDoc': widget.feedbacksDocument,
            },
          );
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(0.0),
            border: Border.all(
              color: FlutterFlowTheme.of(context).primaryText,
              width: 1.0,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 72.0,
                  height: 72.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0.0),
                    border: Border.all(
                      color: colorFromCssString(
                        getRemoteConfigString('button_variant'),
                        defaultColor: FlutterFlowTheme.of(context).secondary,
                      ),
                      width: 2.0,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      StreamBuilder<List<FeedbackRecord>>(
                        stream: queryFeedbackRecord(
                          queryBuilder: (feedbackRecord) => feedbackRecord
                              .orderBy('upvotes', descending: true),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<FeedbackRecord> textFeedbackRecordList =
                              snapshot.data!;

                          return Text(
                            valueOrDefault<String>(
                              widget.feedbacksDocument?.upvotes.toString(),
                              '0',
                            ),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .bodyMediumIsCustom,
                                ),
                          );
                        },
                      ),
                      Text(
                        'votes',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodySmallFamily,
                              fontSize: 12.0,
                              letterSpacing: 0.0,
                              useGoogleFonts: !FlutterFlowTheme.of(context)
                                  .bodySmallIsCustom,
                            ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Text(
                            valueOrDefault<String>(
                              widget.feedbackText,
                              'feedback',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  lineHeight: 1.4,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .bodyMediumIsCustom,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ].divide(SizedBox(width: 12.0)),
            ),
          ),
        ),
      ),
    );
  }
}
