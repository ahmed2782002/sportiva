// Dart imports:
import 'dart:async';

// Package imports:
import 'package:easy_localization/easy_localization.dart';

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:intl_phone_number_input/intl_phone_number_input_test.dart';
// ignore: implementation_imports
import 'package:intl_phone_number_input/src/models/country_model.dart';
// ignore: implementation_imports
import 'package:intl_phone_number_input/src/providers/country_provider.dart';
// ignore: implementation_imports
import 'package:intl_phone_number_input/src/utils/phone_number.dart';
// ignore: implementation_imports
import 'package:intl_phone_number_input/src/utils/phone_number/phone_number_util.dart';
// ignore: implementation_imports
import 'package:intl_phone_number_input/src/utils/widget_view.dart';

// Project imports:
import '../utils/constants/app_colors.dart';
import '../utils/constants/app_strings.dart';
import '../utils/constants/app_text_font.dart';
import 'auth_text_form_field.dart';

class CustomInternationalPhoneNumberInput extends StatefulWidget {
  final ValueChanged<PhoneNumber>? onInputChanged;
  final Function()? onTap;
  final ValueChanged<bool>? onInputValidated;
  final VoidCallback? onSubmit;
  final Key? fieldKey;
  final ValueChanged<String>? onFieldSubmitted;
  final String? Function(String?)? validator;
  final ValueChanged<PhoneNumber>? onSaved;
  final TextEditingController? textFieldController;
  final PhoneNumber? initialValue;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? errorMessage;
  final int maxLength;
  final String? locale;
  final bool isSpace;
  final FocusNode? focusNode;
  final Decoration? decorationSelect;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final Color? fillColor;
  final double selectorButtonOnErrorPadding;
  final bool ignoreBlank;
  final TextInputType keyboardType;
  final TextInputAction? keyboardAction;
  final double spaceBetweenSelectorAndTextField;
  final bool isEnabled;
  final Color? colorTextCode;
  final bool formatInput;
  final bool autoFocus;
  final bool autoFocusSearch;
  final AutovalidateMode autoValidateMode;
  final bool countrySelectorScrollControlled;
  final TextStyle? textStyle;
  final TextStyle? selectorTextStyle;
  final InputBorder? inputBorder;
  final InputDecoration? inputDecoration;
  final InputDecoration? searchBoxDecoration;
  final Color? cursorColor;
  final TextAlign textAlign;
  final TextAlignVertical textAlignVertical;
  final EdgeInsets scrollPadding;
  final Iterable<String>? autofillHints;
  final bool? readOnly;

  const CustomInternationalPhoneNumberInput({
    super.key,
    required this.onInputChanged,
    this.onInputValidated,
    this.colorTextCode,
    this.onSubmit,
    this.onFieldSubmitted,
    this.validator,
    this.onSaved,
    this.textFieldController,
    this.initialValue,
    this.hintText,
    this.errorMessage = AppString.invalidPhoneNumber,
    this.maxLength = 15,
    this.locale,
    this.isSpace = false,
    this.prefixIcon,
    this.focusNode,
    this.decorationSelect,
    this.border,
    this.focusedBorder,
    this.onTap,
    this.fillColor,
    this.selectorButtonOnErrorPadding = 24,
    this.ignoreBlank = false,
    this.fieldKey,
    this.keyboardAction,
    this.keyboardType = TextInputType.phone,
    this.spaceBetweenSelectorAndTextField = 12,
    this.isEnabled = true,
    this.formatInput = true,
    this.autoFocus = false,
    this.autoFocusSearch = false,
    this.autoValidateMode = AutovalidateMode.disabled,
    this.countrySelectorScrollControlled = true,
    this.textStyle,
    this.selectorTextStyle,
    this.inputBorder,
    this.inputDecoration,
    this.searchBoxDecoration,
    this.textAlign = TextAlign.start,
    this.textAlignVertical = TextAlignVertical.center,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.cursorColor,
    this.autofillHints,
    this.suffixIcon,
    this.readOnly,
  });

  @override
  State<StatefulWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<CustomInternationalPhoneNumberInput> {
  TextEditingController? controller;
  double selectorButtonBottomPadding = 0;

  Country? country;
  List<Country> countries = [];
  bool isNotValid = true;
  Decoration? decorationSelect;

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void initState() {
    super.initState();
    loadCountries();
    controller = widget.textFieldController ?? TextEditingController();
    widget.decorationSelect != null
        ? decorationSelect = widget.decorationSelect
        : decorationSelect = BoxDecoration(
            color: AppColors.black,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: AppColors.primaryColor, width: 1.w),
          );
    initialiseWidget();
  }

