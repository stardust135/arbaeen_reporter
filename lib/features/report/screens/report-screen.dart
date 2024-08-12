
import 'package:arbaeen_reporter/locator.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/drop_down.dart';
import '../../../core/widgets/text_form_field.dart';
import '../widgets/forms_container.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  late int userId;
  String? selectedLocationType;

  @override
  void initState() {
    _fetchReportScreenData();
    super.initState();
  }

  final Map<String, TextEditingController> controllers = {
    'titleController': TextEditingController(),
    'importanceLevelController': TextEditingController(),
    'textController': TextEditingController(),
    'summaryController': TextEditingController(),
    'solutionController': TextEditingController(),
  };

  var firstDropdownItems = [
    DropdownItemData(1, 'مرز'),
    DropdownItemData(2, 'طریق'),
    DropdownItemData(3, 'سایر'),
  ];

  var secondDropdownItems = [
    DropdownItemData(1, 'ایران'),
    DropdownItemData(2, 'عراق'),
    DropdownItemData(3, 'آمریکا'),
  ];

  var subjectsDropdownItems = [
    DropdownItemData(1, 'گزارش باب اسفنجی'),
    DropdownItemData(2, 'گزارش آقای خرچنگ'),
    DropdownItemData(3, 'گزارش پاتریک'),
  ];

  var importanceLevelDropdownItems = [
    DropdownItemData(1, 'خیلی بالا'),
    DropdownItemData(2, 'خیلی خیلی بالا'),
  ];

  @override
  Widget build(BuildContext context) {
    double contentsWidth = MediaQuery.of(context).size.width * 0.83;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.grey.shade800,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Align(
                alignment: Alignment.topRight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          FormsContainer(
                            title: 'انتخاب مکان',
                            body: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                children: [
                                  CustomDropDown(
                                    hint: 'انتخاب',
                                    dropdownItemData: firstDropdownItems,
                                    callBack: (DropdownItemData v) {
                                      setState(() {
                                        selectedLocationType = v.text;
                                      });
                                    },
                                  ),
                                  if (selectedLocationType != null)
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: CustomDropDown(
                                        hint: 'انتخاب $selectedLocationType',
                                        dropdownItemData: secondDropdownItems,
                                        callBack: (selectedItemId) {
                                          logger.e(selectedItemId);
                                        },
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            width: contentsWidth,
                          ),
                          FormsContainer(
                            title: 'موضوع',
                            body: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: CustomDropDown(
                                hint: 'انتخاب موضوع',
                                dropdownItemData: subjectsDropdownItems,
                                callBack: (DropdownItemData v) {
                                  setState(() {
                                    selectedLocationType = v.text;
                                  });
                                },
                              ),
                            ),
                            width: contentsWidth,
                          ),
                          FormsContainer(
                            title: 'آپلود عکس',
                            body: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: DottedBorder(
                                borderType: BorderType.RRect,
                                strokeWidth: 0.5,
                                radius: const Radius.circular(3),
                                padding: const EdgeInsets.all(15),
                                child: Container(
                                  // height: 200,
                                  // width: 120,
                                  padding: const EdgeInsets.all(0),
                                  alignment: Alignment.center,
                                  child: Transform.translate(
                                    offset: const Offset(0, 10),
                                    child: Column(
                                      children: [
                                        Icon(
                                          CupertinoIcons.cloud_upload,
                                          color: Colors.black54.withOpacity(0.1),
                                          size: 100,
                                        ),
                                        Transform.translate(
                                          offset: const Offset(0, -15),
                                          child: Text(
                                            'انتخاب عکس...',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color:
                                              Colors.black54.withOpacity(0.2),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            width: contentsWidth,
                          ),

                          FormsContainer(
                            title: 'گزارش',
                            body: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  CustomTextFormField(
                                    controller: TextEditingController(),
                                    hintText: 'عنوان گزارش...',
                                    title: 'سلام',
                                  ),
                                  CustomTextFormField(
                                    controller: TextEditingController(),
                                    hintText: 'خلاصه گزارش...',
                                    title: 'سلام',
                                    maxLines: 7,
                                  ),
                                  CustomTextFormField(
                                    controller: TextEditingController(),
                                    hintText: 'متن گزارش...',
                                    title: 'سلام',
                                    maxLines: 7,
                                  ),
                                  CustomTextFormField(
                                    controller: TextEditingController(),
                                    hintText: 'راهکار های پیشنهادی...',
                                    title: 'سلام',
                                    maxLines: 7,
                                  ),
                                ],
                              ),
                            ),
                            width: contentsWidth,
                          ),
                          FormsContainer(
                            title: 'درجه اهمیت',
                            body: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: CustomDropDown(
                                hint: 'انتخاب درجه اهمیت گزارش',
                                dropdownItemData: importanceLevelDropdownItems,
                                callBack: (DropdownItemData v) {
                                  setState(() {
                                    selectedLocationType = v.text;
                                  });
                                },
                              ),
                            ),
                            width: contentsWidth,
                          ),
                        ],
                      ),
                    ),

                    // Confirm button
                    Center(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          elevation: 1,
                          backgroundColor: Colors.blue.shade700,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.0),
                          ),
                        ),
                        child: const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                          child: Text(
                            'ارسال',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _fetchReportScreenData() async {
    // context.read<AppBloc>().add(
    //       FetchData(
    //         callApiFunction: await locator.apiManager.fetchReportScreenData(),
    //         whoCalledBloc: WhoCalledBloc.reportScreen,
    //       ),
    //     );
  }

  // this method send userId and spinnerId to database to know with items submitted.
  void callSubmitReport({
    required int userId,
    required int itemId,
  }) {
    // context.read<SpinnerBloc>().add(SubmitSpinnerItem(
    //   userId: userId,
    //   itemId: itemId,
    // ));
  }
}
// todo ذخیره کردن حالت لاگین یوزر و گذاشتن دکمه ای برای لاگ آوت
