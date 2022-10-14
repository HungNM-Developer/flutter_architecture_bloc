part of 'post_detail_cubit.dart';

abstract class PostDetailState {}

class PostDetailInitial extends PostDetailState {}

class PostDetailLoading extends PostDetailState {}

class PostDetailLoadSuccess extends PostDetailState {
  final Post post;

  PostDetailLoadSuccess({required this.post});
}

class PostDetailLoadFailed extends PostDetailState {
  String message;

  PostDetailLoadFailed({this.message = ''});
}
