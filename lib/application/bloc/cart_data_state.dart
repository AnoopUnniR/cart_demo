part of 'cart_data_bloc.dart';

@freezed
class CartDataState with _$CartDataState {
  const factory CartDataState.start({
    required  List<ExampleData> data,
    required bool isUpdated,
  }) = Start;
   factory CartDataState.initial() => const CartDataState.start(data: [],isUpdated: false);
}
