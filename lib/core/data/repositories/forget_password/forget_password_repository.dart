import '../../domain/network/response/api_response.dart';

abstract class ForgetPasswordRepository {
  Future<ApiResponse> restore({required String email});
}
