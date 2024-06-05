import 'package:bloc/bloc.dart';
import 'package:doctor_booking_system/repository/doctor_repository.dart';
import 'package:doctor_booking_system/state/home/home_event.dart';
import 'package:doctor_booking_system/state/home/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final DoctorRepository _doctorRepository;

  HomeBloc({
    required DoctorRepository doctorRepository,
  })  : _doctorRepository = doctorRepository,
        super(HomeState()) {
    on<LoadHomeEvent>(_onLoadHome);
  }

  Future<void> _onLoadHome(LoadHomeEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(homeStatus: HomeStatus.loading));
    try {
      final doctorCategories = await _doctorRepository.fetchDoctorCategories();
      final nearbyDoctors = await _doctorRepository.fetchDoctors();
      emit(state.copyWith(
        homeStatus: HomeStatus.loaded,
        doctorCatagories: doctorCategories,
        nearbyDoctors: nearbyDoctors,
      ));
    } catch (e) {
      emit(state.copyWith(homeStatus: HomeStatus.error));
    }
  }
}