  @override
  Widget build(BuildContext context) {
    return _InputWidgetView(state: this);
  }

  @override
  void didUpdateWidget(CustomInternationalPhoneNumberInput oldWidget) {
    loadCountries();
    if (oldWidget.initialValue?.hash != widget.initialValue?.hash) {
      initialiseWidget();
    }
    super.didUpdateWidget(oldWidget);
  }

  void initialiseWidget() async {
    if (widget.initialValue != null) {
      if (widget.initialValue!.phoneNumber != null &&
          widget.initialValue!.phoneNumber!.isNotEmpty) {
        try {
          bool? isValid = await PhoneNumberUtil.isValidNumber(
            phoneNumber: widget.initialValue!.phoneNumber!,
            isoCode: widget.initialValue!.isoCode!,
          );

          if (isValid == true) {
            String phoneNumber = await PhoneNumber.getParsableNumber(
              widget.initialValue!,
            );
            if (widget.initialValue!.dialCode == "+964") {
              controller!.text =
                  "0${phoneNumber.replaceAll(RegExp(r'[^\d+]'), '')}";
            } else {
              controller!.text = phoneNumber.replaceAll(RegExp(r'[^\d+]'), '');
            }
            phoneNumberControllerListener();
          }
        } catch (e) {
          debugPrint('Phone number initialisation skipped: $e');
        }
      }
    }
  }

  void loadCountries({Country? previouslySelectedCountry}) {
    if (mounted) {
      List<Country> iraqOnly = CountryProvider.getCountriesData(
        countries: ['IQ'],
      );

      setState(() {
        countries = iraqOnly;
        country = iraqOnly.first;
      });
    }
  }

  void phoneNumberControllerListener() {
    if (mounted) {
      String parsedPhoneNumberString = controller!.text.replaceAll(
        RegExp(r'[^\d+]'),
        '',
      );

      getParsedPhoneNumber(parsedPhoneNumberString, country?.alpha2Code).then((
        phoneNumber,
      ) {
        if (phoneNumber == null) {
          String phoneNumber = '${country?.dialCode}$parsedPhoneNumberString';

          if (widget.onInputChanged != null) {
            widget.onInputChanged!(
              PhoneNumber(
                phoneNumber: phoneNumber,
                isoCode: country?.alpha2Code,
                dialCode: country?.dialCode,
              ),
            );
          }

          if (widget.onInputValidated != null) {
            widget.onInputValidated!(false);
          }
          isNotValid = true;
        } else {
          if (widget.onInputChanged != null) {
            widget.onInputChanged!(
              PhoneNumber(
                phoneNumber: phoneNumber,
                isoCode: country?.alpha2Code,
                dialCode: country?.dialCode,
              ),
            );
          }

          if (widget.onInputValidated != null) {
            widget.onInputValidated!(true);
          }
          isNotValid = false;
        }
      });
    }
  }

  Future<String?> getParsedPhoneNumber(
    String phoneNumber,
    String? isoCode,
  ) async {
    if (phoneNumber.isNotEmpty && isoCode != null) {
      try {
        bool? isValidPhoneNumber = await PhoneNumberUtil.isValidNumber(
          phoneNumber: phoneNumber,
          isoCode: isoCode,
        );

        if (isValidPhoneNumber!) {
          return await PhoneNumberUtil.normalizePhoneNumber(
            phoneNumber: phoneNumber,
            isoCode: isoCode,
          );
        }
      } on Exception {
        return null;
      }
    }
    return null;
  }

  void onChanged(String value) {
    phoneNumberControllerListener();
  }

  String? validator(String? value) {
    bool isValid =
        isNotValid && (value!.isNotEmpty || widget.ignoreBlank == false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (isValid && widget.errorMessage != null) {
        setState(() {
          selectorButtonBottomPadding = 24.h;
        });
      } else {
        setState(() {
          selectorButtonBottomPadding = 0;
        });
      }
    });

    return isValid ? widget.errorMessage!.tr() : null;
  }

  void onCountryChanged(Country? country) {
    setState(() {
      this.country = country;
    });
    phoneNumberControllerListener();
  }

  void _phoneNumberSaved() {
    if (mounted) {
      String parsedPhoneNumberString = controller!.text.replaceAll(
        RegExp(r'[^\d+]'),
        '',
      );

      String phoneNumber = '${country?.dialCode ?? ''}$parsedPhoneNumberString';

      widget.onSaved?.call(
        PhoneNumber(
          phoneNumber: phoneNumber,
          isoCode: country?.alpha2Code,
          dialCode: country?.dialCode,
        ),
      );
    }
  }

  void onSaved(String? value) {
    _phoneNumberSaved();
  }

  String? get locale {
    if (widget.locale == null) return null;
    if (widget.locale!.toLowerCase() == 'nb' ||
        widget.locale!.toLowerCase() == 'nn') {
      return 'no';
    }
    return widget.locale;
  }
}

