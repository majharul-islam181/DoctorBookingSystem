// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:equatable/equatable.dart';

import 'package:doctor_booking_system/packages/models/lib/models.dart';

enum HomeStatus { initial, loading, loaded, error }

class HomeState extends Equatable {
  HomeStatus homeStatus;
  final List<DoctorCategory> doctorCatagories;
  final List<Doctor> nearbyDoctors;
  final List myAppointments;
  HomeState({
    this.homeStatus = HomeStatus.initial,
    this.doctorCatagories = const <DoctorCategory>[],
    this.nearbyDoctors = const <Doctor>[],
    this.myAppointments = const [],
  });

  HomeState copyWith({
    HomeStatus? homeStatus,
    List<DoctorCategory>? doctorCatagories,
    List<Doctor>? nearbyDoctors,
    List? myAppointments,
  }) {
    return HomeState(
      homeStatus: homeStatus ?? this.homeStatus,
      doctorCatagories: doctorCatagories ?? this.doctorCatagories,
      nearbyDoctors: nearbyDoctors ?? this.nearbyDoctors,
      myAppointments: myAppointments ?? this.myAppointments,
    );
  }

  @override
  List<Object?> get props =>
      [homeStatus, doctorCatagories, nearbyDoctors, myAppointments];
}
