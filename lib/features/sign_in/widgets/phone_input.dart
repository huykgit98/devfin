import 'package:devfin/app/app.dart';
import 'package:devfin/l10n/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:phone_form_field/phone_form_field.dart';

class PhoneInput extends StatelessWidget {
  const PhoneInput({
    required this.controller,
    required this.focusNode,
    required this.selectorNavigator,
    required this.withLabel,
    required this.isCountryButtonPersistent,
    this.mobileOnly = true,
    super.key,
  });
  final PhoneController controller;
  final FocusNode focusNode;
  final CountrySelectorNavigator selectorNavigator;
  final bool withLabel;
  final bool isCountryButtonPersistent;
  final bool mobileOnly;

  PhoneNumberInputValidator? _getValidator(BuildContext context) {
    final validators = <PhoneNumberInputValidator>[];
    if (mobileOnly) {
      validators.add(PhoneValidator.validMobile(context));
    } else {
      validators.add(PhoneValidator.valid(context));
    }
    return validators.isNotEmpty ? PhoneValidator.compose(validators) : null;
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColorsTheme>()!;

    return AutofillGroup(
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: PhoneFormField(
          focusNode: focusNode,
          controller: controller,
          isCountryButtonPersistent: isCountryButtonPersistent,
          autofillHints: const [AutofillHints.telephoneNumber],
          countrySelectorNavigator: selectorNavigator,
          decoration: InputDecoration(
            border: const UnderlineInputBorder(),
            hintText: 'Phone'.hardcoded,
          ),
          validator: _getValidator(context),
          cursorColor: colors.labelColor,

          // ignore: avoid_print
          onSaved: (p) => print('saved $p'),
          // ignore: avoid_print
          onChanged: (p) => print('changed $p'),
        ),
      ),
    );
  }
}
