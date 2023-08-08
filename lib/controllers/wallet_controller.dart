import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roomfinding/constants/app_colors.dart';

import '../model/hostel.dart';


class WalletController extends GetxController {
  List<Hostel> walletHostel = [];

  // Method for adding item into walletFood List
  void add({
    required id,
    required name,
    type,
    hostelid,
    address,
    image,
    city,
    phone,
    title,
    desc,
    rating,
    cheapestPrice,
    featured,
  }) {
    var contain = walletHostel.where((element) => element.hostelid == hostelid);
    if (contain.isEmpty) {
      walletHostel.add(Hostel(
          hId: 1,
          name: name,
          title: title,
          type: type,
          hostelid: hostelid,
          address: address,
          photos: image,
          cheapestPrice: 500,
          desc: desc,
          city: city));
      Get.snackbar("Notice!", "Added To Your Wallet",
          snackPosition: SnackPosition.TOP,
          duration: const Duration(milliseconds: 1600),
          isDismissible: true,
          backgroundColor: AppColors.primaryColor,
          colorText: AppColors.whiteColor,
          dismissDirection: DismissDirection.horizontal);
      update();
    } else {
      Get.snackbar("Warning!", "You have Added this Item before",
          snackPosition: SnackPosition.TOP,
          duration: const Duration(milliseconds: 1600),
          backgroundColor: Colors.amber,
          colorText: AppColors.whiteColor,
          isDismissible: true,
          dismissDirection: DismissDirection.horizontal);
    }
  }

  // Method for removing all items from the walletFood List
  void removeAllItems() {
    walletHostel = [];
    update();
  }

  // Method for removing single item from walletFood List
  void removeSingleItem(int index) {
    walletHostel.removeAt(index);
    update();
  }

  // Method For Calculating Total Price of foods
  double totalAmount() {
    var sumPrice = 0.0;

    for (Hostel walletHostel in walletHostel) {
      int price = int.parse("${walletHostel.cheapestPrice}");
      sumPrice = sumPrice + price;
      //  walletFood.cheapestPrice ;
    }
    return sumPrice;
  }
}
