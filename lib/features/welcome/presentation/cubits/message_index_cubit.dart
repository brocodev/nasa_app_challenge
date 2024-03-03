import 'package:nasa_app_challenge/core/shared/cubits/value_cubit.dart';

class MessageIndexCubit extends ValueCubit<int> {
  MessageIndexCubit({required super.value});

  void nextMessage() => emit(state + 1);
}
