import 'package:hello_world/constans/k_colors.dart';
import 'package:hello_world/constans/k_values.dart';
import 'package:hello_world/models/devotion_model.dart';
import 'package:flutter/material.dart';

class DevotionList extends ListView {
  DevotionList({Key key, this.budget, this.onItemTap}) : super(key: key);
  final List<DevotionModel> budget;
  final void Function(DevotionModel) onItemTap;

  GestureDetector _buildItemsForListView(BuildContext context, int index) {
    return GestureDetector(
        onTap: () {
          onItemTap(budget[index]);
        },
        child: Card(
          elevation: kCardElevation,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              color: Colors.white,
            ),
            child: _cardItembody(budget[index]),
          ),
        ));
  }

  Padding _cardItembody(DevotionModel devotion) {
    return Padding(
        padding: EdgeInsets.all(15),
        child: SizedBox( height: 75,
            child:
            Column(
              children: <Widget>[
                Align(alignment: Alignment.centerLeft, child:
                Text(
                  devotion.title,
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: kBlueColor),
                )),
                Align(alignment: Alignment.centerLeft, child:
                Text(devotion.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(fontWeight: FontWeight.w500, color: kBlackTextColor))
                ),
                Align(alignment: Alignment.centerLeft, child:
                Text(devotion.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(color: kGreyDarkTextColor))
                )
              ],
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.separated(
          itemCount: budget.length,
          itemBuilder: _buildItemsForListView,
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 20);
          },
        ));
  }
}
