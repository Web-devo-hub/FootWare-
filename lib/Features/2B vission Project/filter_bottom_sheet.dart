import 'package:flutter/material.dart';
import 'package:footware/Features/2B%20vission%20Project/filter_widget.dart';
import 'package:footware/theme_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class PatientBottomSheet extends StatefulWidget {
  const PatientBottomSheet({super.key});

  @override
  State<PatientBottomSheet> createState() => _PatientBottomSheetState();
}

class _PatientBottomSheetState extends State<PatientBottomSheet> {
  bool isStatOnly = false;
  final Set<String> selectedSorts = {};
  final TextEditingController dateController = TextEditingController();
  final TextEditingController patientNameController = TextEditingController();
  final TextEditingController accessionController = TextEditingController();
  final TextEditingController orderNumberController = TextEditingController();

  void toggleSort(String key, void Function(void Function()) setModalState) {
    setModalState(() {
      if (selectedSorts.contains(key)) {
        selectedSorts.remove(key);
      } else {
        selectedSorts.add(key);
      }
    });
  }

  int get selectedCount => [
    patientNameController,
    dateController,
    accessionController,
    orderNumberController,
  ].where((c) => c.text.trim().isNotEmpty).length;

  int get activeCount => selectedCount + (isStatOnly ? 1 : 0);

