import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCardWidget extends StatefulWidget {
  const CustomCardWidget({Key key}) : super(key: key);

  @override
  _CustomCardWidgetState createState() => _CustomCardWidgetState();
}

class _CustomCardWidgetState extends State<CustomCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: Color(0xFFF5F5F5),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
              child: Text(
                'ORDERS',
                style: FlutterFlowTheme.bodyText1,
              ),
            ),
            Text(
              '10',
              style: FlutterFlowTheme.title2,
            )
          ],
        ),
      ),
    );
  }
}
