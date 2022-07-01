

part of 'cubit_controller.dart';

enum HomeStatus { inital, loading, success, error }

class HomeState extends Equatable {
  final HomeStatus status;
  final SpaceMediaEntity? spaceMediaModel;
  final Failure? error;
  const HomeState._({
    required this.status,
    this.spaceMediaModel,
    this.error,
  });

  const HomeState.inital()
      : this._(
        status: HomeStatus.inital,
        spaceMediaModel: null,
        error: null,
      );

  @override
  List<Object?> get props => [status, spaceMediaModel, error];

  HomeState copyWith({
    HomeStatus? status,
    SpaceMediaEntity? spaceMediaModel,
    Failure? error,
  }) {
    return HomeState._(
      status: status ?? this.status,
      spaceMediaModel: spaceMediaModel ?? this.spaceMediaModel,
      error: error ?? this.error,
    );
  }
}
