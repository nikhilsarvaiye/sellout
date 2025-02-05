import 'package:flutter/material.dart';
import 'package:sellout/config/theme.dart';
import 'package:sellout/widgets/view_options.dart';

class SizeChangingAppBar extends StatelessWidget {
  final String title;
  // final FilterRules filterRules;
  // final SortRules sortRules;
  final bool isListView;
  // final Function(FilterRules) onFilterRulesChanged;
  // final Function(SortRules) onSortRulesChanged;
  final VoidCallback onViewChanged;

  const SizeChangingAppBar(
      {Key key,
      this.title,
      // @required this.filterRules,
      // this.sortRules,
      this.isListView = true,
      // this.onFilterRulesChanged,
      // this.onSortRulesChanged,
      this.onViewChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: AppSizes.app_bar_expanded_size,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: null, //TODO add search
        )
      ],
      floating: true,
      primary: true,
      snap: false,
      pinned: false,
      /*bottom: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: ,
      ),*/
      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Text(
                title ?? 'Loading...',
                style: Theme.of(context).textTheme.caption,
              ),
            ),
            // Container(
            //   height: 30,
            //   child: VisualFilter(
            //       filterRules?.hashTags, filterRules?.selectedHashTags,
            //       (updateValue, isSelected) {
            //     BlocProvider.of<ProductsBloc>(context).add(
            //         ProductChangeHashTagEvent(updateValue, isSelected));
            //   }),
            // ),
            ViewOptions(
              // sortRules: sortRules,
              // filterRules: filterRules,
              isListView: isListView,
              onChangeViewClicked: onViewChanged,
              // onFilterChanged: onFilterRulesChanged,
              // onSortChanged: onSortRulesChanged,
            ),
          ],
        ),
      ),
    );
  }
}
