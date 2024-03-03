import 'package:nasa_app_challenge/core/shared/cubits/value_cubit.dart';

class PositionIndexCubit extends ValueCubit<int> {
  PositionIndexCubit({required super.value});

  void nextPosition() => emit(state + 1);
}
