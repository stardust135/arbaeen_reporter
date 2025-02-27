import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../repositories/app_repository.dart';
import '../resources/data_state.dart';
import '../utils/enums.dart';

part 'app_state.dart';

part 'app_event.dart';

class AppBloc extends Bloc<AppEvent, AppState?> {
  AppRepository appRepository;
  Connectivity connectivity = Connectivity();

  AppBloc(this.appRepository) : super(null) {
    on<FetchData>(
      (event, emit) async {
        emit(AppDataInitial(event.whoCalledBloc));

        emit(AppDataLoading(event.whoCalledBloc));

        final connectivityResult = await connectivity.checkConnectivity();
        if (connectivityResult == ConnectivityResult.none) {
          emit(AppDataError(event.whoCalledBloc, 'No internet connection'));
          return;
        }

        DataState dataState =
            await appRepository.fetchData(event.callApiFunction);

        if (dataState is DataSuccess) {
          emit(AppDataCompleted(dataState.data, event.whoCalledBloc));
        }
        if (dataState is DataFailed) {
          emit(AppDataError(event.whoCalledBloc, dataState.error!));
        }
      },
    );
    on<ReplaceWidget>((event, emit) {
      emit(WidgetReplaced(event.whoCalledBloc, event.text));
    });
  }
}
