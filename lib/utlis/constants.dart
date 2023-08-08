import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:roomfinding/controllers/drawer_controller.dart';
import 'package:roomfinding/controllers/navigator_controllers.dart';
import 'package:roomfinding/model/drawer_model.dart';
//

final w = Get.width;
final h = Get.height;

const Color unSelectedColor = Color.fromARGB(255, 234, 234, 234);

Drawer mainDrawer(int index) {
  var controller = Get.find<MainDrawerController>();
  final navController = Get.find<NavigatorController>();
  controller.changeIndex(index);
  return Drawer(
    child: Stack(
      children: [
        GetBuilder<MainDrawerController>(
            id: "current Drawer Itme Index",
            builder: (context) {
              return Container(
                  margin: const EdgeInsets.all(20),
                  width: w,
                  height: h / 1.75,
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemCount: drawerItem.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          controller.changeIndex(index);
                          switch (index) {
                            case 0:
                              navController.changeNavBarIndex(3);
                              break;

                            case 1:
                              navController.changeNavBarIndex(2);
                              break;

                            case 3:
                              navController.changeNavBarIndex(1);
                              break;
                            case 4:
                              navController.changeNavBarIndex(0);
                              break;

                            case 6:
                              Navigator.pop(context);
                              Future.delayed(const Duration(milliseconds: 300),
                                  () {
                                return showDialog<void>(
                                  context: context,
                                  barrierDismissible:
                                      false, // user must tap button!
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text(
                                        "Hey You!",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w300),
                                      ),
                                      content: SingleChildScrollView(
                                        child: ListBody(
                                          children: const <Widget>[
                                            Text(
                                                'Do you really want to exit from our app? ',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    color: Color.fromARGB(
                                                        255, 134, 134, 134))),
                                          ],
                                        ),
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                            child: const Text(
                                              'Nup',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 109, 109, 109)),
                                            ),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            }),
                                        TextButton(
                                            child: const Text(
                                              'Yup',
                                              style: TextStyle(
                                                  color:
                                                      Colors.deepPurpleAccent),
                                            ),
                                            onPressed: () {
                                              SystemNavigator.pop();
                                            }),
                                      ],
                                    );
                                  },
                                );
                              });

                              break;

                            default:
                          }
                        },
                        child: ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            tileColor:
                                controller.currentDrawerItemIndex == index
                                    ? const Color.fromARGB(255, 219, 205, 255)
                                    : Colors.transparent,
                            leading: Icon(
                              drawerItem[index].icon,
                              color: controller.currentDrawerItemIndex == index
                                  ? Colors.purple
                                  : Colors.grey,
                            ),
                            title: Text(
                              drawerItem[index].title,
                              style: TextStyle(
                                color:
                                    controller.currentDrawerItemIndex == index
                                        ? Colors.purple
                                        : Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      if (index == 6) {
                        return const Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: Divider(
                            color: Colors.grey,
                          ),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ));
            }),
      ],
    ),
  );
}
