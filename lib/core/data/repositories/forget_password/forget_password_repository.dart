import '../../../domain/network/response/api_response.dart';

abstract class ForgetPasswordRepository {
  Future<ApiResponse<bool>> restore({required String email});
}
