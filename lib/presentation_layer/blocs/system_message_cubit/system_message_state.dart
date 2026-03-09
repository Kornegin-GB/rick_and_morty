part of 'system_message_cubit.dart';

sealed class SystemMessageState extends Equatable {
  const SystemMessageState();
}

final class SystemMessageInitial extends SystemMessageState {
  @override
  List<Object> get props => [];
}
