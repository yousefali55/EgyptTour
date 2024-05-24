part of 'theme_changer_cubit.dart';

@immutable
sealed class ThemeChangerState {}

final class ThemeChangerInitial extends ThemeChangerState {}

class ThemeChangerChanged extends ThemeChangerState {
  final bool isDarkModee;

  ThemeChangerChanged(this.isDarkModee);
}
