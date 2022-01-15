import 'package:ecourse/ui/shared/ui_helpers.dart';
import 'package:ecourse/ui/view/profile/profile_menu.dart';
import 'package:ecourse/ui/view/profile/profile_pic.dart';
import 'package:ecourse/ui/viewModels/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var mHeight = MediaQuery.of(context).size.height;
    var mWidth = MediaQuery.of(context).size.width;
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return  ViewModelBuilder<ProfileViewModel>.reactive(
      viewModelBuilder: () => ProfileViewModel(),
      builder: (context, model, child) => Scaffold(
          appBar: appBar(),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                const ProfilePic(),
                SizedBox(height: 20),
                ProfileMenu(
                  text: "My Account",
                  icon: "assets/icons/profile.svg",
                  press: () => {},
                ),
                ProfileMenu(
                  text: "Notifications",
                  icon: "assets/icons/Bell.svg",
                  press: () {},
                ),
                ProfileMenu(
                  text: "Settings",
                  icon: "assets/icons/settings.svg",
                  press: () {},
                ),
                ProfileMenu(
                  text: "Help Center",
                  icon: "assets/icons/Question mark.svg",
                  press: () {},
                ),
                ProfileMenu(
                  text: "Log Out",
                  icon: "assets/icons/logout.svg",
                  press: () {},
                ),
              ],
            ),
          ),
      ),
    );
  }


  AppBar _appBar(){
    return AppBar(
      title: Text("Hello Appbar"),
      leading: GestureDetector(
        onTap: () { /* Write listener code here */ },
        child: Icon(
          Icons.menu,  // add custom icons also
        ),
      ),
      actions: <Widget>[
        Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.search,
                size: 26.0,
              ),
            )
        ),
        Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: Icon(
                  Icons.more_vert
              ),
            )
        ),
      ],
    );
  }

}