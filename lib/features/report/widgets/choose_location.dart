// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../../core/bloc/app_bloc.dart';
// import '../../../core/utils/enums.dart';
//
// class DoubleDropDown extends StatelessWidget {
//   const DoubleDropDown({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         // Select location title
//         const Padding(
//           padding: EdgeInsets.symmetric(horizontal: 27),
//           child: Align(
//             alignment: AlignmentDirectional.topStart,
//             child: Text(
//               'ستت',
//               style: TextStyle(
//                 fontSize: 13,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ),
//
//         const SizedBox(height: 5),
//
//         // Country selection
//         BlocBuilder<AppBloc, AppState?>(
//           buildWhen: (_, current) {
//             if (current?.whoCalledBloc ==
//                 WhoCalledBloc.doubleDropDown) {
//               return true;
//             }
//             return false;
//           },
//           builder: (BuildContext context, state) {
//             if (state?.whoCalledBloc ==
//                 WhoCalledBloc.doubleDropDown &&
//                 state is AppDataCompleted) {
//               AppDataCompleted appDataCompleted = state;
//               AllCountriesDataModel countriesModel =
//               appDataCompleted.appModel
//               as AllCountriesDataModel;
//
//               countries = countriesModel.data!
//                   .map((e) => EachCountry(e.id!, e.title!))
//                   .toList();
//
//               return StatefulBuilder(
//                 builder: (BuildContext context,
//                     StateSetter setCountryState) {
//                   return BlocBuilder<ChangeDataButtonCubit,
//                       bool>(
//                     builder: (BuildContext context,
//                         changeDataButtonState) {
//                       return Container(
//                         decoration: BoxDecoration(
//                           borderRadius:
//                           BorderRadius.circular(10),
//                           border: Border.all(
//                             color: Colors.grey.shade400,
//                           ),
//                         ),
//                         margin: const EdgeInsets.symmetric(
//                             horizontal: 27),
//                         child:
//                       );
//                     },
//                   );
//                 },
//               );
//             }
//             return Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 border: Border.all(
//                   color: Colors.grey.shade400,
//                 ),
//               ),
//               margin:
//               const EdgeInsets.symmetric(horizontal: 27),
//
//               // todo آیا راهی هست ست آبجکت رو طوری تنظیم کنیم ست استیت به هیچ وجه روش عمل نکنه؟
//               child: DropdownButtonFormField<EachCountry>(
//                 hint: Text(
//                   locator.settings.countryTitle == null
//                       ? LocalizationManager.getInstance()
//                       .getText('country_not_selected')
//                       : '${locator.settings.countryTitle}',
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontFamily:
//                     LocalizationManager.getInstance()
//                         .getFamily(),
//                     color: const Color(0xff707070),
//                   ),
//                 ),
//                 isDense: true,
//                 enableFeedback: true,
//                 // menuMaxHeight: 200,
//                 // icon: const Icon(Icons.keyboard_arrow_down_rounded),
//                 icon: Container(),
//                 // iconSize: 20,
//                 alignment: Alignment.center,
//                 // decoration: InputDecoration.collapsed(hintText: ''),
//                 decoration: const InputDecoration(
//                   // contentPadding: EdgeInsets.symmetric(
//                   //   horizontal: 0.0,
//                   //   vertical: 7.0,
//                   // ),
//                   border: InputBorder.none,
//                   prefixIcon: Icon(
//                     CupertinoIcons.map,
//                     size: 20,
//                   ),
//                 ),
//
//                 dropdownColor: Colors.white,
//                 borderRadius: const BorderRadius.all(
//                   Radius.circular(8),
//                 ),
//                 elevation: 2,
//                 // isExpanded: true,
//                 value: eachCountry,
//                 onChanged: null,
//                 items: null,
//               ),
//             );
//           },
//         ),
//
//         const SizedBox(height: 20),
//
//         // State selection
//         BlocBuilder<AppBloc, AppState?>(
//           buildWhen: (_, current) {
//             if (current?.whoCalledBloc ==
//                 WhoCalledBloc.statesDropDown) {
//               return true;
//             }
//             return false;
//           },
//           builder: (BuildContext context, state) {
//             if (state?.whoCalledBloc ==
//                 WhoCalledBloc.statesDropDown &&
//                 state is AppDataCompleted) {
//               AppDataCompleted appDataCompleted = state;
//               StatesOfCountryDataModel statesModel =
//               appDataCompleted.appModel
//               as StatesOfCountryDataModel;
//
//               states = statesModel.data!
//                   .map((e) => EachState(e.id!, e.title!))
//                   .toList();
//
//               return StatefulBuilder(
//                 builder: (BuildContext context,
//                     StateSetter setStatesState) {
//                   return BlocBuilder<ChangeDataButtonCubit,
//                       bool>(
//                     builder: (BuildContext context,
//                         changeDataButtonCubitState) {
//                       return Container(
//                         decoration: BoxDecoration(
//                           borderRadius:
//                           BorderRadius.circular(10),
//                           border: Border.all(
//                             color: Colors.grey.shade400,
//                           ),
//                         ),
//                         margin: const EdgeInsets.symmetric(
//                             horizontal: 27),
//                         child:
//                         DropdownButtonFormField<EachState>(
//                           isExpanded: true,
//                           hint: Align(
//                             alignment: AlignmentDirectional
//                                 .centerStart,
//                             child: Text(
//                               locator.settings.stateTitle ==
//                                   null
//                                   ? LocalizationManager
//                                   .getInstance()
//                                   .getText(
//                                   'state_not_selected')
//                                   : eachCountry == null
//                                   ? '${locator.settings.stateTitle}'
//                                   : 'استان را انتخاب کنید',
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 fontFamily: LocalizationManager
//                                     .getInstance()
//                                     .getFamily(),
//                                 color: const Color(0xff707070),
//                               ),
//                             ),
//                           ),
//                           isDense: true,
//                           enableFeedback: true,
//                           // menuMaxHeight: 200,
//                           // icon: const Icon(Icons.keyboard_arrow_down_rounded),
//                           icon: Container(),
//                           // iconSize: 20,
//                           alignment: Alignment.center,
//                           // decoration: InputDecoration.collapsed(hintText: ''),
//                           decoration: const InputDecoration(
//                             // contentPadding: EdgeInsets.symmetric(
//                             //   horizontal: 0.0,
//                             //   vertical: 7.0,
//                             // ),
//                             border: InputBorder.none,
//                             prefixIcon: Icon(
//                               CupertinoIcons.map,
//                               size: 20,
//                             ),
//                           ),
//
//                           dropdownColor: Colors.white,
//                           borderRadius: const BorderRadius.all(
//                             Radius.circular(8),
//                           ),
//                           elevation: 2,
//                           // isExpanded: true,
//                           value: eachState,
//                           onChanged: changeDataButtonCubitState
//                               ? (EachState? value) {
//                             // if (eachState != null) {
//                             //   BlocProvider.of<ButtonCubit>(context).setTrue();
//                             // }
//                             setStatesState(() {
//                               eachState = value;
//                               // citiesCubit.getCitiesEvent(value!.id);
//                             });
//                             locator.settings.stateId =
//                                 value!.id;
//                             eachCity = null;
//                             context.read<AppBloc>().add(
//                               LoadData(
//                                 callApiFunction: () async =>
//                                 await locator
//                                     .apiManager
//                                     .getCitiesOfState(
//                                     value.id),
//                                 whoCalledBloc:
//                                 WhoCalledBloc
//                                     .citiesDropDown,
//                               ),
//                             );
//                           }
//                               : null,
//                           items: states.map((EachState value) {
//                             return DropdownMenuItem<EachState>(
//                               value: value,
//                               child: Align(
//                                 alignment: AlignmentDirectional
//                                     .topStart,
//                                 child: Text(
//                                   value.title,
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     fontFamily:
//                                     LocalizationManager
//                                         .getInstance()
//                                         .getFamily(),
//                                     color: const Color(0xff707070),
//                                   ),
//                                 ),
//                               ),
//                             );
//                           }).toList(),
//                         ),
//                       );
//                     },
//                   );
//                 },
//               );
//             }
//             return Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 border: Border.all(
//                   color: Colors.grey.shade400,
//                 ),
//               ),
//               margin:
//               const EdgeInsets.symmetric(horizontal: 27),
//               child: DropdownButtonFormField<EachState>(
//                 hint: Text(
//                   LocalizationManager.getInstance()
//                       .getText('state_not_selected'),
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontFamily:
//                     LocalizationManager.getInstance()
//                         .getFamily(),
//                     color: const Color(0xff707070),
//                   ),
//                 ),
//                 isDense: true,
//                 enableFeedback: true,
//                 // menuMaxHeight: 200,
//                 // icon: const Icon(Icons.keyboard_arrow_down_rounded),
//                 icon: Container(),
//                 // iconSize: 20,
//                 alignment: Alignment.center,
//                 // decoration: InputDecoration.collapsed(hintText: ''),
//                 decoration: const InputDecoration(
//                   // contentPadding: EdgeInsets.symmetric(
//                   //   horizontal: 0.0,
//                   //   vertical: 7.0,
//                   // ),
//                   border: InputBorder.none,
//                   prefixIcon: Icon(
//                     CupertinoIcons.map,
//                     size: 20,
//                   ),
//                 ),
//
//                 dropdownColor: Colors.white,
//                 borderRadius: const BorderRadius.all(
//                   Radius.circular(8),
//                 ),
//                 elevation: 2,
//                 // isExpanded: true,
//                 value: null,
//                 onChanged: null,
//                 items: null,
//               ),
//             );
//           },
//         ),
//
//         const SizedBox(height: 20),
//
//         // City selection
//         BlocBuilder<AppBloc, AppState?>(
//           buildWhen: (_, current) {
//             if (current?.whoCalledBloc ==
//                 WhoCalledBloc.citiesDropDown) {
//               return true;
//             }
//             return false;
//           },
//           builder: (BuildContext context, state) {
//             if (state?.whoCalledBloc ==
//                 WhoCalledBloc.citiesDropDown &&
//                 state is AppDataCompleted) {
//               AppDataCompleted appDataCompleted = state;
//               CitesOfStateDataModel citiesModel =
//               appDataCompleted.appModel
//               as CitesOfStateDataModel;
//
//               cities = citiesModel.data!
//                   .map((e) => EachCity(e.id!, e.title!))
//                   .toList();
//
//               return StatefulBuilder(
//                 builder: (BuildContext context,
//                     StateSetter setCitiesState) {
//                   return BlocBuilder<ChangeDataButtonCubit,
//                       bool>(
//                     builder: (BuildContext context,
//                         changeDataButtonState) {
//                       return Container(
//                         decoration: BoxDecoration(
//                           borderRadius:
//                           BorderRadius.circular(10),
//                           border: Border.all(
//                             color: Colors.grey.shade400,
//                           ),
//                         ),
//                         margin: const EdgeInsets.symmetric(
//                             horizontal: 27),
//                         child:
//                         DropdownButtonFormField<EachCity>(
//                           isExpanded: true,
//                           hint: Align(
//                             alignment: AlignmentDirectional
//                                 .centerStart,
//                             child: Text(
//                               // locator.settings.cityTitle == null
//                               //     ? 'شهر انتخاب نشده'
//                               //     : eachState == null ? '${locator.settings.cityTitle}' : cities.first.title,
//                               locator.settings.cityTitle == null
//                                   ? LocalizationManager
//                                   .getInstance()
//                                   .getText(
//                                   'city_not_selected')
//                                   : eachState == null
//                                   ? '${locator.settings.cityTitle}'
//                                   : 'شهر را انتخاب کنید',
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 fontFamily: LocalizationManager
//                                     .getInstance()
//                                     .getFamily(),
//                                 color: const Color(0xff707070),
//                               ),
//                             ),
//                           ),
//                           isDense: true,
//                           enableFeedback: true,
//                           // menuMaxHeight: 200,
//                           // icon: const Icon(Icons.keyboard_arrow_down_rounded),
//                           icon: Container(),
//                           // iconSize: 20,
//                           alignment: Alignment.center,
//                           // decoration: InputDecoration.collapsed(hintText: ''),
//                           decoration: const InputDecoration(
//                             // contentPadding: EdgeInsets.symmetric(
//                             //   horizontal: 0.0,
//                             //   vertical: 7.0,
//                             // ),
//                             border: InputBorder.none,
//                             prefixIcon: Icon(
//                               CupertinoIcons.map,
//                               size: 20,
//                             ),
//                           ),
//
//                           dropdownColor: Colors.white,
//                           borderRadius: const BorderRadius.all(
//                             Radius.circular(8),
//                           ),
//                           elevation: 2,
//                           // isExpanded: true,
//                           value: eachCity,
//                           onChanged: changeDataButtonState
//                               ? (EachCity? value) {
//                             // if (eachState != null) {
//                             //   BlocProvider.of<ButtonCubit>(context).setTrue();
//                             // }
//                             setCitiesState(() {
//                               eachCity = value;
//                               // citiesCubit.getCitiesEvent(value!.id);
//                             });
//                             locator.settings.cityId =
//                                 value!.id;
//                           }
//                               : null,
//                           items: cities.map((EachCity value) {
//                             return DropdownMenuItem<EachCity>(
//                               value: value,
//                               child: Align(
//                                 alignment: AlignmentDirectional
//                                     .topStart,
//                                 child: Text(
//                                   value.title,
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     fontFamily:
//                                     LocalizationManager
//                                         .getInstance()
//                                         .getFamily(),
//                                     color: const Color(0xff707070),
//                                   ),
//                                 ),
//                               ),
//                             );
//                           }).toList(),
//                         ),
//                       );
//                     },
//                   );
//                 },
//               );
//             }
//             return Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 border: Border.all(
//                   color: Colors.grey.shade400,
//                 ),
//               ),
//               margin:
//               const EdgeInsets.symmetric(horizontal: 27),
//
//               // todo آیا راهی هست ست آبجکت رو طوری تنظیم کنیم ست استیت به هیچ وجه روش عمل نکنه؟
//               child: DropdownButtonFormField<EachCity>(
//                 hint: Align(
//                   alignment: AlignmentDirectional.centerStart,
//                   child: Text(
//                     locator.settings.cityTitle == null
//                         ? LocalizationManager.getInstance()
//                         .getText('city_not_selected')
//                         : '${locator.settings.cityTitle}',
//                     style: TextStyle(
//                       fontSize: 14,
//                       fontFamily:
//                       LocalizationManager.getInstance()
//                           .getFamily(),
//                       color: const Color(0xff707070),
//                     ),
//                   ),
//                 ),
//                 isDense: true,
//                 enableFeedback: true,
//                 // menuMaxHeight: 200,
//                 // icon: const Icon(Icons.keyboard_arrow_down_rounded),
//                 icon: Container(),
//                 // iconSize: 20,
//                 alignment: Alignment.center,
//                 // decoration: InputDecoration.collapsed(hintText: ''),
//                 decoration: const InputDecoration(
//                   // contentPadding: EdgeInsets.symmetric(
//                   //   horizontal: 0.0,
//                   //   vertical: 7.0,
//                   // ),
//                   border: InputBorder.none,
//                   prefixIcon: Icon(
//                     CupertinoIcons.map,
//                     size: 20,
//                   ),
//                 ),
//
//                 dropdownColor: Colors.white,
//                 borderRadius: const BorderRadius.all(
//                   Radius.circular(8),
//                 ),
//                 elevation: 2,
//                 // isExpanded: true,
//                 value: null,
//                 onChanged: null,
//                 items: null,
//               ),
//             );
//           },
//         ),
//       ],
//     );
//   }
// }
