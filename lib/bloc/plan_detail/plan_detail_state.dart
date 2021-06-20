part of './plan_detail_cubit.dart';

abstract class PlanDetailState extends Equatable {
  const PlanDetailState();
}

class PlanStateInit extends PlanDetailState {
  @override
  List<Object> get props => [];
}

class PlanDetailStateLoading extends PlanDetailState {
  @override
  List<Object> get props => [];
}

class PlanDetailLoaded extends PlanDetailState {
  final Plan plan;

  PlanDetailLoaded({this.plan});

  @override
  List<Object> get props => [plan];
}

class PlanDetailStateErrors extends PlanDetailState {
  final String message;

  PlanDetailStateErrors({this.message});

  @override
  List<Object> get props => [message];
}
