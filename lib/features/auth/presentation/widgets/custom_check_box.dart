import '../../../../core/utils/app_colors.dart';
import '../auth_cubit/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({super.key});

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool? value = false;
  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    return Checkbox(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      value: value,
      side: BorderSide(color: AppColors.grey),
      onChanged: (newValue) {
        setState(() {
          value = newValue;
          authCubit.updateTermsAndConditionCheckBox(newValue: newValue);
        });
      },
    );
  }
}
