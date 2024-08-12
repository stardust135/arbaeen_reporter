import 'package:arbaeen_reporter/core/constants/constants.dart';
import 'package:dio/dio.dart';

class ApiManager {
  final Dio _dio;
  final Constants _constants = Constants();

  ApiManager(this._dio);

  Future<dynamic> fetchReportScreenData() async {
    try {
      // var response = await _dio.post(
      //   _apiRoutes.subjectBooks(),
      //   options: await ApiConstants.getDioHeaders(),
      //   data: {
      //     // todo بعدا ببین این پارامتر ها چین و به چه دردی می خورن تا طبق نیاز ست بشن
      //     "LabelId": subjectId,
      //     "Language": userLang,
      //     "PageSize": 10,
      //     // todo should implement pagination...
      //     "PageIndex": 0,
      //     "OrderFieldName": "Id",
      //     "OrderIsDescending": true
      //   },
      // );
      // if (response.statusCode == 200) {
      //   return DataSuccess(SubjectBooksModel.fromJson(response.data));
      // } else {
      //   return DataFailed(response.data);
      // }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
