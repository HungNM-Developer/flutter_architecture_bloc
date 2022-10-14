import 'package:bloc/bloc.dart';

import '../../../core/data/models/posts/post.dart';
import '../../../core/data/repositories/posts/post_repository.dart';
import '../../../di/injection.dart';

part 'post_detail_state.dart';

class PostDetailCubit extends Cubit<PostDetailState> {
  final _postRepository = getIt<PostRepository>();

  PostDetailCubit() : super(PostDetailInitial());

  Future<void> getDetailPost(String id) async {
    final result = await _postRepository.getPostDetail(id);
    if (result?.status == 'ok') {
      emit(PostDetailLoadSuccess(post: result?.data!.single));
    } else {
      emit(PostDetailLoadFailed());
    }
  }
}
