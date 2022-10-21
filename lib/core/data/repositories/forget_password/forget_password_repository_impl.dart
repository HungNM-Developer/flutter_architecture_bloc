import '../../domain/network/service/dio_client.dart';
import '../../domain/network/simple_reponse/simple_reponse.dart';
import 'forget_password_repository.dart';

class ForgetPasswordRepositoryImplement implements ForgetPasswordRepository {
  // ignore: avoid_unused_constructor_parameters
  const ForgetPasswordRepositoryImplement(DioClient dioClient);
  @override
  Future<SingleResponse<bool>> restore({required String email}) {
    return Future.delayed(
      const Duration(milliseconds: 300),
      () => SingleResponse<bool>(),
    );
  }
}
