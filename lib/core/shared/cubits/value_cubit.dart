import 'package:bloc/bloc.dart';

/// Provides a [T] value for the widget tree, use it if you want to listen
/// and modify a single value
class ValueCubit<T> extends Cubit<T> {
  ValueCubit({required T value}) : super(value);

  void change(T value) => emit(value);
}
