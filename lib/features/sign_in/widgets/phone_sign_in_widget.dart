import 'package:devfin/app/app.dart';
import 'package:devfin/l10n/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:phone_form_field/phone_form_field.dart';

class PhoneSignInWidget extends StatefulWidget {
  const PhoneSignInWidget({super.key});

  @override
  State<PhoneSignInWidget> createState() => _PhoneSignInWidgetState();
}

class _PhoneSignInWidgetState extends State<PhoneSignInWidget> {
  late PhoneController controller;
  final FocusNode focusNode = FocusNode();

  bool isCountryButtonPersistent = true;
  bool withLabel = true;
  CountrySelectorNavigator selectorNavigator =
      const CountrySelectorNavigator.draggableBottomSheet();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    controller = PhoneController();
    controller.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColorsTheme>()!;

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Form(
            key: formKey,
            child: PhoneFieldView(
              controller: controller,
              focusNode: focusNode,
              selectorNavigator: selectorNavigator,
              withLabel: withLabel,
              isCountryButtonPersistent: isCountryButtonPersistent,
            ),
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: Sizes.p48,
                width: MediaQuery.of(context).size.width * 0.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Sizes.p20),
                  gradient: LinearGradient(
                    colors: colors.gradientButton,
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () => formKey.currentState?.reset(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    splashFactory: NoSplash.splashFactory,
                  ),
                  child: Text(
                    'Clear'.hardcoded,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: Sizes.p48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: LinearGradient(
                    colors: colors.gradientButton,
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState?.validate() == true) {
                      formKey.currentState?.save();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    splashFactory: NoSplash.splashFactory,
                  ),
                  child: Text(
                    'Send Code'.hardcoded,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PhoneFieldView extends StatelessWidget {
  const PhoneFieldView({
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
