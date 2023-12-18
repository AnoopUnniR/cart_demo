part of 'cart_data_bloc.dart';

@freezed
class CartDataEvent with _$CartDataEvent {
  const factory CartDataEvent.started() = _Started;
  const factory CartDataEvent.added({required ExampleData data}) = Added;
  const factory CartDataEvent.increment({required ExampleData data}) =
      Increment;
  const factory CartDataEvent.decrement({required ExampleData data}) =
      Decrement;
}
