import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_flutter/app_utils/utils.dart';
import 'package:news_app_flutter/constant/colors.dart';
import 'package:news_app_flutter/features/newsfeed/domain/news_entity/news_model/news_model.dart';
import 'package:news_app_flutter/widgets/custom_textStyle.dart';

class NewsDetailScreen extends ConsumerStatefulWidget {
  const NewsDetailScreen(this.news, {Key? key}) : super(key: key);
  final News? news;
  @override
  ConsumerState<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends ConsumerState<NewsDetailScreen> {

   News? newsData;

  @override
  void initState() {
   if(widget.news != null){
     newsData = widget.news;
   }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
   appBar: _appBarWidget(),
      body: _buildNewsDetail(),
    );
  }

  _appBarWidget(){
    return AppBar(
      backgroundColor: bgColor,
      elevation: 0,
      centerTitle: true,
      title: textWidget(title: '${newsData!.source.name}' , fontWeight: FontWeight.w500, fontSize: 22.sp,textColor: whiteColor),);
  }

   Widget _buildNewsDetail() {
     return Padding(
       padding: EdgeInsets.symmetric(vertical: 20.h,horizontal: 20.w),
       child: SingleChildScrollView(
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             textWidget( title : newsData?.title,maxLines: 4, fontWeight: FontWeight.w700 ),
             20.ph,
             CachedNetworkImage(
               height: 210.h,
               imageUrl: newsData!.urlToImage,
               key: UniqueKey(),
               imageBuilder: (context, imageProvider) => Container(
                 decoration: BoxDecoration(
                   shape: BoxShape.rectangle,
                   borderRadius: BorderRadius.circular(10.r),
                   image: DecorationImage(
                     image: imageProvider,
                     fit: BoxFit.cover,),
                 ),
               ),

             ),
             10.ph,
             textWidget( title : newsData?.description,maxLines: 255, fontWeight: FontWeight.w400,fontSize: 16.sp ),
             5.ph,
             Visibility(
                 visible: AppUtils.publishedAt(newsData!.publishedAt) != '',
                 child: textWidget(title : AppUtils.publishedAt(newsData!.publishedAt),fontSize: 14.sp,textColor: greyColor)),
             20.ph,


           ],
         ),
       ),
     );


   }
}
