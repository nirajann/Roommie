// import 'package:flutter/material.dart';
// import 'package:roomfinding/constants/app_colors.dart';
// import 'package:roomfinding/model/setting_list_data.dart';
// import 'package:roomfinding/utlis/text_styles.dart';
// import 'package:roomfinding/widget/common_appbar_view.dart';
// import 'package:roomfinding/widget/common_card.dart';
// import 'package:roomfinding/widget/remove_focuse.dart';

// class CartScreen extends StatefulWidget {
//   const CartScreen({Key? key}) : super(key: key);

//   @override
//   State<CartScreen> createState() => _CartScreenState();
// }

// class _CartScreenState extends State<CartScreen> {
//   List<SettingsListData> userInfoList = SettingsListData.userInfoList;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.greyColor,
//       body: RemoveFocuse(
//         onClick: () {
//           FocusScope.of(context).requestFocus(FocusNode());
//         },
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             CommonAppbarView(
//               iconData: Icons.arrow_back,
//               titleText: "edit Profile",
//               onBackClick: () {
//                 Navigator.pop(context);
//               },
//             ),
//             Expanded(
//               child: ListView.builder(
//                 padding: EdgeInsets.only(
//                     bottom: 16 + MediaQuery.of(context).padding.bottom),
//                 itemCount: userInfoList.length,
//                 itemBuilder: (context, index) {
//                   return index == 0
//                       ? getProfileUI()
//                       : InkWell(
//                           onTap: () {},
//                           child: Column(
//                             children: <Widget>[
//                               Padding(
//                                 padding:
//                                     const EdgeInsets.only(left: 8, right: 16),
//                                 child: Row(
//                                   children: <Widget>[
//                                     Expanded(
//                                       child: Padding(
//                                         padding: const EdgeInsets.only(
//                                             left: 16.0, bottom: 16, top: 16),
//                                         child: Text(
//                                           userInfoList[index].titleTxt,
//                                           style: TextStyles(context)
//                                               .getDescriptionStyle()
//                                               .copyWith(
//                                                 fontSize: 16,
//                                               ),
//                                         ),
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.only(
//                                           right: 16.0, bottom: 16, top: 16),
//                                       child: Text(
//                                         userInfoList[index].subTxt,
//                                         style: TextStyles(context)
//                                             .getRegularStyle()
//                                             .copyWith(
//                                               fontWeight: FontWeight.w500,
//                                               fontSize: 16,
//                                             ),
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                               const Padding(
//                                 padding: EdgeInsets.only(left: 16, right: 16),
//                                 child: Divider(
//                                   height: 1,
//                                 ),
//                               )
//                             ],
//                           ),
//                         );
//                 },
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Widget getProfileUI() {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 16),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: <Widget>[
//           SizedBox(
//             width: 130,
//             height: 130,
//             child: Stack(
//               alignment: Alignment.center,
//               children: <Widget>[
//                 Container(
//                   width: 120,
//                   height: 120,
//                   decoration: BoxDecoration(
//                     color: AppColors.primaryColor,
//                     shape: BoxShape.circle,
//                     boxShadow: <BoxShadow>[
//                       BoxShadow(
//                         color: Theme.of(context).dividerColor,
//                         blurRadius: 8,
//                         offset: const Offset(4, 4),
//                       ),
//                     ],
//                   ),
//                   child: ClipRRect(
//                     borderRadius: const BorderRadius.all(Radius.circular(60.0)),
//                     child: Image.asset('assets/profile.png'),
//                   ),
//                 ),
//                 Positioned(
//                   bottom: 6,
//                   right: 6,
//                   child: CommonCard(
//                     color: AppColors.primaryColor,
//                     radius: 36,
//                     child: Material(
//                       color: Colors.transparent,
//                       child: InkWell(
//                         borderRadius:
//                             const BorderRadius.all(Radius.circular(24.0)),
//                         onTap: () {},
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Icon(
//                             Icons.camera_alt,
//                             color: Theme.of(context).colorScheme.background,
//                             size: 18,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }