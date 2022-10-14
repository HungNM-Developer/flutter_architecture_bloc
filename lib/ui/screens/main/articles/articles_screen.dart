import 'package:flutter/material.dart';
import 'package:flutter_architecture_bloc/config/app_colors.dart';
import 'package:flutter_architecture_bloc/core/routes/route_name.dart';
import 'package:flutter_architecture_bloc/states/cubit/posts/posts_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/data/models/posts/post.dart';
import '../../../widgets/app_circular_progress_indicator.dart';

class ArticlesScreen extends StatelessWidget {
  const ArticlesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.violet,
        title: const Text('Home'),
      ),
      body: BlocBuilder<PostsCubit, PostsState>(
        builder: (context, state) {
          if (state is PostsInitial || state is PostsLoading) {
            return const Center(
              child: AppCircularProgressIndicator(),
            );
          }
          if (state is PostsLoadSuccess) {
            List<Post> posts = [];
            posts.addAll(state.postList);
            return ListView.separated(
              //shrinkWrap: true,
              padding: REdgeInsets.all(16),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    context.pushNamed(
                      RouteName.detailArticleScreen,
                      extra: posts[index].id,
                    );
                  },
                  child: ListTile(
                    leading: Text(
                      posts[index].id.toString(),
                    ),
                    title: Text(
                      posts[index].title.toString(),
                    ),
                    subtitle: Text(
                      posts[index].body.toString(),
                    ),
                  ),
                );
              },
              itemCount: posts.length,
              separatorBuilder: (BuildContext context, int index) {
                return 14.verticalSpace;
              },
            );
          } else if (state is PostsLoadEmpty) {
            return const Center(child: Text('No Data'));
          } else {
            return const Center(child: Text(''));
          }
        },
      ),
    );
  }
}
