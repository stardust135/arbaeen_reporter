import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  final String hint;
  final List<DropdownItemData> dropdownItemData;
  final Function(DropdownItemData) callBack;

  const CustomDropDown({
    super.key,
    required this.hint,
    required this.callBack,
    required this.dropdownItemData,
  });

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  DropdownItemData? dropdownItemData;

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
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
      child: DropdownButtonFormField<DropdownItemData>(
        hint: Align(
          alignment: AlignmentDirectional.centerEnd,
          child: Text(
            widget.hint,
            style: const TextStyle(
              // fontFamily: LocalizationManager.getInstance().getFamily(),
              fontSize: 13,
            ),
          ),
        ),
        menuMaxHeight: 300,
        style: const TextStyle(
          fontSize: 14,
          color: Color(0xff707070),
        ),
        borderRadius: BorderRadius.circular(8),
        // isDense: true,
        // enableFeedback: true,
        // icon: Container(),
        // alignment: Alignment.center,
        decoration: InputDecoration(
          isDense: true,
          hintStyle: TextStyle(
            // fontFamily: LocalizationManager.getInstance().getFamily(),
            color: Colors.black87.withOpacity(0.6),
            fontSize: 13,
          ),
          border: InputBorder.none,
          constraints: const BoxConstraints(
            maxHeight: 40,
          ),
        ),
        // dropdownColor: Colors.white,
        // elevation: 2,
        // isExpanded: true,
        value: dropdownItemData,
        onChanged: (DropdownItemData? value) {
          setState(() {
            print(value);
            if(value != null){
              dropdownItemData = value;
            }
          });
          widget.callBack(value!);
        },
        items: widget.dropdownItemData.map((DropdownItemData value) {
          return DropdownMenuItem<DropdownItemData>(
            value: value,
            child: Align(
              alignment: AlignmentDirectional.topEnd,
              child: Text(
                value.text,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xff707070),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class DropdownItemData {
  final int id;
  final String text;

  DropdownItemData(this.id, this.text);
}
