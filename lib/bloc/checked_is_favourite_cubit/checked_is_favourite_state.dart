part of 'checked_is_favourite_cubit.dart';

@immutable
sealed class CheckedIsFavouriteState {}

final class CheckedIsFavouriteInitial extends CheckedIsFavouriteState {}

final class AvailableFavourite extends CheckedIsFavouriteState {}

final class NotAvailableFavourite extends CheckedIsFavouriteState {}
