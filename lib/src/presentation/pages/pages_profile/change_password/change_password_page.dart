import 'package:capstone_project_travel_ease/core/utils/error_empty.dart';
import 'package:capstone_project_travel_ease/core/utils/extension.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_profile/change_password/change_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePassWordPage extends GetView<ChangePassWordController> {
  static const String routeName = '/ChangePassWordPage';
  const ChangePassWordPage({Key? key}) : super(key: key);

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
          'Change Password',
          style: Get.textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Get.theme.colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const InputChange(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18.0),
                child: SizedBox(
                  width: Get.width,
                  child: GestureDetector(
                    onTap: () => controller.onChange(),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.redAccent),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Submit',
                            style: Get.theme.textTheme.titleMedium?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InputChange extends GetView<ChangePassWordController> {
  const InputChange({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.keyForm,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Old Password',
            style: Get.theme.textTheme.bodyMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 4,
          ),
          Obx(
            () => TextFormField(
              controller: controller.oldPasswordEditController,
              obscureText: !controller.showCurrentPassword.value,
              validator: (value) {
                if (value!.isEmpty) {
                  return value.checkEmpty(ErrorAndIsEmtys.password);
                }
                if (controller.oldPasswordEditController.text.contains(' ')) {
                  return ErrorAndIsEmtys.passwordSpace;
                }
                return null;
              },
              style: context.theme.textTheme.bodyMedium?.copyWith(
                  // color: context.theme.hintColor,
                  ),
              decoration: InputDecoration(
                // errorText: controller.passwordError.value,
                suffixIcon: IconButton(
                  icon: Icon(
                    controller.showCurrentPassword.value
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () => controller.togglePasswordVisibility(1),
                ),
                alignLabelWithHint: true,
                hintText: 'Current Password',
                hintStyle: context.theme.textTheme.bodySmall
                    ?.copyWith(color: Colors.grey[500]),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'New Password',
            style: Get.theme.textTheme.bodyMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 4,
          ),
          Obx(
            () => TextFormField(
              onChanged: controller.onPasswordChanged,
              controller: controller.newPasswordEditController,
              obscureText: !controller.showNewPassword.value,
              validator: (value) {
                if (value!.isEmpty) {
                  return value.checkEmpty(ErrorAndIsEmtys.password);
                }
                if (controller.newPasswordEditController.text.contains(' ') ||
                    !controller.specialCharsRegex.hasMatch(
                        controller.newPasswordEditController.text.trim())) {
                  return ErrorAndIsEmtys.passwordError;
                }
                return null;
              },
              style: context.theme.textTheme.bodyMedium?.copyWith(
                  // color: context.theme.hintColor,
                  ),
              decoration: InputDecoration(
                // errorText: controller.passwordError.value,
                suffixIcon: IconButton(
                  icon: Icon(
                    controller.showNewPassword.value
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () => controller.togglePasswordVisibility(2),
                ),
                alignLabelWithHint: true,
                hintText: 'New Password',
                hintStyle: context.theme.textTheme.bodySmall
                    ?.copyWith(color: Colors.grey[500]),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Confirm Password',
            style: Get.theme.textTheme.bodyMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 4,
          ),
          Obx(
            () => TextFormField(
              controller: controller.confirmPasswordEditController,
              obscureText: !controller.showConfirmPassword.value,
              validator: (value) {
                if (value!.isEmpty) {
                  return value.checkEmpty(ErrorAndIsEmtys.confirmPassword);
                }
                if (controller.confirmPasswordEditController.text.trim() !=
                    controller.newPasswordEditController.text.trim()) {
                  return ErrorAndIsEmtys.confirmPasswordError;
                }
                return null;
              },
              style: context.theme.textTheme.bodyMedium?.copyWith(
                  // color: context.theme.hintColor,
                  ),
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(
                    controller.showConfirmPassword.value
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () => controller.togglePasswordVisibility(3),
                ),
                alignLabelWithHint: true,
                hintText: 'Confirm Password',
                hintStyle: context.theme.textTheme.bodySmall
                    ?.copyWith(color: Colors.grey[500]),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              'Password must contains:',
              style: Get.textTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const CheckPassword()
        ],
      ),
    );
  }
}

class CheckPassword extends GetView<ChangePassWordController> {
  const CheckPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: RichText(
            text: TextSpan(
              children: [
                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Obx(
                    () => Icon(
                        controller.lengthValid.value == true
                            ? Icons.check_circle
                            : Icons.check_circle_outline,
                        color: controller.lengthValid.value == true
                            ? Colors.green
                            : null),
                  ),
                ),
                const TextSpan(text: ' '),
                TextSpan(
                  text: 'Min 8 characters',
                  style: Get.textTheme.bodySmall!.copyWith(),
                ),
                const TextSpan(text: '      '),
                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Obx(
                    () => Icon(
                        controller.uppercaseValid.value == true
                            ? Icons.check_circle
                            : Icons.check_circle_outline,
                        color: controller.uppercaseValid.value == true
                            ? Colors.green
                            : null),
                  ),
                ),
                const TextSpan(text: ' '),
                TextSpan(
                  text: 'Upper-case Letter',
                  style: Get.textTheme.bodySmall!.copyWith(),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: RichText(
            text: TextSpan(
              children: [
                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Obx(
                    () => Icon(
                        controller.lowercaseValid.value == true
                            ? Icons.check_circle
                            : Icons.check_circle_outline,
                        color: controller.lowercaseValid.value == true
                            ? Colors.green
                            : null),
                  ),
                ),
                const TextSpan(text: ' '),
                TextSpan(
                  text: 'Lower-case Letter',
                  style: Get.textTheme.bodySmall!.copyWith(),
                ),
                const TextSpan(text: '    '),
                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Obx(
                    () => Icon(
                        controller.numericValid.value == true
                            ? Icons.check_circle
                            : Icons.check_circle_outline,
                        color: controller.numericValid.value == true
                            ? Colors.green
                            : null),
                  ),
                ),
                const TextSpan(text: ' '),
                TextSpan(
                  text: 'Numbers',
                  style: Get.textTheme.bodySmall!.copyWith(),
                ),
              ],
            ),
          ),
        ),
        RichText(
          text: TextSpan(
            children: [
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: Obx(
                  () => Icon(
                      controller.specialValid.value == true
                          ? Icons.check_circle
                          : Icons.check_circle_outline,
                      color: controller.specialValid.value == true
                          ? Colors.green
                          : null),
                ),
              ),
              const TextSpan(text: ' '),
              TextSpan(
                text: 'Special Character',
                style: Get.textTheme.bodySmall!.copyWith(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
