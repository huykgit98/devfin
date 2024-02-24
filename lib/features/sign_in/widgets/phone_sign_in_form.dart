import 'package:devfin/app/app.dart';
import 'package:devfin/features/sign_in/widgets/widgets.dart';
import 'package:devfin/l10n/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:phone_form_field/phone_form_field.dart';

class PhoneSignInForm extends StatefulWidget {
  const PhoneSignInForm({super.key});

  @override
  State<PhoneSignInForm> createState() => _PhoneSignInWidgetState();
}

class _PhoneSignInWidgetState extends State<PhoneSignInForm> {
  late PhoneController controller;
  late FocusNode focusNode;

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
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    focusNode.dispose();
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
            child: PhoneInput(
              controller: controller,
              focusNode: focusNode,
              selectorNavigator: selectorNavigator,
              withLabel: withLabel,
              isCountryButtonPersistent: isCountryButtonPersistent,
            ),
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: Sizes.p48,
                width: MediaQuery.of(context).size.width * 0.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Sizes.p20),
                  gradient: LinearGradient(
                    colors: colors.buttonGradient,
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
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: Sizes.p48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: LinearGradient(
                    colors: colors.buttonGradient,
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
