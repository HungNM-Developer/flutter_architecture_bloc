import '../../domain/network/simple_reponse/simple_reponse.dart';

abstract class PostRepository {
  Future<SingleResponse?> getPostsList();
  Future<SingleResponse?> getPostDetail(String id);
}
