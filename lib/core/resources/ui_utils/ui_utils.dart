import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UiUtils{
  static void showLoadingDialog(BuildContext context,{bool isDismissible=true}){
    showDialog(
      barrierDismissible: isDismissible,
        context: context,
        builder: (context)=>PopScope(
          canPop: isDismissible,
          child: CupertinoAlertDialog(
            content: Center(
              child: CircularProgressIndicator(
                color: ColorManager.primary,
              ),
            ),
          ),
        )
    );
  }

  static void hideLoadingDialog(BuildContext context) {
    Navigator.pop(context);
  }

  static void showToastMessage(String message,Color backgroundColor){
   Fluttertoast.showToast(
       msg: message,
     gravity: ToastGravity.BOTTOM,
     backgroundColor: backgroundColor,
     fontSize: 16.sp,
     textColor: Colors.white
   );
  }

  static void showMessage(BuildContext context,{bool isDismissible=true,required String message}){
    showDialog(
        barrierDismissible: isDismissible,
        context: context,
        builder: (context)=>PopScope(
          canPop: isDismissible,
          child: CupertinoAlertDialog(
            content: Center(
              child: Text(
                message,
                style: TextStyle(color: Colors.white,fontSize: 16.sp),
                // color: ColorManager.primary,
              ),
            ),
          ),
        )
    );
  }
}