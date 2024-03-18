import 'package:lms/data/network/network_api_services.dart';
import 'package:lms/res/appUrl/app_url.dart';

class EditProfileRepo {
  final _api = NetworkApiServices();

  Future<dynamic> updateUsername(dynamic data) async {
    var result = await _api.postApi(
      AppUrl.updateUsername,
      data,
    );
    return result;
  }
}
