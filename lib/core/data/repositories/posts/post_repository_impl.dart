import '../../domain/network/service/dio_client.dart';
import '../../domain/network/simple_reponse/simple_reponse.dart';
import '../../models/posts/post.dart';
import 'post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final DioClient dioClient;
  const PostRepositoryImpl(this.dioClient);

  @override
  Future<SingleResponse?> getPostDetail(String id) async {
    final response = await dioClient.get(
      'https://jsonplaceholder.typicode.com/posts/$id',
      object: Post(),
    );
    return response;
  }

  @override
  Future<SingleResponse?> getPostsList() async {
    final response = await dioClient.get(
      'https://jsonplaceholder.typicode.com/posts',
      object: Post(),
    );
    return response;
  }
}
