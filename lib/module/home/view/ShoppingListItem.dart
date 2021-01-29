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
                  child: Text(
                    data.name,
                    style: input_text_style,
                  ),
                ),
                SizedBox(width: spacing_normal),
                Text(
                  data.formattedPrice,
                  style: bold_content_text_style,
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
