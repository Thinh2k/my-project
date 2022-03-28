import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shopfood/models/models.dart';

import '../../models/product_model.dart';
import '../../models/wishlist_model.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistLoading()){
    on<LoadWishList>(_onLoadWishList);
    on<AddProductToWishList>(_onAddProductToWishList);
    on<RemoveProductFromWishList>(_onRemoveProductFromWishList);
  }
  void _onLoadWishList(event, Emitter<WishlistState> emit) async{
    emit (WishlistLoading());
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      emit (WishlistLoaded());
    } catch (_) {
    emit (WishlistError());
    }
  }
  void _onAddProductToWishList(event, Emitter<WishlistState> emit) {
    final state = this.state;
    if (state is WishlistLoaded) {
      try {
        emit (WishlistLoaded(
            wishlist: Wishlist(
            products: List.from(state.wishlist.products)..add(event.product),
         ),
        ),);
    } on Exception {
    emit (WishlistError());
    }
  }
  }
  void _onRemoveProductFromWishList(event, Emitter<WishlistState> emit) {
    final state = this.state;
    if (state is WishlistLoaded) {
      try {
        emit (WishlistLoaded(
          wishlist: Wishlist(
            products: List.from(state.wishlist.products)..remove(event.product),
          ),
        ),);
      } on Exception {
        emit (WishlistError());
      }
    }
  }
}