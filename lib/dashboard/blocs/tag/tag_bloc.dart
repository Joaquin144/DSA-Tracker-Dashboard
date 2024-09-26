import 'package:bloc/bloc.dart';
import 'package:dsa_tracker/dashboard/models/tag_model.dart';
import 'package:dsa_tracker/dashboard/repositories/tag_repository.dart';

part 'tag_event.dart';
part 'tag_state.dart';

class TagBloc extends Bloc<TagEvent, TagState> {
  final TagRepository _tagRepository;

  TagBloc(this._tagRepository) : super(TagInitial()) {
    on<FetchTags>((event, emit) async {
      try {
        emit(TagLoading());
        final tags = await _tagRepository.fetchTags();
        emit(TagLoaded(tags: tags));
      } catch (e) {
        emit(TagError(error: 'Failed to fetch tags: $e'));
      }
    });
  }
}
