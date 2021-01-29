import 'package:ibu_negara/data/view/ShoppingViewData.dart';
import 'package:ibu_negara/widget/DefaultWidget.dart';

class ShoppingListItem extends StatelessWidget {
  final ShoppingViewData data;
  final Function(ShoppingViewData) onItemCheck;
  final Function(ShoppingViewData) onItemTap;
  final Key key;

  ShoppingListItem({
    @required this.data,
    @required this.onItemCheck,
    @required this.onItemTap,
    @required this.key,
  });

  void checkBoxListener(bool value) {
    data.isChecked = value;
    onItemCheck(data);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: key,
      onTap: () => onItemTap(data),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: spacing_medium),
        child: Column(
          children: [
            SizedBox(height: spacing_normal),
            Row(
              children: [
                Checkbox(
                  value: data.isChecked ?? false,
                  onChanged: checkBoxListener,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data.name, style: input_text_style),
                      Text(data.formattedAmountPrice, style: label_text_style),
                    ],
                  ),
                ),
                SizedBox(width: spacing_normal),
                Text(
                  data.formattedTotalPrice,
                  style: input_text_style.copyWith(fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(height: spacing_normal),
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey[300],
            ),
          ],
        ),
      ),
    );
  }
}
