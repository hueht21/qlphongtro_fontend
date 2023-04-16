
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qlphongtro/app/modules/post_waiting/models/post_model.dart';

import '../../../core/utils/font_utils.dart';
import '../../../core/utils/string_img.dart';
import '../../../core/values/colors.dart';
import '../../../core/values/const.dart';
import '../../../core/values/dimens.dart';
import '../../../core/values/string_values.dart';
import '../../post_waiting/models/post.dart';

class DetailPost extends GetView{

  DetailPost(this.post, {super.key});
  PostModel post;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                width: 40,
                height: 40,
                child: Image.asset(AppImg.account)),
            const SizedBox(width: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(post.userResponse?.fullName ?? "", style: FontUtils.font14W500(),),
                const SizedBox(height: 3,),
                Text("${post.createdAt}", style: FontUtils.font12W500(),)
              ],
            ),
          ],
        ),
        const SizedBox(height: 20,),
        Text("${post.title}", style: FontUtils.font18w500(),),
        const SizedBox(
          height: 20,
        ),
        Text("${post.content}", style: FontUtils.font14W500(),),
        const SizedBox(
          height: 20,
        ),
        Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Tên chủ trọ : ", style: FontUtils.font14W500(),),
            Expanded(child: Text("${post.areaResponse!.name }", style: FontUtils.font14W500(),)),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Địa chỉ : ", style: FontUtils.font14W500(),),
            Expanded(child: Text("${post.areaResponse!.exactAddress }", style: FontUtils.font14W500(),)),
          ],
        ),
        Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Tình trạng : ", style: FontUtils.font14W500(),),
            Expanded(child: Text(post.status ==0 ? "Đang chờ" : "Đã duyệt", style: FontUtils.font14W500(),)),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 200,
          width: Get.width - 20,
          child: CachedNetworkImage(
            imageUrl : "${post.thumbnail}",
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        Row(
          children: [
            ElevatedButton(onPressed: () {}, child: Text("Phê duyệt"))
          ],
        )
      ],
    );
  }
}