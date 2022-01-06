import 'package:ecourse/model/categories.dart';
import 'package:ecourse/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 20, top: 50, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/images/user.png"),
                  )
                ],
              ),
              const SizedBox(height: 30),
              const Text("Hey Rahman,", style: kHeadingextStyle),
              const Text("Find a course you want to learn", style: kSubheadingextStyle),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 30),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F7),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset("assets/icons/search.svg"),
                    const SizedBox(width: 16),
                    const Text(
                      "Search for flutter tutorial",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFFA0A5BD),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text("Category", style: kTitleTextStyle),
                  Text(
                    "See All",
                    style: kSubtitleTextSyule.copyWith(color: kBlueColor),
                  ),
                ],
              ),
              SizedBox(height: 30,),
              Expanded(
                  child: StaggeredGridView.countBuilder(
                      padding: const EdgeInsets.all(0),
                      crossAxisCount: 2,
                      itemCount: categories.length,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      itemBuilder: (context, index){
                        return Container(
                          padding: EdgeInsets.all(20),
                          height: index.isEven ? 200 : 240,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image: DecorationImage(
                              image: AssetImage(categories[index].image),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                categories[index].name,
                                style: kTitleTextStyle,
                              ),
                              Text(
                                '${categories[index].numOfCourses} Courses',
                                style: TextStyle(
                                  color: kTextColor.withOpacity(.5),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
                  ),
              ),

            ],
          ),
        ),
    );
  }
}
