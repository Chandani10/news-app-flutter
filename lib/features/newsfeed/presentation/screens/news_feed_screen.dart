import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_flutter/app_utils/utils.dart';
import 'package:news_app_flutter/constant/colors.dart';
import 'package:news_app_flutter/features/newsfeed/presentation/screens/news_detail_screen.dart';
import 'package:news_app_flutter/widgets/custom_textStyle.dart';
import '../../domain/news_entity/news_model/news_list_state.dart';
import '../../domain/news_entity/news_model/news_model.dart';
import '../controllers/news_feed_controller.dart';

class NewsFeedView extends ConsumerStatefulWidget {
  const NewsFeedView({Key? key}) : super(key: key);

  @override
  ConsumerState<NewsFeedView> createState() => _NewsState();
}

class _NewsState extends ConsumerState<NewsFeedView> {
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        final currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: RefreshIndicator(
        backgroundColor: whiteColor,
        onRefresh: () {
          return ref.read(newsFeedController.notifier).getAllNews();
        },
        child: Scaffold(
          backgroundColor: bgColor,
          appBar: _appBarWidget(),
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 15.w),
            child: Center(
              child: Column(
                children: <Widget>[
                  Consumer(
                    builder: (BuildContext context, WidgetRef ref, Widget? child) {
                      final  isSearch = ref.watch(searchStateController.select((value) => value.isSearchVisible));
                      return isSearch == true ? SizedBox(
                          height: 50,
                          child: CupertinoSearchTextField(
                            itemColor: whiteColor,itemSize: 20.h,
                            autofocus: false,
                            controller: searchController,

                            onChanged: (value){
                              ref.watch(newsFeedController.notifier).search(value);
                            },
                            style: TextStyle(color: whiteColor),
                            padding: EdgeInsets.symmetric(horizontal: 5.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: Color.fromRGBO(49, 50, 54, 1.0),
                                border: Border.all(color: whiteColor)),
                          )) : Container();
                    },
                  ),
                  ref.watch(searchStateController.select((value) => value.isSearchVisible)) == true ? 20.ph : 5.ph,
                  Consumer(
                    builder: (context, ref, _) {
                      return ref.watch(newsFeedController).when(
                        data: (content) {
                          return _buildNewsListContainer(context, content);
                        } ,
                        error: (error,_) => Expanded(child: _buildErrorWidget(error)),
                        loading: () => Expanded(
                            child: Center(child: Platform.isAndroid ? const CircularProgressIndicator(color: whiteColor,) : const CupertinoActivityIndicator(color: whiteColor,))),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

 _appBarWidget(){
     return AppBar(
       backgroundColor: bgColor,
       elevation: 0,
       leading:  InkWell(
         onTap: (){
           searchController.clear();
           final  isSearch = ref.watch(searchStateController.select((value) => value.isSearchVisible));
           isSearch == true ? ref.watch(searchStateController.notifier).setSearchField(false) :
           ref.watch(searchStateController.notifier).setSearchField(true) ;
         },
         child: Padding(
           padding:  EdgeInsets.only(left: 10.h),
           child: Icon(Icons.search_sharp,color: whiteColor,size: 30.h,),
         ),
       ),
       centerTitle: true,
       actions: [
         _showPopupMenu(),
       ],
       title: textWidget(title: 'Headlines' , fontWeight: FontWeight.w500, fontSize: 22.sp,textColor: whiteColor),);
}

  Widget  _showPopupMenu()  {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return  PopupMenuButton<int>(elevation: 3,
          icon:   Padding(
            padding:  EdgeInsets.only(right: 10.h),
            child: Icon(Icons.filter_alt,color: whiteColor,size: 30.h,),
          ),
          onSelected: (value) {
            ref.watch(searchStateController.notifier).setSearchField(false);
            if(value == 1){
              ref.watch(newsFeedController.notifier).sortByPublishAt('publishedAt');
            }else{
              ref.watch(newsFeedController.notifier).sortByPublishAt('source');
            }
          },
          itemBuilder: (BuildContext context) {
            return [
              const PopupMenuItem(
                value: 1,
                child: Text('Publish At',style: TextStyle(fontSize: 18),),
              ),
              const PopupMenuItem(
                value: 2,
                child: Text('Source',style: TextStyle(fontSize: 18)),
              ),

            ];
          },
        );
      },
    );
  }

  Widget _buildNewsListContainer(final BuildContext context, final NewsList newsList) {
    return Expanded(child: _buildNewsList(context, newsList));
  }


  Widget _buildNewsList(final BuildContext context, final NewsList newsList) {
    if (newsList.length == 0) {
      return const Center(child: Text('No News to Show!'));
    } else {
      return Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: newsList.length,
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (final BuildContext context, final int index) {
                return _buildNewsListCardWidget(context, newsList[index]);
              },
            ),
          ),
        ],
      );
    }
  }

  Widget _buildNewsListCardWidget(final BuildContext context, final News news) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h,horizontal: 5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              height: 210.h,
              imageUrl: news.urlToImage,
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
            textWidget( title : news.source.name, fontSize: 16.sp,fontWeight: FontWeight.w700   ),
            5.ph,
            textWidget( title : news.title,maxLines: 4, fontWeight: FontWeight.w400 ),
            5.ph,
            Visibility(
                visible: AppUtils.publishedAt(news.publishedAt) != '',
                child: textWidget(title : AppUtils.publishedAt(news.publishedAt),fontSize: 14.sp,textColor: greyColor)),
            20.ph,
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  NewsDetailScreen(news)));
              },
              child: Container(height: 40.h,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: textWidget(title: 'Full coverage of this story',fontSize: 16.sp),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: Color.fromRGBO(49, 50, 54, 1.0),),
              ),
            ),
            20.ph,
            Divider(color: greyColor,thickness: 0.2,),
          ],
        ),
      );


  }

  Widget _buildErrorWidget(Object error) {
    return Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const  Icon(Icons.error_outline,size: 34,color: Colors.red,),
            SizedBox(height: 10.h,),
            Text(error.toString(),overflow: TextOverflow.ellipsis,),
          ],
    ));
  }



  @override
  void dispose() {
    super.dispose();
  }
}
