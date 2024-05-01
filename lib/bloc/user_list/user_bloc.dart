import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hush_day/model/demo_model.dart';
import 'package:hush_day/service/bloc_service.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserService _userService;

  UserBloc(this._userService) : super(UserLoadingState()) {
    on<LoadUserEvent>((event, emit) async {
      emit(UserLoadingState());
     try {
        final user = await _userService.getApi();
        print("userr:${user.toString()}");
        emit(UserLoadedState(user));
      } catch (e) {
        emit(UserErrorState(e.toString()));
      }
    });
  }
}