part of 'apods_bloc.dart';

@freezed
class APODsEvent with _$APODsEvent {
  const factory APODsEvent.fetchAPODs({@Default(false) bool refresh}) =
      _FetchAPODs;
}