  Future<void> pickDate(StateSetter setModalState) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setModalState(() {
        dateController.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  @override
  @override
  void initState() {
    patientNameController.addListener(() {
      setState(() {});
    });
    accessionController.addListener(() {
      setState(() {});
    });
    orderNumberController.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        toolbarHeight: 100,
        actions: [
          IconButton(onPressed: (){
            Get.changeThemeMode(ThemeMode.light);
          }, icon : Icon(Icons.light_mode),
          ),
          IconButton(onPressed: (){
            Get.changeThemeMode(ThemeMode.dark);
          }, icon : Icon(Icons.dark_mode),
          ),
          // ValueListenableBuilder<ThemeMode>(
          //   valueListenable: themeNotifier,
          //   builder: (context, mode, _) => IconButton(
          //     tooltip: mode == ThemeMode.dark ? "Light mode" : "Dark mode",
          //     icon: Icon(
          //       mode == ThemeMode.dark ? Icons.light_mode : Icons.dark_mode,
          //     ),
          //     onPressed: () {
          //       themeNotifier.value = mode == ThemeMode.dark
          //           ? ThemeMode.light
          //           : ThemeMode.dark;
          //     },
          //   ),
          // ),
        ],
      ),
      body: FloatingActionButton(
        child: Icon(Icons.filter_list_alt),
        onPressed: () {
          showModalBottomSheet(
            constraints: BoxConstraints(
                maxWidth: double.infinity,
              maxHeight: MediaQuery.of(context).size.height * 0.8,
            ),
            useSafeArea: true,
            backgroundColor: AppColors.of(context).sheetBg, // CHANGED
            isScrollControlled: true,
            barrierColor: Colors.transparent,
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            isDismissible: true,
            context: context,
            builder: (context) {
              return StatefulBuilder(
                builder: (context, setModalState) {
                  final c = AppColors.of(context);
                  return SingleChildScrollView(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            margin: EdgeInsets.only(top: 20),
                            width: 60,
                            height: 5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: c.handle, // CHANGED
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Sort & Filter",
                                style: TextStyle(
                                  color: c.title, // CHANGED
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                width: 95,
                                height: 27,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.transparent,
                                  border: BoxBorder.all(
                                    color: Color(0xFF38BDF8),
                                    width: 1,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(
                                        0xFF2F9CCE,
                                      ).withOpacity(0.25),
                                      blurRadius: 10,
                                      spreadRadius: 1,
                                      offset: Offset(0, 0),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Icons.circle,
                                      color: Color(0xFF2F9CCE),
                                      size: 10,
                                    ),
                                    Text(
                                      "$activeCount  Active",
                                      style: TextStyle(
                                        color: Color(0xFF2F9CCE),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              // SizedBox(height: 20,),
                              TextButton(
                                onPressed: () {

                                  setModalState(() {
                                    selectedSorts.clear();
                                    patientNameController.clear();
                                    dateController.clear();
                                    accessionController.clear();
                                    orderNumberController.clear();
                                    isStatOnly = false;
                                  });
                                },
                                child: Text(
                                  "Reset All",
                                  style: TextStyle(
                                    color: c.subtitle, // CHANGED
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(color: c.divider), // CHANGED
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.swap_vert, color: c.icon), // CHANGED
                                  Text(
                                    "SORT ORDERS BY",
                                    style: TextStyle(
                                      color: c.subtitle, // CHANGED
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    " $selectedCount Selected",
                                    style: TextStyle(
                                      color: c.subtitle, // CHANGED
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),

                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  FilterWidget(
                                    onChanged: (_) => setModalState(() {}),
                                    isSelected: patientNameController.text
                                        .trim()
                                        .isNotEmpty,
                                    onTap: () =>
                                        toggleSort('patient', setModalState),
                                    widgetIcon: Icons.person_outline,
                                    widgetName: "Patient Name :",
                                    widgetDescription: "Alphabetical order",
                                    topRightWidget: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 5,
                                        vertical: 5,
                                      ),
                                      // width: 60,
                                      // height: 30,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF17435A),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                        border: BoxBorder.all(
                                          width: 0.5,
                                          color: Color(0xFF3B8EAF),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            "A",
                                            style: TextStyle(
                                              color: Color(0xFFAEDCF2),
                                              fontSize: 13,
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_right_alt,
                                            color: Color(0xFFAEDCF2),
                                            size: 13,
                                          ),
                                          Text(
                                            "Z",
                                            style: TextStyle(
                                              color: Color(0xFFAEDCF2),
                                              fontSize: 13,
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_upward_outlined,
                                            color: Color(0xFFAEDCF2),
                                            size: 13,
                                          ),
                                        ],
                                      ),
                                    ),
                                    controller: patientNameController,
                                  ),
                                  FilterWidget(
                                    onChanged: (_) => setModalState(() {}),
                                    onTapOfEnterText: () =>
                                        pickDate(setModalState),
                                    isSelected: dateController.text
                                        .trim()
                                        .isNotEmpty,
                                    onTap: () =>
                                        toggleSort('date', setModalState),
                                    widgetIcon: Icons.calendar_today_outlined,
                                    widgetName: "Date :",
                                    widgetDescription: "Order assigned time",
                                    topRightWidget: Text(
                                      "Newest",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 13,
                                      ),
                                    ),
                                    controller: dateController,
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),

                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  FilterWidget(
                                    onChanged: (_) => setModalState(() {}),

                                    isSelected: accessionController.text
                                        .trim()
                                        .isNotEmpty,

                                    onTap: () =>
                                        toggleSort('accession', setModalState),
                                    widgetIcon: Icons.tag_outlined,
                                    widgetName: "Accession #",
                                    widgetDescription: "Numerical order",
                                    topRightWidget: Text(
                                      "#ACC-98...",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 13,
                                      ),
                                    ),
                                    controller: accessionController,
                                  ),
                                  FilterWidget(
                                    onChanged: (_) => setModalState(() {}),
                                    isSelected: orderNumberController.text
                                        .trim()
                                        .isNotEmpty,
                                    onTap: () =>
                                        toggleSort('order', setModalState),
                                    widgetIcon: Icons.receipt_long,
                                    widgetName: "Order Number #",
                                    widgetDescription: "Numerical order",
                                    topRightWidget: Text(
                                      "#ORD-1024",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 13,
                                      ),
                                    ),
                                    controller: orderNumberController,
                                  ),
                                ],
                              ),
                              SizedBox(height: 25),
                              Row(
                                children: [
                                  Icon(
                                    Icons.wb_twilight_outlined,
                                    color: Colors.redAccent,
                                  ),
                                  SizedBox(width: 3),
                                  Text(
                                    "ORDER PRIORITY FILTER",
                                    style: TextStyle(
                                      color: c.subtitle, // CHANGED
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    "STAT Only",
                                    style: TextStyle(
                                      color: Colors.redAccent,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Container(
                                width: double.infinity,
                                // height: 115,
                                decoration: BoxDecoration(
                                  color: c.statBg, // CHANGED
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(20.0),
                                  child: Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 1,
                                            color: Colors.red.shade900,
                                          ),
                                          color: Color(0xFFA12F48),
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 15),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Flexible(
                                                  child: Text(
                                                    "Is STAT Order",
                                                    style: TextStyle(
                                                      overflow: TextOverflow.ellipsis,
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.bold,
                                                      color: c.statTitle, // CHANGED
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 10),
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 5,
                                                    vertical: 5,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      width: 1,
                                                      color: Color(0xFFCC3753),
                                                    ),
                                                    color: Color(0xFFA12F48),
                                                    borderRadius:
                                                    BorderRadius.circular(5),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        "URGENT",
                                                        style: TextStyle(
                                                          color: Color(
                                                            0xFFFDA4AF,
                                                          ),
                                                          fontSize: 13,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              "Filter exclusively for high-priority collection orders",
                                              style: TextStyle(
                                                color: c.statText, // CHANGED
                                              ),
                                              softWrap: true,
                                            ),

                                          ],
                                        ),
                                      ),
                                      // Spacer(),
                                      Switch(
                                        value: isStatOnly,
                                        onChanged: (value) {
                                          setModalState(() {
                                            isStatOnly = value;
                                          });
                                        },
                                        activeTrackColor: Colors.red,
                                        activeThumbColor: Colors.white,
                                        inactiveTrackColor: Color(0xFFD1D5DB),
                                        inactiveThumbColor: Colors.white,
                                        trackOutlineColor:
                                        WidgetStateProperty.all(
                                          Colors.redAccent,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Divider(color: c.divider), // CHANGED
                        SizedBox(height: 10),

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 60,
                                  // width: MediaQuery.of(context).size.width*0.25,
                                  decoration: BoxDecoration(
                                    color: c.cancelBg, // CHANGED
                                    border: BoxBorder.all(
                                      width: 0.2,
                                      color: c.cancelBg, // CHANGED
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      patientNameController.clear();
                                      dateController.clear();
                                      accessionController.clear();
                                      orderNumberController.clear();
                                      isStatOnly = false;
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "Cancel",
                                      style: TextStyle(
                                        color: c.cancelText, // CHANGED
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10,),
                              Expanded(
                                flex: 3,
                                child: Container(
                                  height: 60,
                                  // width: MediaQuery.of(context).size.width*0.6,
                                  decoration: BoxDecoration(
                                    color: Colors.blueAccent,
                                    border: BoxBorder.all(
                                      width: 0.2,
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: TextButton.icon(
                                    onPressed: () {
                                      final cardDetails = {
                                        "patientName": patientNameController.text,
                                        "date": dateController.text,
                                        "accession": accessionController.text,
                                        "orderNumber": orderNumberController.text,
                                        "statOrder": isStatOnly,
                                      };
                                      print(cardDetails);
                                    },
                                    icon: Icon(
                                      Icons.check_circle_outline,
                                      color: Colors.white,
                                    ),
                                    label: Text(
                                      "Apply Filter (14 Orders)",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10,)
                      ],
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}