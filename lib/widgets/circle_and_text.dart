import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircleAndText extends StatelessWidget {
  const CircleAndText(
      {required this.times,
      required this.seconds,
      required this.progress,
      required this.editing,
      required this.onTextTapped,
      required this.onSelectedItemChanged,
      Key? key})
      : super(key: key);

  final List<int> times;
  final int seconds;
  final double progress;
  final bool editing;
  final GestureTapCallback onTextTapped;
  final ValueChanged<int> onSelectedItemChanged;

  String _constructTime(int seconds) {
    var minute = seconds % 3600 ~/ 60;
    var second = seconds % 60;
    return _formatTime(minute) + ":" + _formatTime(second);
  }

  String _formatTime(int timeNum) {
    return timeNum < 10 ? "0" + timeNum.toString() : timeNum.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.width * 0.7,
            width: MediaQuery.of(context).size.width * 0.7,
            child: CircularProgressIndicator(
              value: progress,
              strokeWidth: 4,
              backgroundColor: Colors.grey,
            ),
          ),
        ),
        if (!editing)
          Center(
            child: GestureDetector(
              onTap: onTextTapped,
              child: Text(
                _constructTime(seconds),
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ),
        if (editing)
          Center(
            child: SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: ListWheelScrollView.useDelegate(
                itemExtent: 120,
                diameterRatio: 1.5,
                offAxisFraction: 0,
                physics: const FixedExtentScrollPhysics(),
                onSelectedItemChanged: onSelectedItemChanged,
                childDelegate: ListWheelChildBuilderDelegate(
                    childCount: times.length,
                    builder: (BuildContext context, int index) {
                      return Center(
                        child: Text(_constructTime(times[index]),
                            style: Theme.of(context).textTheme.bodyText1),
                      );
                    }),
              ),
            ),
          ),
      ],
    );
  }
}
