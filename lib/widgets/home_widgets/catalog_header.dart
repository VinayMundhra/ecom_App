import 'package:catelog/widgets/themes.dart';
import 'package:flutter/Material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatelogHeader extends StatelessWidget {
  const CatelogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        'Catelog App'.text.xl5.bold.color(MyTheme.darkBluishColor).make(),
        'Trending products'.text.xl2.make(),
      ],
    );
  }
}