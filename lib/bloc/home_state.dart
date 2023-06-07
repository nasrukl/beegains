part of 'home_bloc.dart';

class HomeState {
  final bool isApiFetching;
  final UserModel? result;

  HomeState({
    required this.isApiFetching,
    this.result,
  });
}

class HomeInitial extends HomeState {
  HomeInitial({required super.isApiFetching});
}
