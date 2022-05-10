import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'interceptors/logging_interceptor.dart';

Client client = InterceptedClient.build(interceptors: [LoggingInterceptor()]);
final url = Uri.parse('http://192.168.200.112:8080/transactions');
