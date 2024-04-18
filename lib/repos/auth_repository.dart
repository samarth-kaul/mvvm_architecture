import 'package:mvvm_architecture/data/network/base_api_services.dart';
import 'package:mvvm_architecture/data/network/network_api_service.dart';
import 'package:mvvm_architecture/resources/app_urls.dart';

class AuthRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.loginEndPoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.registerEndPoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
