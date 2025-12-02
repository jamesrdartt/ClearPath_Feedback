import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/add_feedback_widget.dart';
import '/components/feedback_widget.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_colorpicker/flutterflow_colorpicker.dart';
import 'feedbacks_model.dart';
export 'feedbacks_model.dart';

/// SCREEN NAME: Feedback
///
/// WHAT:
/// - Title “Feedback” at the top-left.
///
/// - A vertical list of rounded cards. Each card has a left vote box and
/// right description text.
/// - A full-width purple button at the bottom: “Post New Feedback”.
///
/// WHERE:
/// - Column, 16px page padding, 16px space between cards.
/// - Card: Row → [square vote box 72x72] + [expanded Text with 12px left
/// padding].
///
/// HOW IT LOOKS:
/// - Cards: white, 1px #E5E7EB border, 18–20px radius, 12–16px inner padding.
/// - Vote box: 2px border (#3B82F6), 8px radius, centered text “X\nvotes”.
/// - Button: height ~54, rounded 24, background #8A2EFF, text white.
///
/// HOW IT BEHAVES:
/// - Make the list a repeating item template for Firestore collection
/// “feedback” (fields: text String, votes Number).
/// - Order by votes descending.
/// - On tap of vote box: increment votes by +1.
/// - “Post New Feedback” → navigate to AddFeedback page.
class FeedbacksWidget extends StatefulWidget {
  const FeedbacksWidget({super.key});

  static String routeName = 'Feedbacks';
  static String routePath = '/feedbacks';

  @override
  State<FeedbacksWidget> createState() => _FeedbacksWidgetState();
}

class _FeedbacksWidgetState extends State<FeedbacksWidget> {
  late FeedbacksModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FeedbacksModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 24.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 24.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Feedback',
                            style: FlutterFlowTheme.of(context)
                                .headlineLarge
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .headlineLargeFamily,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .headlineLargeIsCustom,
                                ),
                          ),
                        ),
                      ),
                      if (FFDevEnvironmentValues().debugMode ? true : false)
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 24.0, 0.0),
                              child: FlutterFlowIconButton(
                                borderRadius: 8.0,
                                buttonSize: 40.0,
                                fillColor: colorFromCssString(
                                  getRemoteConfigString('button_variant'),
                                  defaultColor:
                                      FlutterFlowTheme.of(context).secondary,
                                ),
                                icon: Icon(
                                  Icons.settings_sharp,
                                  color: FlutterFlowTheme.of(context).info,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  final _colorPickedColor =
                                      await showFFColorPicker(
                                    context,
                                    currentColor: _model.colorPicked ??
                                        colorFromCssString(
                                          getRemoteConfigString(
                                              'button_variant'),
                                          defaultColor: Colors.black,
                                        ),
                                    showRecentColors: true,
                                    allowOpacity: true,
                                    textColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    secondaryTextColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryText,
                                    backgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                    primaryButtonBackgroundColor:
                                        FlutterFlowTheme.of(context).primary,
                                    primaryButtonTextColor: Colors.white,
                                    primaryButtonBorderColor:
                                        Colors.transparent,
                                    displayAsBottomSheet:
                                        isMobileWidth(context),
                                  );

                                  if (_colorPickedColor != null) {
                                    safeSetState(() =>
                                        _model.colorPicked = _colorPickedColor);
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                Expanded(
                  child: StreamBuilder<List<FeedbackRecord>>(
                    stream: queryFeedbackRecord(
                      queryBuilder: (feedbackRecord) =>
                          feedbackRecord.orderBy('upvotes', descending: true),
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
                      List<FeedbackRecord> listViewFeedbackRecordList =
                          snapshot.data!;

                      return ListView.separated(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewFeedbackRecordList.length,
                        separatorBuilder: (_, __) => SizedBox(height: 12.0),
                        itemBuilder: (context, listViewIndex) {
                          final listViewFeedbackRecord =
                              listViewFeedbackRecordList[listViewIndex];
                          return InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                DescriptionPageWidget.routeName,
                                queryParameters: {
                                  'feedbackDoc': serializeParam(
                                    listViewFeedbackRecord,
                                    ParamType.Document,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  'feedbackDoc': listViewFeedbackRecord,
                                },
                              );
                            },
                            child: FeedbackWidget(
                              key: Key(
                                  'Key5fl_${listViewIndex}_of_${listViewFeedbackRecordList.length}'),
                              feedbackText: valueOrDefault<String>(
                                listViewFeedbackRecord.title,
                                'title',
                              ),
                              numberVotes: valueOrDefault<int>(
                                listViewFeedbackRecord.upvotes,
                                0,
                              ),
                              feedbacksDocument: listViewFeedbackRecord,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) {
                          return GestureDetector(
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              FocusManager.instance.primaryFocus?.unfocus();
                            },
                            child: Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: AddFeedbackWidget(),
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));
                    },
                    text: 'Post New Feedback',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 70.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: colorFromCssString(
                        getRemoteConfigString('button_variant'),
                        defaultColor: FlutterFlowTheme.of(context).secondary,
                      ),
                      textStyle: FlutterFlowTheme.of(context)
                          .labelMedium
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).labelMediumFamily,
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 20.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .labelMediumIsCustom,
                          ),
                      elevation: 0.0,
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      GoRouter.of(context).prepareAuthEvent();
                      await authManager.signOut();
                      GoRouter.of(context).clearRedirectLocation();

                      context.goNamedAuth(
                          LoginWidget.routeName, context.mounted);
                    },
                    text: 'Logout',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 70.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: colorFromCssString(
                        getRemoteConfigString('button_variant'),
                        defaultColor: FlutterFlowTheme.of(context).secondary,
                      ),
                      textStyle: FlutterFlowTheme.of(context)
                          .labelMedium
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).labelMediumFamily,
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 20.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .labelMediumIsCustom,
                          ),
                      elevation: 0.0,
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                  ),
                ),
                FlutterFlowAdBanner(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 50.0,
                  showsTestAd: true,
                  androidAdUnitID: 'ca-app-pub-6862785500421136/5546214996',
                ),
              ].divide(SizedBox(height: 12.0)),
            ),
          ),
        ),
      ),
    );
  }
}
