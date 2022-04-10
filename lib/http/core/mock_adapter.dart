import '../request/base_request.dart';
import 'net_adapter.dart';

///测试适配器，mock数据
class MockAdapter extends IpNetAdapter {
  @override
  Future<IpNetResponse<T>> send<T>(BaseRequest request) async {
    return Future.delayed(Duration(milliseconds: 1000), () {
      return IpNetResponse(
          request: request,
          data: {"code": 0, "message": 'success'} as T,
          statusCode: 403);
    });
  }
}
