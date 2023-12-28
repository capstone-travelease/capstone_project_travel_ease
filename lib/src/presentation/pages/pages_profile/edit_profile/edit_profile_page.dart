import 'package:capstone_project_travel_ease/core/constrants/Constant.dart';
import 'package:capstone_project_travel_ease/core/gen/assets.gen.dart';
import 'package:capstone_project_travel_ease/core/utils/extension.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_profile/edit_profile/edit_profile_controller.dart';
import 'package:capstone_project_travel_ease/src/presentation/widgets/bottomsheet/edit_gender_user/edit_gender_user.dart';
import 'package:capstone_project_travel_ease/src/presentation/widgets/dia_log/date_edit_user/dialog_date_edit_user.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfilePage extends GetView<EditProfileController> {
  static const String routeName = '/EditProfilePage';
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: Get.theme.colorScheme.background,
        title: Text(
          'Edit Profile',
          style: Get.textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              InformationProfile(),
              Divider(
                color: Colors.grey,
                endIndent: 30,
                indent: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0),
                child: TextFormProfile(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class InformationProfile extends GetView<EditProfileController> {
  const InformationProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                ClipOval(
                  child: ExtendedImage.network(
                    Constant.baseImageUserUrl +
                        (controller.userModel.avatar ?? ''),
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                    borderRadius: const BorderRadius.all(Radius.circular(6)),
                    shape: BoxShape.rectangle,
                    loadStateChanged: (ExtendedImageState state) {
                      switch (state.extendedImageLoadState) {
                        case LoadState.loading:
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        case LoadState.completed:
                          return null;
                        case LoadState.failed:
                          return Image.asset(
                            Assets.images.noImageUser.path,
                            fit: BoxFit.cover,
                          );
                      }
                    },
                  ),
                ),
                Positioned(
                  bottom: 1,
                  right: 0,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: IconButton(
                        icon: const Icon(Icons.camera_alt_outlined),
                        onPressed: () => controller.getGallery()),
                  ),
                )
              ],
            ),
          ),
        ),
        Text(
          controller.userModel.fullName ?? '',
          style: Get.textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          controller.userModel.email ?? '',
          style: Get.textTheme.bodyMedium!.copyWith(color: Colors.grey[500]),
        )
      ],
    );
  }
}

class TextFormProfile extends GetView<EditProfileController> {
  const TextFormProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.keyForm,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your FullName',
            style: Get.theme.textTheme.bodyMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 4,
          ),
          TextFormField(
            controller: controller.nameEditController,
            style: context.theme.textTheme.bodyMedium?.copyWith(
                // color: context.theme.hintColor,
                ),
            decoration: InputDecoration(
              alignLabelWithHint: true,
              hintText: 'Your Name',
              hintStyle: context.theme.textTheme.bodySmall
                  ?.copyWith(color: Colors.grey[500]),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'GenDer & Birthday',
            style: Get.theme.textTheme.bodyMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 4,
          ),
          SizedBox(
            height: 50,
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      final data = await Get.bottomSheet<String>(
                        BottomSheetEditGenderUser(
                            gender: controller.genDer?.value == true
                                ? "Nữ"
                                : "Nam"),
                      );
                      if (data != null) {
                        controller.selectGender(data == "Nữ" ? true : false);
                      }
                    },
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.grey[300]!)),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Obx(
                          () => Text(
                              controller.genDer?.value == true ? "Nữ" : "Nam"),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      final data = await Get.dialog<DateTime>(
                        DiaLogDateEditUserPage(
                            dateTime: controller.birthday?.value),
                      );
                      if (data != null) {
                        final newDateRange = data;
                        controller.updateDateRange(newDateRange);
                      }
                    },
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.grey[300]!)),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Obx(
                          () => Text(
                            controller.birthday?.value == null
                                ? 'Birthday'
                                : controller.birthday?.value
                                        .formatDateAndTimeToString() ??
                                    '',
                            style: Get.theme.textTheme.bodyMedium?.copyWith(
                                color: controller.birthday?.value == null
                                    ? Colors.grey
                                    : null),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Your Phone',
            style: Get.theme.textTheme.bodyMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 4,
          ),
          TextFormField(
            controller: controller.phoneEditController,
            style: context.theme.textTheme.bodyMedium?.copyWith(
                // color: context.theme.hintColor,
                ),
            decoration: InputDecoration(
              alignLabelWithHint: true,
              hintText: 'Your Phone',
              hintStyle: context.theme.textTheme.bodySmall
                  ?.copyWith(color: Colors.grey[500]),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: Get.width,
            child: GestureDetector(
              onTap: () => controller.updateUser(),
              child: DecoratedBox(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.redAccent),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Save',
                      style: Get.theme.textTheme.titleMedium?.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
