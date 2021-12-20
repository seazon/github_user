import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:github_user/ui/views/basic_view.dart';
import 'package:github_user/ui/views/tomato/tomato_viewmodel.dart';
import 'package:github_user/widgets/circle_and_text.dart';

class TomatoView extends BasicView<TomatoViewModel> {
  late TomatoViewModel vm;

  void _updateEditing() {
    vm.updateEditing(true);
  }

  void _onTimeChanged(int index) {
    vm.onTimeChanged(index);
  }

  @override
  Widget builder(BuildContext context, TomatoViewModel vm, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Stack(
        children: [
          Center(
            child: CircleAndText(
                times: vm.times,
                seconds: vm.seconds,
                progress: vm.progress,
                editing: vm.editing,
                onTextTapped: _updateEditing,
                onSelectedItemChanged: _onTimeChanged),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: vm.toggleStartTimer,
                    child: Text(vm.buttonStartString())),
                if (vm.showPauseButton)
                  TextButton(
                      onPressed: vm.togglePauseTimer,
                      child: Text(vm.buttonPauseString())),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  TomatoViewModel viewModelBuilder(BuildContext context) {
    vm = TomatoViewModel();
    vm.init();
    return vm;
  }
}
