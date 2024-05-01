import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hush_day/model/joke_model.dart';
import 'package:hush_day/service/bloc_service.dart';
import 'package:meta/meta.dart';


part 'joke_event.dart';
part 'joke_state.dart';

class JokeBloc extends Bloc<JokeEvent, JokeState> {
  final JokeRepository _jokeRepository;

  JokeBloc(this._jokeRepository) : super(JokeLoadingState()) {
    on<LoadJokeEvent>((event, emit) async {
      emit(JokeLoadingState());
      try {
        final joke = await _jokeRepository.getJoke();
        emit(JokeLoadedState(joke));
      } catch (e) {
        emit(JokeErrorState(e.toString()));
      }
    });
  }
}