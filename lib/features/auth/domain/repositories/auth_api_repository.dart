import 'package:presensi_selfie/features/auth/application/dtos/login_dto.dart';
import 'package:presensi_selfie/features/auth/application/dtos/update_area_dto.dart';

abstract class AuthApiRepository {
  // Login user
  Future<Map<String, dynamic>> login(LoginDTO dto);

  // Update area untuk SA
  Future<Map<String, dynamic>> updateArea(UpdateAreaDTO dto);
}
