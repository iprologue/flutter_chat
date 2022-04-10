import '../request/base_request.dart';
import 'dio_adapter.dart';
import 'pro_error.dart';
import 'net_adapter.dart';

///1.支持网络库插拔设计，且不干扰业务层
///2.基于配置请求请求，简洁易用
///3.Adapter设计，扩展性强
///4.统一异常和返回处理
class ProNet {
  ProNet._();
  static ProNet? _instance;

  static ProNet getInstance() {
    _instance ??= ProNet._();
    return _instance!;
  }

  Future fire(BaseRequest request) async {
    IpNetResponse? response;
    var error;
    try {
      response = await send(request);
    } on ProNetError catch (e) {
      error = e;
      response = e.data;
      printLog(e.message);
    } catch (e) {
      //其它异常
      error = e;
      printLog(e);
    }
    if (response == null) {
      printLog(error);
    }
    var result = response?.data;
    printLog(result);
    var status = response?.statusCode;
    switch (status) {
      case 200:
        return result;
      case 401:
        throw NeedLogin();
      case 403:
        throw NeedAuth(result.toString(), data: result);
      default:
        throw ProNetError(status ?? -1, result.toString(), data: result);
    }
  }

  Future<IpNetResponse<T>> send<T>(BaseRequest request) async {
    ///使用Dio发送请求
    IpNetAdapter adapter = DioAdapter();
    return adapter.send(request);
  }

  void printLog(log) {
    print('ip_net:' + log.toString());
  }
}
