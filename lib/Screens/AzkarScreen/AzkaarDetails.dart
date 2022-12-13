import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:muslim/Model/AzkarModel/DetailsModel.dart';
import 'package:muslim/constant/AppColor.dart';
import 'package:sizer/sizer.dart';

class AzkaarDetails extends StatefulWidget {
  final int? id;
  final String? name;

  const AzkaarDetails({required this.id, this.name});

  @override
  State<AzkaarDetails> createState() => _AzkaarDetailsState();
}

class _AzkaarDetailsState extends State<AzkaarDetails> {
  List<DetailsModel> sectionDetails = [];

  @override
  void initState() {
    super.initState();
    LoadData();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppConstant.defaultBackGround,
        appBar: AppBar(
          backgroundColor: AppConstant.defaultAppBarColor,
          automaticallyImplyLeading: false,
          title: Text(
            '${widget.name}',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                fontFamily: 'UthmanicHafs',
                color: AppConstant.defaultIconAndTextColor),
          ),
          elevation: 5,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_sharp,
                color: AppConstant.defaultIconAndTextColor,
              )),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                int count=int.parse('${sectionDetails[index].count}');
                return InkWell(
                  onTap: (){
                    count--;
                    if(count==0){
                      const Icon(Icons.done_outline);
                    }
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.sp),
                    ),
                    margin: const EdgeInsets.all(5),
                    elevation: 10,
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
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              children: [
                                Center(
                                  child: Text(
                                    '${sectionDetails[index].content}',
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        fontFamily: 'UthmanicHafs',
                                        fontWeight: FontWeight.bold,
                                        color: AppConstant.defaultIconAndTextColor),
                                    maxLines: 10,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                             SizedBox(
                              height: 3.h,
                            ),
                            Container(
                              width: double.infinity,
                              height: 1,
                              color: AppConstant.defaultAppBarColor,
                            ),
                            Center(
                              child: Text(
                                '$count',
                                style:  TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppConstant.defaultIconAndTextColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) =>  SizedBox(height: 2.h,),
              itemCount: sectionDetails.length),
        ),
      ),
    );
  }

  LoadData() async {
    sectionDetails = [];
    DefaultAssetBundle.of(context)
        .loadString('assets/azkarDatabaseDetails.json')
        .then((value) {
      var response = json.decode(value);
      response.forEach((data) {
        print(response);
        DetailsModel _section = DetailsModel.fromJson(data);
        print(_section.content);
        if (_section.section_id == widget.id) {
          sectionDetails.add(_section);
        }
      });
      setState(() {});
    }).catchError((error) {
      print(error.toString());
    });
  }
}
