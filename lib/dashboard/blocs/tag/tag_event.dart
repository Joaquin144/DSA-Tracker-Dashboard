part of 'tag_bloc.dart';

abstract class TagEvent {
  @override
  List<Object> get props => [];
}

class FetchTags extends TagEvent {}
