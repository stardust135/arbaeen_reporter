import 'package:arbaeen_reporter/features/sign-up/presentation/screens/verify_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

import '../../../../core/widgets/dialog_widget.dart';
import '../bloc/sign_up_bloc.dart';

class SignUpDialog extends StatefulWidget {
  const SignUpDialog({super.key});

  @override
  State<SignUpDialog> createState() => _SignUpDialogState();
}

class _SignUpDialogState extends State<SignUpDialog> {
  final _signUpFormKey = GlobalKey<FormState>();
  final _numberInputController = TextEditingController();
  late int randomNumber;
  bool phoneNumbEntered = false;
  String? validatorText;

  @override
  Widget build(BuildContext context) {
    return DialogWidget(
      child: Form(
        key: _signUpFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'ورود',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
              ),
              const SizedBox(height: 7),
              const Text('برای ورود شماره موبایل خود را وارد کنید'),
              const SizedBox(height: 20),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 320),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(
                          vertical: 3, horizontal: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(0, 2),
                            blurRadius: 10,
                            color: Color(0x19000000),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '+98',
                            style: TextStyle(
                              color: Colors.black87.withOpacity(0.7),
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(0, 2),
                              blurRadius: 10,
                              color: Color(0x19000000),
                            ),
                          ],
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          onChanged: (String? value) {
                            setState(() {
                              _numberInputController.text.isNotEmpty
                                  ? phoneNumbEntered = true
                                  : phoneNumbEntered = false;
                            });
                          },
                          style: TextStyle(
                            color: Colors.black87.withOpacity(0.7),
                            fontSize: 15,
                          ),
                          controller: _numberInputController,
                          onFieldSubmitted: (term) {},
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            hintText: 'وارد کردن شماره موبایل',
                            hintStyle: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 14,
                            ),
                            contentPadding:
                                const EdgeInsets.fromLTRB(15, 0, 0, 0),

                            suffixIcon: phoneNumbEntered
                                ? IconButton(
                                    iconSize: 20,
                                    highlightColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    icon: Icon(
                                      phoneNumbEntered == true
                                          ? Icons.delete
                                          : null,
                                      size: 18,
                                    ),
                                    onPressed: () {
                                      _numberInputController.clear();
                                      setState(() {
                                        phoneNumbEntered = false;
                                      });
                                    },
                                  )
                                : null,

                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0)),
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            //
                            enabledBorder: const OutlineInputBorder(
                              gapPadding: 0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (validatorText != null)
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      validatorText!,
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
              else
                const SizedBox(height: 15),
              //sign up button
              BlocConsumer<SignUpBloc, SignUpState>(listener: (context, state) {
                if (state is Loading) {
                  setState(() {
                    validatorText = null;
                  });
                }
                if (state is Error) {
                  setState(() {
                    validatorText = state.message;
                  });
                }
                if (state is UserDataCompleted) {
                  // randomNumber = createRandomNumber();
                  callSmsApi(_numberInputController.text);
                  // widget.onSignUpCompleted(state.user.userId);
                  Logger().e('state is user data completed');
                }
                if (state is SmsSent) {
                  if (state.firstTimeSending) {
                    showDialog(
                      barrierDismissible: false,
                      barrierColor: Colors.transparent,
                      context: context,
                      builder: (BuildContext context) {
                        return VerifyDialog(
                          verifyCode: randomNumber,
                          phone: _numberInputController.text,
                        );
                      },
                    );
                  }
                }
              }, builder: (context, state) {
                return InkWell(
                  onTap: () {
                    if (_signUpFormKey.currentState!.validate()) {
                      confirmSignUp();
                    }
                  },
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 320,
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 42,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.blue.withOpacity(0.9),
                      ),
                      child: state is Loading
                          ? const SizedBox(
                              width: 25,
                              height: 25,
                              child: CircularProgressIndicator(
                                color: Colors.red,
                                strokeWidth: 2,
                              ),
                            )
                          : const Text(
                              'ورود',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  void confirmSignUp() {
    String phone = _numberInputController.text;

    if (phone.isEmpty) {
      setValidatorText('این فیلد نمی‌تواند خالی باشد!');
    } else if (isValidPhoneNumber(phone)) {
      callSmsApi(_numberInputController.text);
    } else {
      setValidatorText('شماره را به فرمت صحیح وارد کنید!');
    }
  }

  bool isValidPhoneNumber(String text) {
    return text.replaceAll(RegExp(r'^0+'), '').length == 10;
  }

  void setValidatorText(String message) {
    setState(() {
      validatorText = message;
    });
  }

  void callSmsApi(String phone) {
    context.read<SignUpBloc>().add(
          SendSmsEvent(
            phone: phone,
            firstTimeSending: true,
          ),
        );
  }
}
