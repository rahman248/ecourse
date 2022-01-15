import 'package:ecourse/ui/shared/ui_helpers.dart';
import 'package:ecourse/ui/view/detail/detail_course.dart';
import 'package:ecourse/ui/viewModels/dashboard_model.dart';
import 'package:ecourse/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:stacked/stacked.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  ViewModelBuilder<DashboardViewModel>.reactive(
        viewModelBuilder: () => DashboardViewModel(),
        builder: (context, model, child) => Scaffold(
          appBar: appBar(),
          body: getBody(),
        )

    );
  }

  getBody() {
    return
      ListView(
        padding: EdgeInsets.only(left: 20,right: 20,bottom: 20,top: 40),
        children: <Widget>[
          Text("Hey SopheaMen,",style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600
          ),),
          SizedBox(height: 15,),
          Text("Find a course you want to learn",style: TextStyle(
              fontSize: 18
          ),),
          SizedBox(height: 40,),
          Container(
            height: 60,
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(30)
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: TextField(
                  controller: _searchController,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Colors.white,
                      hintText: "Search for anything",
                      hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.4)
                      ),
                      prefixIcon: Icon(LineIcons.search,color: Colors.black.withOpacity(0.8),)
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 40,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Categories",style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold
              ),),
              Text("See All",style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF6E8AFA)
              ),)
            ],
          ),
          SizedBox(height: 30,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(online_data_one.length, (index){
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_) => CourseDetailPage(
                        imgDetail: online_data_one[index]['img_detail'],
                        title: online_data_one[index]['title'],
                      )));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Stack(
                        children: <Widget>[
                          Container(
                              width: (MediaQuery.of(context).size.width - 60 ) / 2,
                              height: 200,
                              decoration: BoxDecoration(
                                  image: DecorationImage(image: AssetImage(online_data_one[index]['img']),fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(20))
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25,right: 18,left: 18),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(online_data_one[index]['title'],style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold
                                ),),
                                SizedBox(height: 8,),
                                Text(online_data_one[index]['courses'],style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black.withOpacity(0.6)
                                ),)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
              ),
              SizedBox(width: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(online_data_two.length, (index){
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_) => CourseDetailPage(
                        imgDetail: online_data_two[index]['img_detail'],
                        title: online_data_one[index]['title'],
                      )));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Stack(
                        children: <Widget>[
                          Container(
                              width: (MediaQuery.of(context).size.width - 60 ) / 2,
                              height: 240,
                              decoration: BoxDecoration(
                                  color: const Color(0xFF6E8AFA),
                                  image: DecorationImage(image: AssetImage(online_data_two[index]['img']),fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(20))
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25,right: 18,left: 18),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(online_data_two[index]['title'],style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold
                                ),),
                                verticalSpaceSmall,
                                Text(online_data_two[index]['courses'],style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black.withOpacity(0.6)
                                ),)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ],)


        ],
      );
  }
  
}