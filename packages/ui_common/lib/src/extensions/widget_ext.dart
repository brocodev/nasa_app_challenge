import 'package:flutter/cupertino.dart';

extension WidgetExt on Widget {
  SliverToBoxAdapter get toSliver => SliverToBoxAdapter(child: this);
}
