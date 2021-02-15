
import 'package:flutter_bloc/flutter_bloc.dart';

// o estado é uma única String
// poderia ser um Perfil com diversos valores
class NameCubit extends Cubit<String> {
  NameCubit(String name) : super(name);

  void change(String name) => emit(name);
}
