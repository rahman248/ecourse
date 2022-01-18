import 'package:ecourse/ui/shared/shared_styles.dart';
import 'package:ecourse/ui/shared/ui_helpers.dart';
import 'package:ecourse/ui/view/category/category_view.dart';
import 'package:ecourse/ui/view/popular/popular.dart';
import 'package:ecourse/ui/viewModels/dashboard_model.dart';
import 'package:ecourse/ui/widgets/category_item.dart';
import 'package:ecourse/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:stacked/stacked.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  TextEditingController _searchController = TextEditingController();
  CategoryType categoryType = CategoryType.ui;
  ScrollController controller = ScrollController();
  double topContainer = 0;
  List<Widget> itemsData = [];

  late double height;
  late double width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return ViewModelBuilder<DashboardViewModel>.reactive(
        viewModelBuilder: () => DashboardViewModel(),
        onModelReady:(model) => model.getUsersData(),
        builder: (context, model, child) => Scaffold(

              appBar: appBar('Home'),
              body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(model),
                    _buildContent(context, model)
                  ]),
            ));
  }

  _buildHeader(DashboardViewModel model) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            child: Text(
              'Hello ${model.users?.fullName},',
              style: Theme.of(context).textTheme.headline5?.copyWith(
                    fontSize: 28,
                  ),
            ),
          ),
          const Text(
            'Find a course you want to learn!',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: kTextColor,
            ),
          ),
        ],
      ),
    );
  }

  _buildCategoryHeader(context) {
    return Padding(
      padding: const EdgeInsets.all(14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Categories',
            style: Theme.of(context).textTheme.headline5?.copyWith(
                  fontSize: 18,
                ),
          ),
          const InkWell(
            child: Text(
              'See All',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: kTextColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildContent(BuildContext context, DashboardViewModel model) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _buildSearch(),
          _buildCategoryHeader(context),
          _buildCategoryList(model),
          _buildPopularUI(model)
        ],
      ),
    );
  }

  _buildSearch() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 16, top: 8, bottom: 8),
              child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xFFFFFFFF),
                    borderRadius: const BorderRadius.all(Radius.circular(38.0)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          offset: const Offset(0, 2),
                          blurRadius: 8.0)
                    ]),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 4, bottom: 4),
                  child: TextField(
                    onChanged: (String ext) {},
                    style: const TextStyle(fontSize: 18),
                    cursorColor: HexColor('#54D3C2'),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search for...',
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF00B6F0),
              borderRadius: const BorderRadius.all(
                Radius.circular(38.0),
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    offset: const Offset(0, 2),
                    blurRadius: 8.0),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: const BorderRadius.all(
                  Radius.circular(32.0),
                ),
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Icon(
                    FontAwesomeIcons.search,
                    size: 20,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _buildCategoryList(DashboardViewModel model) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(top: 8.0, left: 18, right: 16),
        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Row(
            children: <Widget>[
              getButtonUI(CategoryType.ui, categoryType == CategoryType.ui),
              const SizedBox(
                width: 16,
              ),
              getButtonUI(
                  CategoryType.coding, categoryType == CategoryType.coding),
              const SizedBox(
                width: 16,
              ),
              getButtonUI(
                  CategoryType.basic, categoryType == CategoryType.basic),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        //latestCoursesList(),
      ],
    );
  }

  Widget getButtonUI(CategoryType categoryTypeData, bool isSelected) {
    String txt = '';
    if (CategoryType.ui == categoryTypeData) {
      txt = 'Ui/Ux';
    } else if (CategoryType.coding == categoryTypeData) {
      txt = 'Coding';
    } else if (CategoryType.basic == categoryTypeData) {
      txt = 'Basic UI';
    }
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color:
                isSelected ? const Color(0xFF00B6F0) : const Color(0xFFFFFFFF),
            borderRadius: const BorderRadius.all(Radius.circular(24.0)),
            border: Border.all(color: const Color(0xFF00B6F0))),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.white24,
            borderRadius: const BorderRadius.all(Radius.circular(24.0)),
            onTap: () {
              setState(() {
                categoryType = categoryTypeData;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 12, bottom: 12, left: 18, right: 18),
              child: Center(
                child: Text(
                  txt,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    letterSpacing: 0.27,
                    color: isSelected
                        ? const Color(0xFFFFFFFF)
                        : const Color(0xFF00B6F0),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildPopularUI(DashboardViewModel model) {
    return Padding(
      padding: const EdgeInsets.all(14),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Popular Course',
            textAlign: TextAlign.left,
            style:sytleTextTitle
          ),
          Categories(),


        ],
      ),
    );
  }
}

