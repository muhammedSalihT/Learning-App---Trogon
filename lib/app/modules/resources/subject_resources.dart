import 'package:lms_app/app/constents/const_urls.dart';
import 'package:lms_app/app/services/api_service.dart';
import 'package:lms_app/app/utils/util_enum.dart';

class SubjectResources {
  static Future<ApiResponce> getSubjectDataApi() async {
    try {
      return await ApiService.call(
        method: ApiMethod.get,
        url: ConstUrls.subjectUrl,
      );
    } catch (e) {
      return ApiResponce(ApiResponceType.internalException, {'error': e});
    }
  }
}
