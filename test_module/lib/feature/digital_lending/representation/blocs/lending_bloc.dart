import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LendingBloc extends Cubit<LendingState> {
  LendingBloc() : super(const LendingImpl());

  bool get statusBtn => state.statusBtn ?? true;

  void onClickBtn(bool status) {
    emit(state.copyWith(statusBtn: !status));
  }

  
}

@immutable
abstract class LendingState extends Equatable {
  final bool? statusBtn;

  const LendingState({required this.statusBtn});
  LendingState copyWith({final bool? statusBtn}) {
    return LendingImpl(statusBtn: statusBtn ?? this.statusBtn);
  }
}

class LendingImpl extends LendingState {
  const LendingImpl({final bool? statusBtn}) : super(statusBtn: statusBtn);

  @override
  List<Object?> get props => [statusBtn];
}
