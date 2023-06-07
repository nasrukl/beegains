import 'package:beegains/model/model.dart';
import 'package:beegains/services/api_services.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final String token;
  HomeBloc({required this.token}) : super(HomeInitial(isApiFetching: false)) {
    on<FetchApiEvent>((event, emit) async {
      emit(HomeState(isApiFetching: true));
      final data = await ApiServices.getapi(token);
      emit(HomeState(isApiFetching: false, result: data));
    });
  }
}
