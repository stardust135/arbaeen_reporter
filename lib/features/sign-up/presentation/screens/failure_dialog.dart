import 'package:flutter/material.dart';

import '../../../../core/widgets/dialog_widget.dart';

class FailureDialog extends StatelessWidget {
  const FailureDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return DialogWidget(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'خطای اتصال به سرور!',
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 17,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              'اینترنت خود را چک کرده و دوباره امتحان کنید و در صورت خطای مجدد با پشتیبانی تماس بگیرید.',
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
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
                  child: const Text(
                    'امتحان مجدد',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