class _InputWidgetView
    extends WidgetView<CustomInternationalPhoneNumberInput, _InputWidgetState> {
  // ignore: overridden_fields
  @override
  final _InputWidgetState state;

  const _InputWidgetView({required this.state}) : super(state: state);

  @override
  Widget build(BuildContext context) {
    if (widget.isSpace) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomSelectorButton(
                country: state.country,
                decorationSelect: state.decorationSelect!,
                colorTextCode: widget.colorTextCode,
              ),
              SizedBox(height: state.selectorButtonBottomPadding),
            ],
          ),
          SizedBox(width: 5.w),
          Flexible(
            child: AuthTextFormField(

              key: widget.fieldKey ?? Key(TestHelper.TextInputKeyValue),
              onTap: widget.onTap,
              readOnly: widget.readOnly ?? false,
              inputFormatters: [
                LengthLimitingTextInputFormatter(widget.maxLength),
                FilteringTextInputFormatter.digitsOnly,
              ],
              fillColor: widget.fillColor,
              focusedBorder: widget.focusedBorder,
              border: widget.border,
              focusNode: widget.focusNode,
              controller: state.controller,
              validator: widget.validator ?? state.validator,
              onChanged: state.onChanged,
              textInputType: TextInputType.phone,
              hintText: widget.hintText ?? AppString.mobileNumber.tr(),
              textStyle: widget.textStyle,
              prefixIcon: widget.prefixIcon,
              obscureText: false,
              suffixIcon: widget.suffixIcon ?? SizedBox.shrink(),
            ),
          ),
        ],
      );
    } else {
      return AuthTextFormField(
        key: widget.fieldKey ?? Key(TestHelper.TextInputKeyValue),
        onTap: widget.onTap,
        hintStyle: widget.textStyle,
        textStyle: widget.textStyle,
        readOnly: widget.readOnly ?? false,
        inputFormatters: [
          LengthLimitingTextInputFormatter(widget.maxLength),
          FilteringTextInputFormatter.digitsOnly,
        ],
        fillColor: widget.fillColor,
        focusedBorder: widget.focusedBorder,
        border: widget.border,
        focusNode: widget.focusNode,
        controller: state.controller,
        validator: widget.validator ?? state.validator,
        onChanged: state.onChanged,
        textInputType: TextInputType.phone,
        hintText: widget.hintText ?? AppString.mobileNumber.tr(),
        prefixIcon: CustomSelectorButtonNoSpace(
          country: state.country,
          colorTextCode: widget.colorTextCode,
        ),
        obscureText: false,
        suffixIcon: SizedBox.shrink(),
      );
    }
  }
}

class CustomSelectorButton extends StatelessWidget {
  final Country? country;
  final Decoration decorationSelect;
  final Color? colorTextCode;

  const CustomSelectorButton({
    super.key,
    required this.country,
    required this.decorationSelect,
    this.colorTextCode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 50.h,
      margin: EdgeInsetsDirectional.only(end: 10.w),
      decoration: decorationSelect,
      child: Row(
        children: [
          SizedBox(width: 8.w),
          ClipRRect(
            borderRadius: BorderRadius.circular(20.sp),
            child: Image.asset(
              'assets/flags/iq.png',
              width: 32.h,
              height: 32.h,
              package: 'intl_phone_number_input',
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(width: 8.w),
          Text(
            country?.dialCode ?? '+964',
            style: TextStyle(
              color: colorTextCode ?? AppColors.gray,
              fontSize: 16.sp,
              fontWeight: FontManger.regular,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomSelectorButtonNoSpace extends StatelessWidget {
  final Country? country;
  final Color? colorTextCode;

  const CustomSelectorButtonNoSpace({
    super.key,
    required this.country,
    this.colorTextCode,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(width: 8.w),
        ClipRRect(
          borderRadius: BorderRadius.circular(20.sp),
          child: Image.asset(
            'assets/flags/iq.png',
            width: 24.h,
            height: 24.h,
            package: 'intl_phone_number_input',
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(width: 4.w),
        Text(
          country?.dialCode ?? '+964',
          style: TextStyle(
            color: colorTextCode ?? AppColors.gray,
            fontSize: 14.sp,
            fontWeight: FontManger.medium,
          ),
        ),
        SizedBox(width: 8.w),
        Container(width: 1.w, height: 25.h, color: AppColors.gray),
      ],
    );
  }
}
