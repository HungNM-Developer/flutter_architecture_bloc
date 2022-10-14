part of 'posts_cubit.dart';

abstract class PostsState {}

class PostsInitial extends PostsState {}

class PostsLoading extends PostsState {}

class PostsLoadSuccess extends PostsState {
  final List<Post> postList;

  PostsLoadSuccess({this.postList = const []});
}

class PostsLoadEmpty extends PostsState {}

class PostsLoadFailed extends PostsState {
  String message;

  PostsLoadFailed({this.message = ''});
}
