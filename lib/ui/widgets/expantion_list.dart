import 'package:flutter/material.dart';
import 'package:ecourse/ui/shared/shared_styles.dart' as sharedStyles;

class ExpansionList<T> extends StatefulWidget {
  final List<T>? items;
  final String? title;
  final Function(dynamic)? onItemSelected;
  final bool smallVersion;
  const ExpansionList({
    Key? key,
    this.items,
    this.title,
    @required this.onItemSelected,
    this.smallVersion = false,
  }) : super(key: key);

  @override
  _ExpansionListState createState() => _ExpansionListState();
}

class _ExpansionListState extends State<ExpansionList> {
  final double startingHeight = sharedStyles.fieldHeight;
  late double expandedHeight;
  bool expanded = false;
  late String selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.title as String;
    _calculateExpandedHeight();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      padding: sharedStyles.fieldPadding,
      duration: const Duration(milliseconds: 180),
      height: expanded
          ? expandedHeight
          : widget.smallVersion
          ? sharedStyles.smallFieldHeight
          : startingHeight,
      decoration: sharedStyles.fieldDecoration.copyWith(
        boxShadow: expanded
            ? [const BoxShadow(blurRadius: 10, color: Color(0xFFE0E0E0))]
            : null,
      ),
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(0),
        children: <Widget>[
          ExpansionListItem(
            title: selectedValue,
            onTap: () {
              setState(() {
                expanded = !expanded;
              });
            },
            showArrow: true,
            smallVersion: widget.smallVersion,
          ),
          Container(
            height: 2,
            color: Colors.grey[300],
          ),
          ...?_getDropdownListItems()
        ],
      ),
    );
  }

  List<ExpansionListItem>? _getDropdownListItems() {
    return widget.items
        ?.map((item) => ExpansionListItem(
        smallVersion: widget.smallVersion,
        title: item.toString(),
        onTap: () {
          setState(() {
            expanded = !expanded;
            selectedValue = item.toString();
          });

          widget.onItemSelected!(item);
        }))
        .toList();
  }

  void _calculateExpandedHeight() {
    expandedHeight = 2 +
        (widget.smallVersion
            ? sharedStyles.smallFieldHeight
            : sharedStyles.fieldHeight) +
        (widget.items!.length *
            (widget.smallVersion
                ? sharedStyles.smallFieldHeight
                : sharedStyles.fieldHeight));
  }
}

class ExpansionListItem extends StatelessWidget {
  final Function()? onTap;
  final String? title;
  final bool showArrow;
  final bool smallVersion;
  const ExpansionListItem({
    Key? key,
    this.onTap,
    this.title,
    this.showArrow = false,
    this.smallVersion = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        height: smallVersion
            ? sharedStyles.smallFieldHeight
            : sharedStyles.fieldHeight,
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Text(
                title ?? '',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(fontSize: smallVersion ? 12 : 15),
              ),
            ),
            showArrow
                ? Icon(
              Icons.arrow_drop_down,
              color: Colors.grey[700],
              size: 20,
            )
                : Container()
          ],
        ),
      ),
    );
  }
}