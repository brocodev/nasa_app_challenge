import 'package:nasa_app_challenge/core/core.dart';

class PositionIndexCubit extends ValueCubit<int> {
  PositionIndexCubit({required super.value});

  void nextPosition() => emit(state + 1);
}
