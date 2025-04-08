part of 'view_error_cubit.dart';

sealed class ViewErrorState {}

final class ViewErrorInitial extends ViewErrorState {}

final class ViewErrorMessage extends ViewErrorState {
  final AnswerError errorMessage;

  ViewErrorMessage({required this.errorMessage});
}
