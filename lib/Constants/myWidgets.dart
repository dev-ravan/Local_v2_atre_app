import 'package:atre_windows/Constants/myColors.dart';
import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';

final myWidgets = MyWidgets();

class MyWidgets {
  toastMsg({required BuildContext context, required String msg}) {
    return CherryToast.warning(
      title: const Text("Warning"),
      enableIconAnimation: false,
      displayTitle: false,
      description: Text(
        msg,
        style: const TextStyle(fontWeight: FontWeight.w400),
      ),
      animationType: AnimationType.fromTop,
      borderRadius: 10,
      animationDuration: const Duration(milliseconds: 600),
      autoDismiss: true,
      animationCurve: Curves.easeInCirc,
    ).show(context);
  }

  titleText({required String title}) {
    return Text(
      title,
      style: const TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
    );
  }

  Widget greyText({required String title}) {
    return Text(
      title,
      style: TextStyle(
          color: myColors.greyFontColor,
          fontWeight: FontWeight.w400,
          fontSize: 14),
    );
  }

  Widget detailsText({required String title}) {
    return Text(
      title,
      style: const TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
    );
  }

  Widget miniDetailsText({required String title}) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget searchField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Search',
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: myColors.greenColor),
            borderRadius: BorderRadius.circular(10)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        suffixIconColor: myColors.greenColor,
        suffixIcon: const Icon(
          Icons.search,
        ),
      ),
    );
  }

  Widget iconButton(
      {required String title,
      required Function onTap,
      required IconData icon,
      required double height}) {
    return InkWell(
      onTap: onTap as void Function(),
      child: Container(
        //  height: MediaQuery.of(context).size.height / height,
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6), color: myColors.greenColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 20,
              color: Colors.white,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              title,
              style: TextStyle(
                  color: myColors.whiteColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }

  Widget greenText({required String title}) {
    return Text(
      title,
      style: TextStyle(
          color: myColors.greenColor,
          letterSpacing: 0.5,
          fontWeight: FontWeight.w500),
    );
  }
}
