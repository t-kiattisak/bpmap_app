import 'package:bpmap_app/shared/components/field/field_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PasswordTextField extends HookWidget {
  const PasswordTextField({
    super.key,
    required this.controller,
    this.label,
    this.enabled = true,
  });

  final TextEditingController controller;
  final String? label;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final isPasswordVisible = useState(false);

    final field = TextFormField(
      controller: controller,
      obscureText: !isPasswordVisible.value,
      enabled: enabled,
      decoration: InputDecoration(
        hintText: label ?? 'Password',
        suffixIcon: IconButton(
          icon: Icon(
            isPasswordVisible.value ? Icons.visibility : Icons.visibility_off,
            size: 20,
          ),
          onPressed: () {
            isPasswordVisible.value = !isPasswordVisible.value;
          },
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'กรุณากรอกรหัสผ่าน';
        }
        return null;
      },
    );

    if (label != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FieldLabel(label: label!),
          field,
        ],
      );
    }

    return field;
  }
}
