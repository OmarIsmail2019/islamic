import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim/ViewModel/QuranCubit/quranCubit.dart';
import 'package:muslim/ViewModel/QuranCubit/quranState.dart';
import 'package:muslim/Widgets/GirdViewWidget.dart';
import 'package:muslim/Widgets/defaultAdhanItem.dart';
import 'package:muslim/constant/AppColor.dart';
import 'package:sizer/sizer.dart';

class HomeLayOut extends StatelessWidget {
  const HomeLayOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuranCubit()
        ..getRandomAyah()
        ..getAdhan(),
      child: BlocBuilder<QuranCubit, QuranStates>(
        builder: (context, state) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              backgroundColor: Colors.grey[300],
              appBar: AppBar(
                backgroundColor: AppConstant.defaultAppBarColor,
                elevation: 10,
                centerTitle: true,
                title: Text(
                  'الصراط المستقيم',
                  style: TextStyle(
                      fontFamily: 'UthmanicHafs',
                      fontWeight: FontWeight.bold,
                      color: AppConstant.defaultIconAndTextColor,
                      fontSize: 30),
                ),
              ),
              body: Sizer(
                builder: (context, orientation, deviceType) {
                  return Padding(
                    padding: EdgeInsets.all(2.sp),
                    child: ListView(
                        physics: const BouncingScrollPhysics(),
                        children: [
                          Card(
                              margin: EdgeInsets.only(
                                  left: 4.w, right: 4.w, top: 2.h),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.sp),
                              ),
                              shadowColor: Colors.grey[900],
                              elevation: 20,
                              color: AppConstant.defaultBackGround,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.sp),
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.lightBlue.shade400,
                                      Colors.lightBlueAccent.shade100
                                    ],
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      ' التاريخ الهجري:${QuranCubit.get(context).adhanModel?.data?.date?.hijri?.day}-${QuranCubit.get(context).adhanModel?.data?.date?.hijri?.month?.ar}-${QuranCubit.get(context).adhanModel?.data?.date?.hijri?.year}',
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: AppConstant
                                              .defaultIconAndTextColor),
                                    ),
                                    Text(
                                      ' التاريخ الهجري:${QuranCubit.get(context).adhanModel?.data?.date?.gregorian?.day}${QuranCubit.get(context).adhanModel?.data?.date?.gregorian?.month?.en}${QuranCubit.get(context).adhanModel?.data?.date?.gregorian?.year}',
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: AppConstant
                                              .defaultIconAndTextColor),
                                    ),
                                  ],
                                ),
                              )),
                          defaultAdhanItem(
                              arbText: 'الفجر',
                              engText: 'Fajr',
                              time:
                                  '${QuranCubit.get(context).adhanModel?.data?.timings?.fajr}'),
                          defaultAdhanItem(
                              arbText: 'الشروق',
                              engText: 'Sunrise',
                              time:
                                  '${QuranCubit.get(context).adhanModel?.data?.timings?.sunrise}'),
                          defaultAdhanItem(
                              arbText: 'الظهر',
                              engText: 'Dhuhr',
                              time:
                                  '${QuranCubit.get(context).adhanModel?.data?.timings?.dhuhr}'),
                          defaultAdhanItem(
                              arbText: 'العصر',
                              engText: 'Asr',
                              time:
                                  '${QuranCubit.get(context).adhanModel?.data?.timings?.asr}'),
                          defaultAdhanItem(
                              arbText: 'المغرب',
                              engText: 'Maghrib',
                              time:
                                  '${QuranCubit.get(context).adhanModel?.data?.timings?.maghrib}'),
                          defaultAdhanItem(
                              arbText: 'العشاء',
                              engText: 'Isha',
                              time:
                                  '${QuranCubit.get(context).adhanModel?.data?.timings?.isha}'),
                          SizedBox(
                            height: 2.h,
                          ),
                          ConditionalBuilder(
                            condition: state is SuccessRandomAyahOfDay,
                            builder: (context) {
                              return Card(
                                margin: EdgeInsets.only(
                                    left: 3.w, right: 3.w, top: 2.h),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.sp),
                                ),
                                shadowColor: Colors.grey[900],
                                elevation: 11,
                                color: AppConstant.defaultBackGround,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.sp),
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.lightBlue.shade400,
                                        Colors.lightBlueAccent.shade100
                                      ],
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: RichText(
                                        text: TextSpan(children: [
                                      TextSpan(
                                          text:
                                              "${QuranCubit.get(context).ayahOfDayModel?.arText} ",
                                          style: TextStyle(
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'UthmanicHafs',
                                              color: AppConstant
                                                  .defaultIconAndTextColor)),
                                      TextSpan(
                                          text:
                                              '《${QuranCubit.get(context).ayahOfDayModel?.surNumber.toString()}》',
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.pink[500])),
                                    ])),
                                  ),
                                ),
                              );
                            },
                            fallback: (context) => Center(
                                child: CircularProgressIndicator(
                              color: AppConstant.defaultIconAndTextColor,
                            )),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          GridView.count(
                            childAspectRatio: 1 / 0.45.sp,
                            padding: const EdgeInsets.all(20),
                            crossAxisSpacing: 18,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            mainAxisSpacing: 10,
                            crossAxisCount: 2,
                            children: <Widget>[
                              default_grid_view(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/surah');
                                  },
                                  text: 'القران الكريم',
                                  image: 'assets/images/back.png'),
                              default_grid_view(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/azkar');
                                  },
                                  text: 'ألاذكار',
                                  image: 'assets/images/azkar.png'),
                              // default_grid_view(
                              //     onTap: () {},
                              //     text: 'الأحاديث',
                              //     image: 'assets/images/azkar (2).png'),
                              // default_grid_view(
                              //     onTap: () {
                              //       Navigator.pushNamed(context, '/doaa');
                              //     },
                              //     text: 'ألادعية',
                              //     image: 'assets/images/doaa.png'),
                              // default_grid_view(
                              //     onTap: () {
                              //       Navigator.pushNamed(context, '/hijri');
                              //     },
                              //     text: 'التقويم الهجري',
                              //     image: 'assets/images/calendar.png'),
                              // default_grid_view(
                              //     onTap: () {
                              //       Navigator.push(
                              //           context,
                              //           MaterialPageRoute(
                              //               builder: (context) =>
                              //                   const GetLocation()));
                              //     },
                              //     text: 'القبلة',
                              //     image: 'assets/images/qibla (2).png'),
                            ],
                          ),
                        ]),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
