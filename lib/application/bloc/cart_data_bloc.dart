import 'package:cart_demo/core/example_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_data_event.dart';
part 'cart_data_state.dart';
part 'cart_data_bloc.freezed.dart';

class CartDataBloc extends Bloc<CartDataEvent, CartDataState> {
  CartDataBloc() : super(CartDataState.initial()) {
    List<ExampleData> values = [];
    on<Added>((event, emit) {
      values.add(event.data);
      emit(state.copyWith(data: values));
    });

    on<Increment>((event, emit) {
      if (values.isNotEmpty) {
        int index =
            values.indexWhere((element) => element.name == event.data.name);
        values[index].count += 1;
      }

      emit(state.copyWith(data: values, isUpdated: !state.isUpdated));
    });
    on<Decrement>((event, emit) {
      if (values.isNotEmpty) {
        int index =
            values.indexWhere((element) => element.name == event.data.name);
        if (values[index].count == 1) {
          values.removeAt(index);
        } else {
          values[index].count -= 1;
        }
      }
      emit(state.copyWith(data: values, isUpdated: !state.isUpdated));
    });
  }
}
