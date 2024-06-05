import 'package:doctor_booking_system/packages/models/lib/models.dart';

class DoctorRepository {
  const DoctorRepository(
      //TODO: Inject the required dependencies
      //e.g. class to connect with the db
      );
  Future<List<DoctorCategory>> fetchDoctorCategories() async {
    await Future.delayed(const Duration(microseconds: 1000));
    return DoctorCategory.values;
  }

  Future<List<Doctor>> fetchDoctors() async {
    await Future.delayed(const Duration(microseconds: 1000));
    return Doctor.sampleDoctors;
  }

  Future<List<Doctor>> fetchDoctorsByCategory(String categoryId) async {
    throw UnimplementedError();
  }

  Future<Doctor?> fetchDoctorById(String doctorId) {
    throw UnimplementedError();
  }
}
