part of 'tag_bloc.dart';

abstract class TagState {
  const TagState();

  @override
  List<Object> get props => [];
}

class TagInitial extends TagState {}

class TagLoading extends TagState {}

class TagLoaded extends TagState {
  final List<TagModel> tags;

  TagLoaded({required this.tags});

  @override
  List<Object> get props => [tags];
}

class TagError extends TagState {
  final String error;

  TagError({required this.error});

  @override
  List<Object> get props => [error];
}
