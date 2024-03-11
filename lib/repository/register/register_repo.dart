import 'package:lms/data/network/network_api_services.dart';
import 'package:lms/res/appUrl/app_url.dart';

class RegisterRepository {
  final _api = NetworkApiServices();

  Future<dynamic> register(dynamic data) async {
    var result = await _api.postApi(
      AppUrl.register,
      data,
    );
    return result;
  }
}
