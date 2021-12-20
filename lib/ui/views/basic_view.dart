import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:github_user/util/log_plugin.dart';

abstract class BasicView<T extends ChangeNotifier>
    extends ViewModelBuilderWidget<T> with LogPlugin {}
