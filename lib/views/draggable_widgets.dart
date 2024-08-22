import 'package:flutter/material.dart';
import 'package:flutter_draggable_gridview/flutter_draggable_gridview.dart';

Widget feedback(List<DraggableGridItem> list, int index) {
  return list[index].child;
}

PlaceHolderWidget placeHolder(List<DraggableGridItem> list, int index) {
  return PlaceHolderWidget(
    child: Container(
      color: Colors.white,
      child: const Icon(
        Icons.question_mark,
        color: Colors.deepPurple,
      ),
    ),
  );
}
