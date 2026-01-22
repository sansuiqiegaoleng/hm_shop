import 'package:dio/dio.dart';
import 'package:hm_shop/constants/index.dart';

// 基于dio二次封装

class DioRequest {
  final _dio = Dio();
  DioRequest() {
    _dio.options.baseUrl = GlobalConstants.BASE_URL;
    _dio.options.connectTimeout = Duration(seconds: GlobalConstants.TIME_OUT);
    _dio.options.receiveTimeout = Duration(seconds: GlobalConstants.TIME_OUT);
    _dio.options.sendTimeout = Duration(seconds: GlobalConstants.TIME_OUT);
    //拦截器
    _addInterceptors();
  }
  void _addInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (request, handler) {
          // 在发送请求之前做些什么
          handler.next(request); // 继续发送请求
        },
        onResponse: (response, handler) {
          // 在收到响应数据之前做些什么
          if (response.statusCode! >= 200 && response.statusCode! <= 300) {
            handler.next(response);
            return;
          } else {
            handler.reject(
              DioException(requestOptions: response.requestOptions),
            );
          }
        },
        onError: (error, handler) {
          // 当请求发生错误时做些什么
          //return handler.reject(error); // 继续处理错误
          handler.reject(
            DioException(
              requestOptions: error.requestOptions,
              message: error.response?.data['msg'] ?? '请求异常',
            ),
          );
        },
      ),
    );
  }

  Future<dynamic> get(String url, {Map<String, dynamic>? params}) {
    return _handleResponse(_dio.get(url, queryParameters: params));
  }

  Future<dynamic> post(String url, {Map<String, dynamic>? data}) {
    return _handleResponse(_dio.post(url, data: data));
  }

  //进一步处理返回结果的函数
  Future<dynamic> _handleResponse(Future<Response<dynamic>> task) async {
    try {
      Response<dynamic> res = await task;
      final data = res.data as Map<String, dynamic>;
      if (data['code'] == GlobalConstants.SUCCESS) {
        return data['result'];
      } else {
        throw DioException(
          requestOptions: res.requestOptions,
          message: data['msg'] ?? '加载数据异常',
        );
      }
    } on DioException catch (e) {
      rethrow;
    }
  }
}

final dioRequest = DioRequest();
