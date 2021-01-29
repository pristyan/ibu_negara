import 'package:ibu_negara/core/base/BaseState.dart';
import 'package:ibu_negara/widget/DefaultWidget.dart';

class BaseNotifier<T extends BaseState> extends ChangeNotifier {
  final BuildContext context;
  final T state;

  BaseNotifier({@required this.context, @required this.state});
}
