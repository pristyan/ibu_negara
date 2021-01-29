import 'package:ibu_negara/widget/DefaultWidget.dart';

class HomeBottomSheet extends StatelessWidget {
  final String totalPrice;
  final String totalCheckedPrice;
  final String totalUncheckedPrice;

  HomeBottomSheet({
    @required this.totalCheckedPrice,
    @required this.totalPrice,
    @required this.totalUncheckedPrice,
  });

  Widget _secondaryItem(String label, String value) {
    return Row(
      children: [
        Expanded(
          child: Text(label, style: label_text_style),
        ),
        Text(value, style: bold_label_text_style),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: -8,
                blurRadius: 16,
              ),
            ],
          ),
          padding: EdgeInsets.all(spacing_medium),
          child: Column(
            children: [
              _secondaryItem("Total Item Tidak Dipilih", totalUncheckedPrice),
              _secondaryItem("Total Item Dipilih", totalCheckedPrice),
              SizedBox(height: spacing_normal),
              Row(
                children: [
                  Expanded(child: Text("TOTAL", style: bold_title_text_style)),
                  Text(
                    totalPrice,
                    style: bold_title_text_style.copyWith(color: color_primary),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
