import 'package:dio/dio.dart';
import 'package:vending_machine/bootstrap.dart';

class PixPaymentService {
  final dio = getIt<Dio>();

  Future<void> init() async {
  }
}