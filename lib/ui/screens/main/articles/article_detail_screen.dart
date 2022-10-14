import 'package:flutter/material.dart';
import 'package:flutter_architecture_bloc/states/cubit/post_detail/post_detail_cubit.dart';
import 'package:flutter_architecture_bloc/ui/widgets/app_circular_progress_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/app_colors.dart';
import '../../../../core/data/models/posts/post.dart';
import '../../../../di/injection.dart';

class ArticleDetailScreen extends StatelessWidget {
  final String id;
  ArticleDetailScreen({
    super.key,
    required this.id,
  });
  final _postDetailCubit = getIt<PostDetailCubit>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.violet,
        title: const Text('Post'),
      ),
      body: BlocBuilder<PostDetailCubit, PostDetailState>(
        bloc: _postDetailCubit..getDetailPost(id),
        builder: (context, state) {
          if (state is PostDetailInitial || state is PostDetailLoading) {
            return const Center(
              child: AppCircularProgressIndicator(),
            );
          }
          Post? postDetail;
          if (state is PostDetailLoadSuccess) {
            postDetail = state.post;
          }
          return ListTile(
            leading: Text(postDetail!.id.toString()),
            subtitle: Text(postDetail.body.toString()),
            title: Text(postDetail.title.toString()),
          );
        },
      ),
    );
  }
}
