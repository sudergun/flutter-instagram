import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

import '../../model/story_model.dart';

part 'post_event.dart';

part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<GetPosts>(onGetPosts);
    on<PostFinished>(onPostFinished);
    getPosts();

    ;
  }

  var http = Client();

  void getPosts() async {
    Uri url = Uri.https('jsonplaceholder.typicode.com', 'posts');
    add(const GetPosts());
    try {
      var response = await http.get(url);
      var json = jsonDecode(utf8.decode(response.bodyBytes)) as List;
      List<StoryModel> storyModels =
          json.map((model) => StoryModel.fromJson(model)).toList();
      add(PostFinished(storyModels: storyModels));
    } catch (e) {
      add(PostFinished(message: e.toString()));
    }
  }

  void onGetPosts(
    PostEvent event,
    Emitter<PostState> emit,
  ) async {
    emit(PostInProgress());
  }

  void onPostFinished(
    PostFinished event,
    Emitter<PostState> emit,
  ) {
    if (event.storyModels != null) {
      emit(PostSuccess(StoryModels: event.storyModels!));
    } else {
      emit(PostError(message: event.message));
    }
  }
}
