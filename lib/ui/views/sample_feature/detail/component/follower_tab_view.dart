import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skybase/core/themes/app_style.dart';
import 'package:skybase/domain/entities/sample_feature/sample_feature.dart';
import 'package:skybase/ui/views/sample_feature/detail/sample_feature_detail_controller.dart';
import 'package:skybase/ui/widgets/sky_image.dart';

class FollowerTabView extends GetView<SampleFeatureDetailController> {
  const FollowerTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, _) => const Divider(),
      itemCount: controller.user.value?.followersList?.length ?? 0,
      itemBuilder: (_, index) {
        final SampleFeature? user = controller.user.value?.followersList![index];
        return (user == null)
            ? const Center(
                child: Text('Tidak ada follower'),
              )
            : ListTile(
                // onTap: () => controller.onChooseUser(user: user),
                leading: CircleAvatar(
                  radius: 30,
                  child: SkyImage(
                    url: '${user.avatarUrl}&s=200',
                    borderRadius: BorderRadius.circular(90),
                  ),
                ),
                title: Text(user.username.toString()),
                subtitle: Text(
                  user.gitUrl.toString(),
                  style: AppStyle.body2,
                ),
              );
      },
    );
  }
}
