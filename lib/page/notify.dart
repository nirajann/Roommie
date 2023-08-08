import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../utlis/constants.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  List<String> messagetitle = [
    'BEST RECOMMENDATION FOR YOU',
    'Booking Cancelled',
    'Booking Successful',
  ];

  List<String> messagecontent = [
    'Best recommendation according to your location',
    'Your cancellation request for...',
    'Your booking is successful...'
  ];

  List<IconData> icons = [
    Icons.percent,
    Icons.cancel,
    Icons.approval,
  ];

  List<Color> colors = [
    Colors.amberAccent,
    Colors.redAccent,
    Colors.greenAccent,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            const TopBar(),
            ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: messagetitle.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.all(10),
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(
                                1, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Positioned(
                        bottom: 3,
                        child: FadeInLeft(
                          delay: Duration(
                              milliseconds: (index / 0.5 * 100).toInt()),
                          child: Spin(
                            delay: Duration(
                                milliseconds: (index / 0.5 * 150).toInt()),
                            child: SizedBox(
                              width: w / 3,
                              height: h / 10,
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: colors[index],
                                  child: Icon(
                                    icons[index],
                                    color: Colors.white,
                                  ),
                                ),
                                title: Text(
                                  messagetitle[index],
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                subtitle: Text(
                                  messagecontent[index],
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.grey,
                                  ),
                                ),
                                trailing: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                      Icons.arrow_forward_ios_rounded),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox();
              },
            ),
          ])),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Notifications",
            style: TextStyle(
                color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class MyAppBar extends StatefulWidget with PreferredSizeWidget {
  const MyAppBar({
    Key? key,
  }) : super(key: key);

  @override
  State<MyAppBar> createState() => _MyAppBarState();
  @override
  Size get preferredSize => const Size.fromHeight(55);
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: Center(
        child: IconButton(
          icon: const Icon(
            Icons.notifications,
            color: Colors.black,
            size: 35,
          ),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
    );
  }
}
