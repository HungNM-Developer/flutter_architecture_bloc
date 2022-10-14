import 'package:bloc/bloc.dart';

import '../../../core/data/models/posts/post.dart';
import '../../../core/data/repositories/posts/post_repository.dart';
import '../../../di/injection.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  final _postRepository = getIt<PostRepository>();

  PostsCubit() : super(PostsInitial());

  Future<void> fetchPosts() async {
    final result = await _postRepository.getPostsList();
    if (result?.status != 'ok') emit(PostsLoadFailed(message: ''));
    final posts = List<Post>.from(result?.data as List);
    if (posts.isEmpty) emit(PostsLoadEmpty());
    emit(PostsLoadSuccess(postList: posts));
  }
}
