import 'dart:developer';

import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/resources/ui_utils/ui_utils.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/cart_item_widget.dart';
import '../widgets/total_price_and_checkout_botton.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late CartCubit cartCubit;
  @override
  void initState() {
    super.initState();
    cartCubit=context.read<CartCubit>();
    cartCubit.getCart();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart',
          style: getMediumStyle(fontSize: 20, color: ColorManager.textColor),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: ImageIcon(
              AssetImage(
                IconsAssets.icSearch,
              ),
              color: ColorManager.primary,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: ImageIcon(
              AssetImage(IconsAssets.icCart),
              color: ColorManager.primary,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p14),
          child: BlocConsumer<CartCubit,CartState>(
            listener: (context,state){
              if(state is UpdateCartProductQuantityLoading|| state is DeleteProductFromCartLoading){
                UiUtils.showLoadingDialog(context);
              }else if(state is DeleteProductFromCartError){
                UiUtils.hideLoadingDialog(context);
                UiUtils.showToastMessage(state.message, Colors.red);
              }else if( state is UpdateCartProductQuantityError){
                UiUtils.hideLoadingDialog(context);
                UiUtils.showToastMessage(state.message, Colors.red);
              }else if(state is DeleteProductFromCartSuccess){
                UiUtils.hideLoadingDialog(context);
                UiUtils.showToastMessage("Product Deleted", Colors.green);
              }else if (state is UpdateCartProductQuantitySuccess){
                UiUtils.hideLoadingDialog(context);
                UiUtils.showToastMessage("Product Updated", Colors.green);
              }
            },
              builder: (context,state){
                if(state is GetCartLoading){
                  return Center(child: CircularProgressIndicator(),);

                }
                else if(state is GetCartError){
                  return Center(child: Text(state.message),);
                }
                return cartCubit.cart.cartItems.isEmpty?Center(child: Text("No Products Added"),):
                Column(
                    children: [
                      Expanded(
                        // the list of cart items ===============
                        child: ListView.separated(
                          itemBuilder: (context, index) => CartItemWidget(
                            cartItem: cartCubit.cart.cartItems[index],
                            quantity: cartCubit.cart.cartItems[index].count,
                            onDeleteTap: () {
                              cartCubit.deleteProductFromCart(productId: cartCubit.cart.cartItems[index].product.id);
                            },
                            onDecrementTap: (value) {

                              log(value.toString());
                              if(value==0){
                                cartCubit.deleteProductFromCart(productId: cartCubit.cart.cartItems[index].product.id);
                                return;

                              }
                              cartCubit.updateCartProductQuantity(productId: cartCubit.cart.cartItems[index].product.id, quantity: value.toString());

                            },
                            onIncrementTap: (value) async{
                              log(value.toString());
                              await cartCubit.updateCartProductQuantity(productId: cartCubit.cart.cartItems[index].product.id, quantity: value.toString());
                            },
                            size: 40,
                            color: Colors.black,
                            colorName: 'Black' ,
                          ),
                          separatorBuilder: (context, index) =>
                              SizedBox(height: AppSize.s12.h),
                          itemCount: cartCubit.cart.cartItems.length,
                        ),
                      ),
                      // the total price and checkout button========
                      TotalPriceAndCheckoutBotton(
                        totalPrice: cartCubit.cart.totalCartPrice,
                        checkoutButtonOnTap: () {},
                      ),
                      SizedBox(height: 10.h),
                    ]);
              },
          ),
      ),
    );

  }
}
