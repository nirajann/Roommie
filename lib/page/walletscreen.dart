import 'package:animate_do/animate_do.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:shake/shake.dart';
import '../controllers/navigator_controllers.dart';
import '../controllers/wallet_controller.dart';
import '../repository/order_repo.dart';
import '../utlis/constants.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  int index = 0;

  _saveOrder(hostelid) async {
    int status = await OrderRepositoryImpl().addHostel(hostelid);
    print(status);
    _showMessage(status);
  }

  _showMessage(int status) {
    if (status == 0) {
      AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 1,
          channelKey: 'basic_channel',
          title: "Product Added To Cart",
          body: "Order HAs been Place Check your Order HIstory to verify it",
        ),
      );

      MotionToast.success(
        description: const Text("Item Added to cart successfully"),
      ).show(context);
      // Navigator.pushNamed(context, LoginScreen.route);
    } else {
      MotionToast.error(
        description: const Text("Cart Addition Failed"),
      ).show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    var walletController = Get.find<WalletController>();
    ShakeDetector.waitForStart(onPhoneShake: () {
      setState(() {
        walletController.removeSingleItem(index);
        Get.back();
      });
    });

    return SafeArea(
        child: Scaffold(
            drawer: mainDrawer(1),
            appBar: const MyAppBar(),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                      width: w,
                      height: h / 20,
                      // color: Colors.yellow,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: w / 3,
                            height: h / 24,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.black),
                            child: Center(
                                child: Text(
                              "Total Item : ${walletController.walletHostel.length}",
                              style: GoogleFonts.lato(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            )),
                          ),
                          Container(
                            width: w / 1.8,
                            height: h / 24,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.red),
                            child: Center(
                                child: Text(
                              "Total Price : Rs ${walletController.totalAmount().toStringAsFixed(2)}",
                              style: GoogleFonts.lato(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            )),
                          )
                        ],
                      )),
                  SizedBox(
                    width: w,
                    height: h / 1.65,
                    child: ListView.builder(
                      itemCount: walletController.walletHostel.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return SingleChildScrollView(
                          child: SizedBox(
                            width: w,
                            height: h / 4.5,
                            child: Stack(children: [
                              Positioned(
                                top: 20,
                                right: 0,
                                child: FadeInLeft(
                                  delay: Duration(
                                      milliseconds:
                                          (index / 0.5 * 100).toInt()),
                                  child: Container(
                                    width: w / 1.3,
                                    height: h / 6,
                                    decoration: BoxDecoration(
                                        color: unSelectedColor,
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Color.fromARGB(
                                                  255, 221, 219, 219),
                                              spreadRadius: 3,
                                              blurRadius: 10,
                                              offset: Offset(-7, 11))
                                        ]),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 3,
                                child: FadeInLeft(
                                  delay: Duration(
                                      milliseconds:
                                          (index / 0.5 * 200).toInt()),
                                  child: Spin(
                                    delay: Duration(
                                        milliseconds:
                                            (index / 0.5 * 250).toInt()),
                                    child: SizedBox(
                                      width: w / 3,
                                      height: h / 5,
                                      child: Hero(
                                        tag: walletController
                                            .walletHostel[index].hId,
                                        child: Image.asset(
                                          walletController
                                                  .walletHostel[index].photos ??
                                              "",
                                          fit: BoxFit.cover,
                                          height: 400,
                                          width: double.maxFinite,
                                        ),
                                        // child: Image.network(
                                        //   walletController
                                        //           .walletHostel[index].photos ??
                                        //       "",
                                        //   fit: BoxFit.cover,
                                        // ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 170,
                                top: 40,
                                child: FadeInLeft(
                                  delay: Duration(
                                      milliseconds:
                                          (index / 0.5 * 300).toInt()),
                                  child: Text(
                                    "${walletController.walletHostel[index].name}",
                                    style: GoogleFonts.oxygen(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 171,
                                top: 68,
                                child: FadeInLeft(
                                  delay: Duration(
                                      milliseconds:
                                          (index / 0.5 * 400).toInt()),
                                  child: Text(
                                    "${walletController.walletHostel[index].address}",
                                    style: GoogleFonts.oxygen(
                                        color: const Color.fromARGB(
                                            255, 135, 134, 134),
                                        fontWeight: FontWeight.w300,
                                        fontSize: 14),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 171,
                                top: 95,
                                child: FadeInLeft(
                                  delay: Duration(
                                      milliseconds:
                                          (index / 0.5 * 500).toInt()),
                                  child: Text(
                                    "Rs ${walletController.walletHostel[index].cheapestPrice}",
                                    style: GoogleFonts.oxygen(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                              ),
                              Positioned(
                                  top: 25,
                                  right: 20,
                                  child: FadeInRight(
                                    delay: Duration(
                                        milliseconds:
                                            (index / 0.5 * 700).toInt()),
                                    child: Spin(
                                      delay: Duration(
                                          milliseconds:
                                              (index / 0.5 * 800).toInt()),
                                      child: IconButton(
                                          onPressed: () {
                                            Get.defaultDialog(
                                                barrierDismissible: false,
                                                title: "Warning!",
                                                content: const Text(
                                                  "Do you really wanna remove this Item from this list?",
                                                  textAlign: TextAlign.center,
                                                ),
                                                confirmTextColor: Colors.white,
                                                onCancel: () {},
                                                onConfirm: () {
                                                  setState(() {
                                                    walletController
                                                        .removeSingleItem(
                                                            index);
                                                    Get.back();
                                                  });
                                                });
                                          },
                                          icon: const Icon(
                                            LineIcons.times,
                                            color: Colors.red,
                                          )),
                                    ),
                                  )),
                              Positioned(
                                bottom: 1,
                                right: 20,
                                child: MaterialButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25)),
                                  onPressed: () {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             const PaymentScreen()));

                                    _saveOrder(
                                        "${walletController.walletHostel[index].hostelid}");
                                    print("object");
                                  },
                                  minWidth: w / 2,
                                  height: h / 14,
                                  color: unSelectedColor,
                                  child: Text(
                                    "Book Now",
                                    style: GoogleFonts.lato(fontSize: 18),
                                  ),
                                ),
                              )
                            ]),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )));
  }
}

/// MyAppBar Widget Components
class MyAppBar extends StatefulWidget with PreferredSizeWidget {
  const MyAppBar({
    Key? key,
  }) : super(key: key);

  @override
  State<MyAppBar> createState() => _MyAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(55);
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    var walletController = Get.find<WalletController>();

    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        icon: const Icon(
          Icons.menu_rounded,
          color: Colors.black,
          size: 35,
        ),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
      actions: [
        GetBuilder<WalletController>(builder: (context) {
          return Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: walletController.walletHostel.isNotEmpty
                ? IconButton(
                    onPressed: () {
                      Get.defaultDialog(
                          barrierDismissible: false,
                          title: "Warning!",
                          content: const Text(
                            "Do you really wanna remove all items from this list?",
                            textAlign: TextAlign.center,
                          ),
                          confirmTextColor: Colors.white,
                          onCancel: () {},
                          onConfirm: () {
                            walletController.removeAllItems();
                            Get.back();
                          });
                    },
                    icon: const Icon(
                      LineIcons.trash,
                      color: Colors.red,
                      size: 35,
                    ),
                  )
                : IconButton(
                    onPressed: () {
                      Get.find<NavigatorController>().changeNavBarIndex(0);
                    },
                    icon: const Icon(
                      LineIcons.plusCircle,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
          );
        }),
      ],
    );
  }
}
