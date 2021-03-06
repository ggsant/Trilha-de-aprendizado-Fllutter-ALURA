import 'package:http_interceptor/http_interceptor.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    print('Request');
    print('url: $data.baseUrl');
    print('body: $data.body');
    print('header: $data.headers');

    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    print('Response');
    print('body: $data.body');
    print('header: $data.headers');
    print('status code: $data.statusCode');
    print(data);
    return data;
  }
}
