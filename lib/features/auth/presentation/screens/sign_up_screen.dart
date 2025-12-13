import 'package:ecommerce_app/core/resources/ui_utils/ui_utils.dart';
import 'package:ecommerce_app/core/widget/custom_elevated_button.dart';
import 'package:ecommerce_app/features/auth/data/models/Register_request.dart';
import 'package:ecommerce_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/routes_manager/routes.dart';
import '../../../../core/widget/main_text_field.dart';
import '../../../../core/widget/validators.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController _nameController;

  late TextEditingController _phoneController;

  late TextEditingController _emailController;

  late TextEditingController _passwordController;
  @override
  void initState() {
    super.initState();
    _nameController=TextEditingController();
    _phoneController=TextEditingController();
    _emailController=TextEditingController();
    _passwordController=TextEditingController();
  }
  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: AppSize.s40.h,
                ),
                Center(child: SvgPicture.asset(SvgAssets.routeLogo)),
                SizedBox(
                  height: AppSize.s40.h,
                ),
                BuildTextField(
                  backgroundColor: ColorManager.white,
                  hint: 'enter your full name',
                  label: 'Full Name',
                  textInputType: TextInputType.name,
                  validation: AppValidators.validateFullName,
                  controller: _nameController,
                ),
                SizedBox(
                  height: AppSize.s18.h,
                ),
                BuildTextField(
                  hint: 'enter your mobile no.',
                  backgroundColor: ColorManager.white,
                  label: 'Mobile Number',
                  controller: _phoneController,

                  validation: AppValidators.validatePhoneNumber,
                  textInputType: TextInputType.phone,
                ),
                SizedBox(
                  height: AppSize.s18.h,
                ),
                BuildTextField(
                  hint: 'enter your email address',
                  backgroundColor: ColorManager.white,
                  label: 'E-mail address',
                  validation: AppValidators.validateEmail,
                  textInputType: TextInputType.emailAddress,
                  controller: _emailController,
                ),
                SizedBox(
                  height: AppSize.s18.h,
                ),
                BuildTextField(
                  hint: 'enter your password',
                  backgroundColor: ColorManager.white,
                  label: 'password',
                  validation: AppValidators.validatePassword,
                  isObscured: true,
                  textInputType: TextInputType.text,
                  controller: _passwordController,
                ),
                SizedBox(
                  height: AppSize.s50.h,
                ),
                Center(
                  child: BlocListener<AuthCubit,AuthState>(
                    listener: (context,state){
                      if(state is RegisterLoading){
                        UiUtils.showLoadingDialog(context,isDismissible: false);
                      }
                      else if(state is RegisterError){
                        UiUtils.hideLoadingDialog(context);
                        UiUtils.showToastMessage(state.errorMessage, Colors.red);
                      }
                      else if(state is RegisterSuccess){
                        UiUtils.hideLoadingDialog(context);
                        UiUtils.showToastMessage("Successfully Registration", Colors.green);
                        Navigator.pushReplacementNamed(context, Routes.signInRoute);
                      }
                    },
                    child: SizedBox(
                      height: AppSize.s60.h,
                      width: MediaQuery.of(context).size.width * .9,
                      child: CustomElevatedButton(
                        // borderRadius: AppSize.s8,
                        label: 'Sign Up',
                        backgroundColor: ColorManager.white,
                        textStyle: getBoldStyle(
                            color: ColorManager.primary, fontSize: AppSize.s20),
                        onTap: () {
                          context.read<AuthCubit>().register(RegisterRequest(name: _nameController.text, email: _emailController.text, password: _passwordController.text, rePassword: _passwordController.text, phone: _phoneController.text));
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
