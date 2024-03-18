import 'package:lms/data/network/network_api_services.dart';
import 'package:lms/res/appUrl/app_url.dart';

class ResetPasswordRepo {
  final _api = NetworkApiServices();

  Future<dynamic> forgetPassword(dynamic data) async {
    var result = await _api.postApi(
      AppUrl.forgetPassword,
      data,
    );
    return result;
  }
}
