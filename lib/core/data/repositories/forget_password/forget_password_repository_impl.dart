import '../../domain/network/response/api_response.dart';
import '../../domain/network/service/dio_client.dart';
import 'forget_password_repository.dart';

class ForgetPasswordRepositoryImplement implements ForgetPasswordRepository {
  // ignore: avoid_unused_constructor_parameters
  const ForgetPasswordRepositoryImplement(DioClient dioClient);
  @override
  Future<ApiResponse> restore({required String email}) {
    return Future.delayed(
      const Duration(milliseconds: 300),
      () => const ApiResponse(),
    );
  }
}
