import 'package:bpmap_app/shared/components/field/field_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PasswordTextField extends HookWidget {
  const PasswordTextField({
    super.key,
    this.controller,
    this.value,
    this.label,
    this.enabled = true,
    this.errorText,
    this.onChanged,
  }) : assert(controller != null || value != null,
            'Either controller or value must be provided');

  final TextEditingController? controller;
  final String? value;
  final String? label;
  final bool enabled;
  final String? errorText;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    final isPasswordVisible = useState(false);
    final internalController = useTextEditingController(text: value ?? '');
    useEffect(() {
      if (value != null && internalController.text != value) {
        internalController.text = value!;
      }
      return null;
    }, [value]);

    final ctrl = controller ?? internalController;
    final field = TextFormField(
      controller: ctrl,
      obscureText: !isPasswordVisible.value,
      enabled: enabled,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: label ?? 'รหัสผ่าน',
        errorText: errorText,
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
      validator: errorText == null
          ? (value) {
              if (value == null || value.isEmpty) {
                return 'กรุณากรอกรหัสผ่าน';
              }
              return null;
            }
          : null,
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
