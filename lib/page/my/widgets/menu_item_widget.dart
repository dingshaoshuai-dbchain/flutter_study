import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youliao/res_app/app_colors.dart';
import 'package:youliao/widgets/basis/container_widget.dart';
import 'package:youliao/widgets/basis/image_widget.dart';
import 'package:youliao/widgets/basis/text_widget.dart';

class MenuItemWidget extends StatelessWidget {
  const MenuItemWidget({super.key, this.url, this.text, this.onPressed});

  final String? url;
  final String? text;

  final GestureTapCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
      height: 42.w,
      onPressed: onPressed,
      child: Row(
        children: [
          ImageWidget(
            url: url ?? '',
            width: 20.w,
            height: 20.w,
            marginLeft: 16.w,
          ),
          Expanded(
              child: TextWidget(
            text: text ?? '',
            textColor: AppColors.color_181818,
            marginLeft: 11.w,
            fontSize: 13.sp,
            alignment: Alignment.centerLeft,
          )),
          ImageWidget(
            url: 'common/ic_next_page',
            width: 8.w,
            height: 14.w,
            marginRight: 18.w,
          )
        ],
      ),
    );
  }
}
