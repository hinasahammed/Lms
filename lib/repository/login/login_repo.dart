import 'package:lms/data/network/network_api_services.dart';
import 'package:lms/res/appUrl/app_url.dart';

class LoginRepository {
  final _api = NetworkApiServices();

  Future<dynamic> login(dynamic data) async {
    var result = await _api.postApi(
      AppUrl.login,
      data,
    );
    return result;
  }
}
