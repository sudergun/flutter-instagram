part of 'post_bloc.dart';

@immutable
abstract class PostState {
  const PostState();
}

class PostInitial extends PostState {}

class PostInProgress extends PostState {}

class PostSuccess extends PostState {
  final List<StoryModel> StoryModels;

  const PostSuccess({
    required this.StoryModels,
  });
}

class PostError extends PostState {
  final String? message;

  const PostError({this.message});
}
