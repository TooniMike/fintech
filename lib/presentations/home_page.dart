import 'package:fintech/authentication/config/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import '../authentication/config/home_controller.dart';
import '../core/common_widgets/all_widgets.dart';
import 'all_pages.dart';


class HomePage extends GetWidget<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    return PopScope(
        canPop: false,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: const Color(0xFF010A43),
            body: Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 50.h,
                              width: 50.w,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFF212A6B)),
                              child: const Icon(
                                MaterialCommunityIcons.menu,
                                color: Color(0xFFFF2E63),
                              ),
                            ),
                            const WhiteSpace(
                              width: 10,
                            ),
                            Text(
                              'Hello Sandra,',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                            const Spacer(),
                            Container(
                              height: 50.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: const Color(0xFF212A6B),
                              ),
                              child: const Center(
                                  child: Text(
                                'Add money',
                                style: TextStyle(
                                    color: Color(0xFF426DDC),
                                    fontWeight: FontWeight.w700),
                              )),
                            )
                          ],
                        ),
                        const WhiteSpace(
                          height: 30,
                        ),
                        Text(
                          'Your current balance is',
                          style:
                              TextStyle(color: Colors.white, fontSize: 14.sp),
                        ),
                        const WhiteSpace(
                          height: 10,
                        ),
                        SizedBox(
                          height: 50.h,
                          child: FutureBuilder<UserBalanceModel>(
                              future: controller.userBalance,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const MotionLoading();
                                } else if (snapshot.hasError) {
                                  return Center(
                                    child: Text('Error: ${snapshot.error}'),
                                  );
                                } else if (!snapshot.hasData) {
                                  return const Center(
                                    child: Text('No balance available.'),
                                  );
                                } else {
                                  return ListView.builder(
                                      itemCount: 1,
                                      itemBuilder: (context, index) {
                                        UserBalanceModel details =
                                            snapshot.data!;
                                        return Text(
                                          '${details.currency} ${details.balance.toString()}',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 32.sp,
                                              fontWeight: FontWeight.bold),
                                        );
                                      });
                                }
                              }),
                        ),
                        const WhiteSpace(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomButton(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (_) => const MoneyRequest()),
                                );
                              },
                              text: 'Request money',
                              isColorFilled: false,
                            ),
                            CustomButton(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (_) => const SendAllMoney()),
                                );
                              },
                              text: 'Send money',
                              isColorFilled: false,
                            )
                          ],
                        ),
                        const WhiteSpace(
                          height: 25,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height * .4,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: const Color(0xFF10194E),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.r),
                          topRight: Radius.circular(30.r),
                        ),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsets.only(top: 20.h, left: 10.w, right: 10.w),
                        child: Column(
                          children: [
                            Container(
                              height: 6.h,
                              width: 60.w,
                              alignment: Alignment.center,
                              padding: EdgeInsets.only(top: 20.h),
                              margin: EdgeInsets.symmetric(horizontal: 20.w),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xFF4E589F)),
                            ),
                            const WhiteSpace(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  'All Transactions',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18.sp),
                                ),
                                const Spacer(),
                                Text(
                                  'Sort by: ',
                                  style: TextStyle(
                                      color: const Color(0xFF4E589F),
                                      fontSize: 15.sp),
                                ),
                                const WhiteSpace(
                                  width: 5,
                                ),
                                Text(
                                  'Recent',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14.sp),
                                ),
                                const WhiteSpace(
                                  width: 5,
                                ),
                                const Icon(
                                  Icons.arrow_drop_down_outlined,
                                  color: Colors.white,
                                )
                              ],
                            ),
                            const WhiteSpace(
                              height: 30,
                            ),
                            Expanded(
                              child: FutureBuilder<List<TransactionsModel>>(
                                  future: controller.allTransactions,
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Column(
                                        children: [
                                          MotionLoading(),
                                          WhiteSpace(
                                            height: 10,
                                          ),
                                          MotionLoading(),
                                        ],
                                      );
                                    } else if (snapshot.hasError) {
                                      return Center(
                                        child: Text('Error: ${snapshot.error}'),
                                      );
                                    } else if (!snapshot.hasData ||
                                        snapshot.data!.isEmpty) {
                                      return const Center(
                                        child: Text('No transaction available.'),
                                      );
                                    } else {
                                      return ListView.builder(
                                          scrollDirection: Axis.vertical,
                                          itemCount: snapshot.data!.length,
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10.h).copyWith(top: 20.h),
                                          itemBuilder: (context, index) {
                                            TransactionsModel transactions = 
                                                snapshot.data![index];
                                            return Row(
                                              children: [
                                                CircleAvatar(
                                                  radius: 25.r,
                                                  backgroundImage: const AssetImage(
                                                      'assets/images/sender.png'),
                                                ),
                                                const WhiteSpace(
                                                  width: 10,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Adeboye Usman',
                                                      style: TextStyle(
                                                          color: const Color(
                                                              0xFF858EC5),
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 18.sp),
                                                    ),
                                                    const WhiteSpace(
                                                      height: 5,
                                                    ),
                                                    Container(
                                                      width: 105.w,
                                                      height: 25.h,
                                                      decoration: BoxDecoration(
                                                          color: const Color(
                                                              0xFF1DC7AC),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.r)),
                                                      child: Center(
                                                        child: Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      5.w),
                                                          child: Row(
                                                            children: [
                                                              const Icon(
                                                                Icons
                                                                    .av_timer_sharp,
                                                                color:
                                                                    Colors.white,
                                                              ),
                                                              const WhiteSpace(
                                                                width: 5,
                                                              ),
                                                              Text(
                                                                transactions.type!,
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        14.sp),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                const Spacer(),
                                                Text(
                                                  "${transactions.currency} ${transactions.amount.toString()}",
                                                  style: TextStyle(
                                                      color:
                                                          const Color(0xFF1DC7AC),
                                                      fontSize: 20.sp,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            );
                                          });
                                    }
                                  }),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
