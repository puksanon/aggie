part of './plan_cubit.dart';

abstract class PlanState extends Equatable {
  const PlanState();
}

class PlanStateInit extends PlanState {
  @override
  List<Object> get props => [];
}

class PlanStateLoading extends PlanState {
  @override
  List<Object> get props => [];
}

class PlanLoaded extends PlanState {
  final List<Plan> plans;

  PlanLoaded({this.plans});

  @override
  List<Object> get props => [plans];
}

class PlanStateErrors extends PlanState {
  final String message;

  PlanStateErrors({this.message});

  @override
  List<Object> get props => [message];
}
