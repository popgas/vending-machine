import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vending_machine/bootstrap.dart';
import 'package:vending_machine/domain/enums/order_product_selected.dart';
import 'package:vending_machine/presentation/abstractions/new_order_intent.dart';
import 'package:vending_machine/presentation/views/screens/place_container_instructions/place_container_instructions_view.dart';
import 'package:vending_machine/presentation/views/screens/product_selection/product_selection_view_state.dart';

class ProductSelectionService {
  final dio = getIt<Dio>();
  final state = ProductSelectionViewState();
  final player = AudioPlayer();

  Future<void> init() async {
    state.update(fetchingPrices: true);

    var storage = await SharedPreferences.getInstance();
    var id = storage.getString("vending_machine_id");

    var result = await dio.get('/vending-machine-orders/$id/prices');

    var gasRefillPrice = (result.data['gas_refill_price'] as num).toDouble();
    var containerPrice = (result.data['container_price'] as num).toDouble();

    state.update(
        fetchingPrices: false,
        gasRefillPrice: gasRefillPrice,
        gasWithContainerPrice: gasRefillPrice + containerPrice
    );

    await Future.delayed(const Duration(seconds: 1));

    await player.play(AssetSource('product_selection/audio.mp3'));
  }

  Future<void> refillSelected() async {
    player.stop();

    Get.to(() => PlaceContainerInstructionsView(
      orderIntent: NewOrderIntent(
        productSelected: OrderProductSelected.onlyGasRefill,
        productPrice: state.gasRefillPrice,
      ),
    ));
  }

  Future<void> gasWithContainerSelected() async {
    player.stop();

    Get.to(() => PlaceContainerInstructionsView(
      orderIntent: NewOrderIntent(
        productSelected: OrderProductSelected.gasWithContainer,
        productPrice: state.gasWithContainerPrice,
      ),
    ));
  }
}
