import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopfood/blocs/cart/cart_bloc.dart';
import 'package:shopfood/models/models.dart';
import 'package:shopfood/repositories/checkout/checkout_repository.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final CartBloc _cartBloc;
  final CheckoutRepository _checkoutRepository;
  StreamSubscription? _cartSubscription;
  StreamSubscription? _checkoutSubscription;

  CheckoutBloc({
    required CartBloc cartBloc,
    required CheckoutRepository checkoutRepository,
  })  : _cartBloc = cartBloc,
        _checkoutRepository = checkoutRepository,
        super(
        cartBloc.state is CartLoaded
            ? CheckoutLoaded(
          products: (cartBloc.state as CartLoaded).cart.products,
          deliveryFree: (cartBloc.state as CartLoaded).cart.deliveryFreeString,
          subtotal: (cartBloc.state as CartLoaded).cart.subtotalString,
          total: (cartBloc.state as CartLoaded).cart.totalString,
        )
            : CheckoutLoading()) {
              on<UpdateCheckout>(_onUpdateCheckout);
              on<ConfirmCheckout>(_onConfirmCheckout);


    _cartSubscription = cartBloc.stream.listen((state) {
      if (state is CartLoaded)
        add(UpdateCheckout(cart: state.cart),
        );
    });
  }

  void _onUpdateCheckout(
      UpdateCheckout event,
      Emitter<CheckoutState> emit,
      ) {
    final state = this.state;
    if (state is CheckoutLoaded) {
      emit (
          CheckoutLoaded(
        email: event.email ?? state.email,
        fullName: event.fullName ?? state.fullName,
        products: event.cart?.products ?? state.products,
        deliveryFree: event.cart?.deliveryFreeString ?? state.deliveryFree,
        subtotal: event.cart?.subtotalString ?? state.subtotal,
        total: event.cart?.totalString ?? state.total,
        address: event.address ?? state.address,
        telephone: event.telephone ?? state.telephone,
        zipCode: event.zipCode ?? state.zipCode,
      ));
    }
  }

  void _onConfirmCheckout(
      ConfirmCheckout event,
      Emitter <CheckoutState> emit,
      ) async {
    _checkoutSubscription?.cancel();
    if (state is CheckoutLoaded) {
      try {
        await _checkoutRepository.addCheckout(event.checkout);
        print('Done');
        emit (CheckoutLoading());
      } catch (_) {}
    }
  }
}