import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'keyboard_event.dart';
part 'keyboard_state.dart';

class KeyboardBloc extends Bloc<KeyboardEvent, KeyboardState> {
  KeyboardBloc() : super(KeyboardInitial());

  @override
  Stream<KeyboardState> mapEventToState(
    KeyboardEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
