import 'package:lms_app/app/constents/const_urls.dart';
import 'package:lms_app/app/services/api_service.dart';
import 'package:lms_app/app/utils/util_enum.dart';

class ChapterResources {
  static Future<ApiResponce> getChapterDataApi({required int subId}) async {
    try {
      return await ApiService.call(
          method: ApiMethod.get,
          url: ConstUrls.chapterUrl,
          queryParameters: {'subject_id': subId});
    } catch (e) {
      return ApiResponce(ApiResponceType.internalException, {'error': e});
    }
  }
}
