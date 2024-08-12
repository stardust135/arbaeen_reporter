import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/dialog_widget.dart';
import '../bloc/sign_up_bloc.dart';
import 'failure_dialog.dart';

class VerifyDialog extends StatefulWidget {
  final int verifyCode;
  final String phone;

  const VerifyDialog(
      {super.key, required this.verifyCode, required this.phone});

  @override
  State<VerifyDialog> createState() => _VerifyDialogState();
}

class _VerifyDialogState extends State<VerifyDialog> {
  final _phoneFormKey = GlobalKey<FormState>();
  final _codeInputController = TextEditingController();
  late Timer _timer;
  late int _startTime;
  int eachTimerValue = 30;
  String? validatorText;
  bool verifyCodeEntered = false;
  late FailureDialog failureDialog;

  @override
  void initState() {
    _startTime = eachTimerValue;
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        if (_startTime == 1) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _startTime--;
          });
        }
      },
    );
    failureDialog = const FailureDialog();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DialogWidget(
      child: Form(
        key: _phoneFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'تایید شماره تلفن',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
              ),
              const SizedBox(height: 7),
              const Text('کد پنج رقمی پیامک شده را وارد کنید'),
              const SizedBox(height: 20),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 350),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          onChanged: (String? value) {
                            setState(() {
                              _codeInputController.text.isNotEmpty
                                  ? verifyCodeEntered = true
                                  : verifyCodeEntered = false;
                            });
                          },
                          style: TextStyle(
                            color: Colors.black87.withOpacity(0.7),
                            fontSize: 15,
                          ),
                          controller: _codeInputController,
                          onFieldSubmitted: (term) {},
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            hintText: 'وارد کردن کد تایید',
                            hintStyle: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 14,
                            ),
                            contentPadding:
                                const EdgeInsets.fromLTRB(15, 0, 0, 0),
                            prefixIcon: const IconButton(
                              iconSize: 20,
                              highlightColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              icon: Icon(
                                Icons.delete,
                                size: 18,
                                color: Colors.transparent,
                              ),
                              onPressed: null,
                            ),
                            suffixIcon: verifyCodeEntered
                                ? IconButton(
                                    iconSize: 20,
                                    highlightColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    icon: Icon(
                                      verifyCodeEntered == true
                                          ? Icons.delete
                                          : null,
                                      size: 18,
                                    ),
                                    onPressed: () {
                                      _codeInputController.clear();
                                      setState(() {
                                        verifyCodeEntered = false;
                                      });
                                    },
                                  )
                                : const IconButton(
                                    iconSize: 20,
                                    highlightColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    icon: Icon(
                                      Icons.delete,
                                      size: 18,
                                      color: Colors.transparent,
                                    ),
                                    onPressed: null,
                                  ),

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
              }, builder: (context, state) {
                return InkWell(
                  onTap: () {
                    confirmCode(widget.verifyCode);
                  },
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 350,
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
                              'تایید',
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
              if (_startTime > 1)
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'ارسال مجدد بعد از $_startTime ثانیه',
                      style: const TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
              else
                TextButton(
                  onPressed: () {
                    reCallSmsApi(widget.phone, widget.verifyCode);
                    _startTime = eachTimerValue;
                    _timer = Timer.periodic(
                      const Duration(seconds: 1),
                      (Timer timer) {
                        if (_startTime == 1) {
                          setState(() {
                            timer.cancel();
                          });
                        } else {
                          setState(() {
                            _startTime--;
                          });
                        }
                      },
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: const Text(
                      'ارسال مجدد',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
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

  void reCallSmsApi(String phone, int randomNumber) {
    context.read<SignUpBloc>().add(
          SendSmsEvent(
            phone: phone,
            firstTimeSending: false,
          ),
        );
  }

  void setValidatorText(String message) {
    setState(() {
      validatorText = message;
    });
  }

  void confirmCode(int randomNumber) {
    String inputCode = _codeInputController.text;
    if (inputCode.isEmpty) {
      setValidatorText('این فیلد نمی‌تواند خالی باشد!');
    } else {
      if (inputCode == randomNumber.toString()) {
        Navigator.pop(context);
        Navigator.pop(context);
      } else {
        setValidatorText('کد وارد شده اشتباه است!');
      }
    }
  }
}
