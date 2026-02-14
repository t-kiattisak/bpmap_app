import 'package:bpmap_app/shared/components/field/field_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AppTextField extends HookWidget {
  const AppTextField({
    super.key,
    this.controller,
    this.value,
    this.label,
    this.hintText,
    this.keyboardType,
    this.validator,
    this.enabled = true,
    this.suffixIcon,
    this.errorText,
    this.onChanged,
  }) : assert(controller != null || value != null,
            'Either controller or value must be provided');

  final TextEditingController? controller;
  final String? value;
  final String? label;
  final String? hintText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool enabled;
  final Widget? suffixIcon;
  final String? errorText;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
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
      keyboardType: keyboardType,
      enabled: enabled,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon,
        errorText: errorText,
      ),
      validator: validator,
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
