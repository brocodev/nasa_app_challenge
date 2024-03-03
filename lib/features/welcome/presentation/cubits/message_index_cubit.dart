import 'package:nasa_app_challenge/core/core.dart';

class MessageIndexCubit extends ValueCubit<int> {
  MessageIndexCubit({required super.value});

  void nextMessage() => emit(state + 1);
}
