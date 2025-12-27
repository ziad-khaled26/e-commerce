import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/resources/ui_utils/ui_utils.dart';
import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:ecommerce_app/core/widget/custom_elevated_button.dart';
import 'package:ecommerce_app/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_description.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_item.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_label.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_rating.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_slider.dart';
import 'package:ecommerce_app/features/products_screen/domin/entities/productEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key,required this.product});
  final ProductEntity product;

  @override
  Widget build(BuildContext context2) {
    CartCubit cartCubit=context2.read<CartCubit>();

    bool isDiscount(){
      return  product.priceAfterDiscount!=null;
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Product Details',
          style: getMediumStyle(color: ColorManager.appBarTitleColor)
              .copyWith(fontSize: 20.sp),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: ImageIcon(
                AssetImage(IconsAssets.icSearch),
                color: ColorManager.primary,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: ColorManager.primary,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 50.h),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
             ProductSlider(items: [
               for(var image in product.images)
                 ProductItem(
                     imageUrl:
                     image
                 ),
            ], initialIndex: 0),
            SizedBox(
              height: 24.h,
            ),

             ProductLabel(
                productName: product.title, productPrice: product.price.toString()),
            SizedBox(
              height: 16.h,
            ),
                ProductRating(
                    productId: product.id,
                    productBuyers: product.sold?.toString()??"",
                    productRating: '${product.ratingsAverage}(${product.ratingsQuantity})'),
            SizedBox(
              height: 16.h,
            ),
             ProductDescription(
                productDescription:
                    product.description),
            // ProductSize(
            //   size: const [35, 38, 39, 40],
            //   onSelected: () {},
            // ),
            // SizedBox(
            //   height: 20.h,
            // ),
            // Text('Color',
            //     style: getMediumStyle(color: ColorManager.appBarTitleColor)
            //         .copyWith(fontSize: 18.sp)),
            // ProductColor(color: const [
            //   Colors.red,
            //   Colors.blueAccent,
            //   Colors.green,
            //   Colors.yellow,
            // ], onSelected: () {}),
            SizedBox(
              height: 48.h,
            ),
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      'Total price',
                      style: getMediumStyle(
                              color: ColorManager.primary.withOpacity(.6))
                          .copyWith(fontSize: 18.sp),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Visibility(
                      visible: isDiscount(),
                        replacement: Text('EGP ${product.price}',
                          style:
                          getMediumStyle(color: ColorManager.appBarTitleColor)
                              .copyWith(fontSize: 18.sp),
                        ),
                        child: Column(
                          children: [
                            Text('EGP ${product.priceAfterDiscount}',
                                style:
                                getMediumStyle(color: ColorManager.appBarTitleColor)
                                    .copyWith(fontSize: 18.sp)
                            ),
                            Text('EGP ${product.price}',
                              style: getTextWithLine(),
                              )
                          ],
                        ),
                    ),

                  ],
                ),
                SizedBox(
                  width: 33.w,
                ),
                BlocListener<CartCubit,CartState>(
                  listener: (context,state){
                    if(state is AddToCartLoading){
                      UiUtils.showLoadingDialog(context,isDismissible: false);
                    }else if(state is AddToCartError){
                      UiUtils.hideLoadingDialog(context);
                      UiUtils.showToastMessage(state.message, Colors.red);
                    }else if(state is AddToCartSuccess){
                      UiUtils.hideLoadingDialog(context);
                      UiUtils.showToastMessage("Added To Cart", Colors.green);
                      Navigator.pushNamed(context2, Routes.cartRoute);
                    }
                  },
                  child: Expanded(
                    child: CustomElevatedButton(
                      label: 'Add to cart',
                      onTap: () {
                        cartCubit.addToCart(productId: product.id);

                      },
                      prefixIcon: Icon(
                        Icons.add_shopping_cart_outlined,
                        color: ColorManager.white,
                      ),
                    ),
                  ),
                )
              ],
            )
          ]),
        ),
      ),

    );
  }

}
