import 'package:dio/dio.dart';
import 'package:vending_machine/bootstrap.dart';

class SecurityVerificationService {
  final dio = getIt<Dio>();

  Future<void> init() async {
  }
}