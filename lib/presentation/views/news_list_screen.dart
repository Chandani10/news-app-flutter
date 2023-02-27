import 'package:news_app_flutter/constant/export.dart';
import 'package:news_app_flutter/presentation/providers/news_provider.dart';
final newsProvider = FutureProvider<List<Articles>>((ref) => ApiRepository.fetchNews());

class NewsListScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<NewsListScreen> createState() => _NewsListScreenState();
}

class _NewsListScreenState extends ConsumerState<NewsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 249, 253, 1.0),
      appBar: appBarWidget(),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        child:
        Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final newsAsyncValue = ref.watch(newsProvider);
            //final data = ref.watch(newsProviders);
           // debugPrint('data is $data');
            return newsAsyncValue.when(
              data: (newsData) {

                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Top Headlines',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.w800),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                   newsListView(newsData),
                    ],
                  ),
                );
              },
              loading: () => Center(child: CircularProgressIndicator()),
              error: (error, stackTrace) => Text('$error'),
            );
          },
        ),


    ));
  }

  PreferredSizeWidget appBarWidget() {
    return AppBar(
      backgroundColor: Color.fromRGBO(12, 85, 190, 1.0),
      title: Text(
        'My News',
        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
      ),
      actions: [
        Center(
            child: Padding(
          padding: EdgeInsets.only(
            right: 15.0,
          ),
          child: Text(
            'IN',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
          ),
        )),
      ],
    );
  }

 Widget newsListView(List<Articles> newsData){
    return     ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount:  newsData.length,
      itemBuilder: (context, index) {
        debugPrint("length is ${newsData.length}");
        final article = newsData[index];
        return Container(
            padding: EdgeInsets.symmetric(
                horizontal: 20.0, vertical: 20.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0)),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${article.source?.name.toString()}',
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          '${'${article.title.toString()}'}',
                          maxLines: 3,
                          style: TextStyle(
                              fontSize: 16.0,
                              height: 1.5,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          '${TimeAgo.timeAgoSinceDate(('${article.publishedAt.toString()}'))}',
                          style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    'https://www.gaurology.com/wp-content/uploads/iStock-1182477852.jpg',
                    width: 130,
                    height: 130,
                    fit: BoxFit.fill,
                  ),
                )
              ],
            ));
      },

      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 20.0,
        );
      },
    );
  }

}
