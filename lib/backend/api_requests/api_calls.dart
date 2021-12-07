import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

Future<ApiCallResponse> verifyGstCall({
  String objectNo = '03DOXPM4071K1ZE',
}) {
  return ApiManager.instance.makeApiCall(
    callName: 'Verify Gst',
    apiUrl:
        'https://appyflow.in/api/verifyGST?gstNo=${objectNo}&key_secret=5bsD8TQe9vX9fwdfRiFNixtyY142',
    callType: ApiCallType.GET,
    headers: {},
    params: {},
    returnBody: true,
  );
}
