import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopfood/blocs/category/category_bloc.dart';
import 'package:shopfood/blocs/checkout/checkout_bloc.dart';
import 'package:shopfood/blocs/product/product_bloc.dart';
import 'package:shopfood/blocs/wishlist/wishlist_bloc.dart';
import 'package:shopfood/config/app_router.dart';
import 'package:shopfood/config/theme.dart';
import 'package:shopfood/repositories/category/category_reposition.dart';
import 'package:shopfood/repositories/checkout/checkout_repository.dart';
import 'package:shopfood/repositories/product/product_repository.dart';
import 'package:shopfood/screens/checkout/checkout_screen.dart';
import 'package:shopfood/screens/home/home_screen.dart';
import 'package:shopfood/screens/information/information_screen.dart';
import 'package:shopfood/screens/login/login_screen.dart';
import 'package:shopfood/screens/order_confirmation_screen/order_confirmation.dart';
import 'package:shopfood/simple_bloc_observer.dart';

import 'blocs/cart/cart_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          appId: '1:750165052968:android:073693d5b360b81aadaf1d',
          messagingSenderId: '750165052968',
          apiKey: 'AIzaSyB0lPmbXupu0aCK7U5dT8ySyZL3E2592qE',
          projectId: 'flutter-shop-2022'));

  BlocOverrides.runZoned(
    () {
      runApp(const MyApp());
    },
    blocObserver: SimpleBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CartBloc()..add(LoadCart())),
        BlocProvider(
            create: (context) => CheckoutBloc(
                cartBloc: context.read<CartBloc>(),
                checkoutRepository: CheckoutRepository())),
        BlocProvider(create: (_) => WishlistBloc()..add(LoadWishList())),
        BlocProvider(
          create: (_) => CategoryBloc(
            categoryRepository: CategoryRepository(),
          )..add(LoadCategories()),
        ),
        BlocProvider(
          create: (_) => ProductBloc(
            productRepository: ProductRepository(),
          )..add(LoadProducts()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Green Food',
        theme: theme(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: LoginScreen.routeName,
      ),
    );
  }
}
