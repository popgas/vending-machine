import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vending_machine/bootstrap.dart';
import 'package:vending_machine/domain/enums/order_product_selected.dart';
import 'package:vending_machine/presentation/abstractions/new_order_intent.dart';
import 'package:vending_machine/presentation/views/screens/payment_selection/payment_selection_view.dart';
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
    var containerFullStockCount = (result.data['container_full_stock_count'] as num).toInt();

    state.update(
        fetchingPrices: false,
        gasRefillPrice: gasRefillPrice,
        gasWithContainerPrice: gasRefillPrice + containerPrice,
        stockCount: containerFullStockCount,
    );

    await player.play(AssetSource('product_selection/audio.mp3'));
  }

  Future<void> refillSelected() async {
    await player.stop();

    Get.to(() => PlaceContainerInstructionsView(
      orderIntent: NewOrderIntent(
        productSelected: OrderProductSelected.onlyGasRefill,
        productPrice: state.gasRefillPrice,
        stockCount: state.stockCount,
      ),
    ));
  }

  Future<void> gasWithContainerSelected() async {
    await player.stop();

    Get.to(() => PaymentSelectionView(orderIntent: NewOrderIntent(
      productSelected: OrderProductSelected.gasWithContainer,
      productPrice: state.gasWithContainerPrice,
      stockCount: state.stockCount,
    )));
  }
}
