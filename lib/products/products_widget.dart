import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductsWidget extends StatefulWidget {
  const ProductsWidget({Key key}) : super(key: key);

  @override
  _ProductsWidgetState createState() => _ProductsWidgetState();
}

class _ProductsWidgetState extends State<ProductsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFEEEEEE),
          ),
          child: AuthUserStreamWidget(
            child: StreamBuilder<List<ProductsRecord>>(
              stream: queryProductsRecord(
                queryBuilder: (productsRecord) => productsRecord
                    .where('product_id', isEqualTo: currentUserUid),
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: SpinKitDualRing(
                        color: Color(0xFFFF6813),
                        size: 50,
                      ),
                    ),
                  );
                }
                List<ProductsRecord> listViewProductsRecordList = snapshot.data;
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  itemCount: listViewProductsRecordList.length,
                  itemBuilder: (context, listViewIndex) {
                    final listViewProductsRecord =
                        listViewProductsRecordList[listViewIndex];
                    return Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xFFEEEEEE),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 8, 8, 8),
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFEEEEEE),
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                        color: Color(0xFFB8B8B8),
                                        width: 1,
                                      ),
                                    ),
                                    child: Image.network(
                                      listViewProductsRecord.productImage,
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 8),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        listViewProductsRecord.productName,
                                        style: FlutterFlowTheme.subtitle2,
                                      ),
                                      Text(
                                        '1 Piece',
                                        style: FlutterFlowTheme.bodyText1,
                                      ),
                                      Text(
                                        formatNumber(
                                          listViewProductsRecord.productPrice,
                                          formatType: FormatType.decimal,
                                          decimalType: DecimalType.commaDecimal,
                                          currency: ' ₹',
                                        ),
                                        style:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        listViewProductsRecord.productStock,
                                        style:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Poppins',
                                          color: Color(0xFF7FB73D),
                                          fontWeight: FontWeight.w300,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
