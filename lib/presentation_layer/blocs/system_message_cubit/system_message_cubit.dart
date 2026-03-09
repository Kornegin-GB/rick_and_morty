import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'system_message_state.dart';

class SystemMessageCubit extends Cubit<SystemMessageState> {
  SystemMessageCubit() : super(SystemMessageInitial());
}
