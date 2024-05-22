part of 'city_informations_cubit.dart';

sealed class CityInformationsState {}

@immutable
final class CityInformationsInitial extends CityInformationsState {}

final class CityInformationsLoading extends CityInformationsState {}

final class CityInformationsSuccess extends CityInformationsState {
  final Governorate governorate;

  CityInformationsSuccess({required this.governorate});

}

final class CityInformationsFailure extends CityInformationsState {
  final String errorMessge;

  CityInformationsFailure({required this.errorMessge});
}
