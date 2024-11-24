import 'package:lms_app/app/constents/const_urls.dart';
import 'package:lms_app/app/services/api_service.dart';
import 'package:lms_app/app/utils/util_enum.dart';

class VedioplayerResources {
  static Future<ApiResponce> getVedioDataApi({required int chaptId}) async {
    try {
      return await ApiService.call(
          method: ApiMethod.get,
          url: ConstUrls.vedioUrl,
          queryParameters: {'module_id': chaptId});
    } catch (e) {
      return ApiResponce(ApiResponceType.internalException, {'error': e});
    }
  }
}
