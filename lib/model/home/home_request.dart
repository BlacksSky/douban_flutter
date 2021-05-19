import '../../service/http_request.dart';
import '../../service/config.dart';
import 'home_model.dart';

class ZYHomeRequest {
  static Future<ZYHomeListModel> requestHotVideo({int offset}) async {
    final result = await requestHomeList("billboard", "hot_video",offset: offset);
    ZYHomeListModel listModel = ZYHomeListModel.fromJson(result);
    return listModel;
  }

  static Future<T> requestHomeList<T>(String url, String type,
      {int offset}) async {

    Map<String,dynamic> params = {
      "type":type,
      "size":ZYHomeConfig.HomeListCount,
      "offset":offset,
    };

    final result = await ZYHttpRequest.request(url,params: params);
    return result;
  }
}
