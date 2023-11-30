import 'package:capstone_project_travel_ease/core/gen/assets.gen.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_profile/change_password/change_password_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_profile/edit_profile/edit_profile_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_profile/help/help_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_profile/profile/profile_controller.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends GetView<ProfileController> {
  static const String routeName = '/ProfilePage';
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Get.theme.colorScheme.background,
        title: Text(
          'Profile',
          style: Get.textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Get.theme.colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(
              () => controller.checkLoginController.isLogin.value != false
                  ? const InformationProfile()
                  : Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipOval(
                            child: Image.asset(
                              fit: BoxFit.fill,
                              Assets.images.noImageUser.path,
                              width: 100,
                              height: 100,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: Text(
                              'Đăng kí thành viên, hưởng nhiều ưu đãi!',
                              style: Get.textTheme.bodyMedium!.copyWith(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: InkWell(
                              onTap: () => controller.pushLogin(),
                              child: SizedBox(
                                width: Get.width,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: Colors.redAccent,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Text(
                                        'Đăng Nhập/Đăng Kí',
                                        style: Get.textTheme.bodyMedium!
                                            .copyWith(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
            ),
            Obx(() => controller.checkLoginController.isLogin.value != false
                ? Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: InkWell(
                              onTap: () =>
                                  Get.toNamed(EditProfilePage.routeName),
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Colors.redAccent,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      'Edit Profile',
                                      style: Get.textTheme.bodyMedium!
                                          .copyWith(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: InkWell(
                              onTap: () =>
                                  Get.toNamed(ChangePassWordPage.routeName),
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: Colors.grey[300]!,
                                  ),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      'Change Password',
                                      style: Get.textTheme.bodyMedium!
                                          .copyWith(color: Colors.redAccent),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                : const SizedBox.shrink()),
            CustomButton(
              text: Text(
                'My Bookmark',
                style: Get.textTheme.bodyMedium,
              ),
              onTap: () => controller.geToBookMark(),
              icon: const Icon(
                Icons.bookmark_outline_outlined,
                size: 30,
              ),
            ),
            CustomButton(
              text: Text(
                'Help',
                style: Get.textTheme.bodyMedium,
              ),
              icon: const Icon(
                Icons.help_outline,
                size: 30,
              ),
              onTap: () => Get.toNamed(HelpPage.routeName),
            ),
            CustomButton(
              text: Text(
                'Setting',
                style: Get.textTheme.bodyMedium,
              ),
              icon: const Icon(
                Icons.settings_outlined,
                size: 30,
              ),
              onTap: () {},
            ),
            CustomButton(
              text: Text(
                'Become Our Partner',
                style: Get.textTheme.bodyMedium,
              ),
              icon: const Icon(
                Icons.handshake_outlined,
                size: 30,
              ),
              onTap: () {},
            ),
            Obx(() => controller.checkLoginController.isLogin.value != false
                ? CustomButton(
                    text: Text(
                      'Log Out',
                      style: Get.textTheme.bodyMedium
                          ?.copyWith(color: Colors.redAccent),
                    ),
                    icon: const Icon(
                      Icons.login,
                      size: 30,
                      color: Colors.redAccent,
                    ),
                    onTap: () => controller.logOut(),
                  )
                : const SizedBox.shrink())
          ],
        ),
      ),
    );
  }
}

class InformationProfile extends StatelessWidget {
  const InformationProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipOval(
              child: ExtendedImage.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQyD3SI8Qdekp6twYtnVVcpKfHw7WVQGy9Yfd32EiXPZI30cEgXJ-XhquB0ObTnutlwQrM&usqp=CAU',
                width: 150,
                height: 150,
                fit: BoxFit.fill,
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
                        Assets.images.noImage.path,
                      );
                  }
                },
              ),
            ),
          ),
        ),
        Text(
          'Hoàng Văn Thắng',
          style: Get.textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'hvthang002@gmail.com',
          style: Get.textTheme.bodyMedium!.copyWith(color: Colors.grey[500]),
        )
      ],
    );
  }
}

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final Text text;
  final Icon icon;
  const CustomButton(
      {Key? key, required this.text, required this.icon, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 14),
      child: InkWell(
        onTap: onTap,
        child: DecoratedBox(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey[300]!),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
            child: Row(
              children: [
                icon,
                const SizedBox(
                  width: 10,
                ),
                text,
              ],
            ),
          ),
        ),
      ),
    );
  }
}