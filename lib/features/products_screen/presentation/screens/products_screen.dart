import 'package:ecommerce_app/core/di/service_locator.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/features/products_screen/presentation/cubit/products_cubit.dart';
import 'package:ecommerce_app/features/products_screen/presentation/widgets/custom_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widget/home_screen_app_bar.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key,required this.categoryId});
  final String categoryId;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const HomeScreenAppBar(
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: BlocProvider(
          create: (context)=>serviceLocator.get<ProductsCubit>()..getProducts(categoryId),
          child: BlocBuilder<ProductsCubit,ProductsState>(
            builder: (context,state){
              if(state is ProductsLoading){
                return Center(child: CircularProgressIndicator(),);
              }
              else if(state is ProductsError){
                return Center(child: Text(state.message),);
              }
              else if(state is ProductsSuccess){
                return Column(
                  children: [
                    Expanded(
                      child: GridView.builder(
                        itemCount: state.products.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 7 / 9,
                        ),
                        itemBuilder: (context, index) {
                          return CustomProductWidget(
                            height: height,
                            width: width,
                            product: state.products[index],
                         );
                        },
                        scrollDirection: Axis.vertical,
                      ),
                    )
                  ],
                );
              }
              return SizedBox();

            },
          ),
        ),
      ),
    );
  }
}
