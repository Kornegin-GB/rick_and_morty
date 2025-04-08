import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/services/answer_error.dart';

part 'view_error_state.dart';

class ViewErrorCubit extends Cubit<ViewErrorState> {
  ViewErrorCubit() : super(ViewErrorInitial());

  void showErrorMessage({required AnswerError message}) {
    emit(ViewErrorMessage(errorMessage: message));
  }
}
