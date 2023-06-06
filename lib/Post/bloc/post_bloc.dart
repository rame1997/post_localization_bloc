import 'dart:async';
import 'package:bloc_localization/Post/model/post.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import '../provider/post_provider.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
part 'post_event.dart';
part 'post_state.dart';



class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostState()) {
    on<PostEvent>((event, emit) async {
      if (event is GetPostsEvent) {
        if (state.hasReachedMax) return;
        try {
          if (state.status == PostStatus.loading) {
            final Posts = await PostProvider.getPosts();
            return Posts.isEmpty
                ? emit(state.copyWith(
                status: PostStatus.success, hasReachedMax: true))
                : emit(state.copyWith(
                status: PostStatus.success,
                posts:Posts,
                hasReachedMax: false));
          } else {
            final Posts = await PostProvider.getPosts(state.posts.length);
            Posts.isEmpty//وصلنا لنهاية البوست
                ? emit(state.copyWith(hasReachedMax: true))
                : emit(state.copyWith(
                status: PostStatus.success,
                posts: List.of(state.posts)..addAll(Posts),
                hasReachedMax: false));
          }
        } catch (e) {
          print("fjhjf"+e.toString());
          emit(state.copyWith(
              status: PostStatus.error, errorMessage: "failed to fetch Post"));
        }
      }
    },
       //هادا بيحدد كيف يتعامل البلوك مع الااحداث
        //و لو ضيفت اكتر من حدث حيتعامل معاهم البلوك بشكل متوازي بشكل تلقائي
        //علشان هيك بدنا نغيير في التعامل عن طريق باكج bloc_concurrency
       //في اكثر من حالة بتدعم هادي المكتبة اربع انواع هان بالحالة هادي بنحتاج لل
        transformer: droppable());
  }
}
