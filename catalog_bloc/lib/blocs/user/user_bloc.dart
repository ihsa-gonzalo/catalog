import 'dart:async';

import 'package:catalog_bloc/blocs/user/user_event.dart';
import 'package:catalog_bloc/blocs/user/user_state.dart';

class UserBloc {
  //Crear una variable privada de tipo UserState().
  UserState _userState = UserState();
//Crear dos variables privadas de tipo StreamController().

  StreamController<UserEvent> _input = StreamController();
  StreamController<String> _output = StreamController();
//Exponer sink y stream mediante getters, esto es para que la vistas puedan enviar eventos y escuchar los cambios.
  StreamSink<UserEvent> get sendEvent => _input.sink;
  Stream<String> get userStream => _output.stream;
//Crear un constructor que escuche los eventos.

  UserBloc() {
    _input.stream.listen(_onEvent);
  }
//Crear un método privado _onEvent que se encargue de procesar los eventos que escucha el _input.stream.
  void _onEvent(UserEvent event) {
    if (event is OnChangeEvent) {
      _userState.onChange(event.value);
    }

    _output.add(_userState.username);
  }
//Liberar los recursos de los StreamController() cuando no se los necesite con un dispose.
  void dispose() {
    _input.close();
    _output.close();
  }
}
