import 'package:http_interceptor/http_interceptor.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    // print('REQUEST');
    // print(data.toHttpRequest().toString());
    // print(data.headers.toString());
    // print(data.body.toString());
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    // print('RESPONSE');
    // print(data.statusCode.toString());
    // print(data.headers.toString());
    // print(data.body.toString());
    return data;
  }
}
