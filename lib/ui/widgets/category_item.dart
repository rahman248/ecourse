import 'package:ecourse/ui/shared/size_cfg.dart';
import 'package:ecourse/ui/viewModels/dashboard_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';

class Categories extends StatelessWidget{
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return ViewModelBuilder<DashboardViewModel>.reactive(
          viewModelBuilder: () => DashboardViewModel(),
          onModelReady:(model) => model.getCourse(),
          builder: (context, model, child) => Scaffold()
      );
  }


}


class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String? icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(55),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(15)),
              height: getProportionateScreenWidth(55),
              width: getProportionateScreenWidth(55),
              decoration: BoxDecoration(
                color: const Color(0xFFFFECDF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(icon!),
            ),
            SizedBox(height: 5),
            Text(text!, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }

}

