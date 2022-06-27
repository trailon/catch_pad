import 'package:catch_pad/constants/texts.dart';
import 'package:catch_pad/constants/urls.dart';
import 'package:catch_pad/cubit/url_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabler_icons/tabler_icons.dart';

class FilterDialog extends StatefulWidget {
  FilterDialog({Key? key, required this.urlCubitContext}) : super(key: key);
  BuildContext urlCubitContext;
  @override
  State<FilterDialog> createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  int selectedValue = 0;
  List<String> types = Strings.typeList;
  bool isWarnVisible = false;
  String selectedType = Strings.initialType;
  int selectedParticipant = 1;
  List<int> participants = [1, 2, 3, 4, 5];
  TextEditingController minPriceController = TextEditingController();
  TextEditingController maxPriceController = TextEditingController();
  IconData currencyIcon = TablerIcons.currency_dollar;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      alignment: Alignment.center,
      child: SizedBox.fromSize(
          size: Size(MediaQuery.of(context).size.width * 0.9,
              MediaQuery.of(context).size.height * 0.8),
          child: ListView(
            children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      selectedValue = 3;
                    });
                    BlocProvider.of<UrlCubit>(widget.urlCubitContext)
                        .emitNewUrl(URL.activity);
                  },
                  icon: const Icon(Icons.clear)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  myRadioListTile(0, Strings.type),
                  myRadioListTile(1, Strings.participants),
                  myRadioListTile(2, Strings.price)
                ],
              ),
              if (selectedValue == 0)
                typeDropdownButtonFilter()
              else if (selectedValue == 1)
                participantDropdownButtonFilter()
              else if (selectedValue == 2)
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                        child: IconButton(
                            onPressed: () {
                              // min and max price values multiplied or divided by a value that changes due to current currency + currency icon changes
                              setState(() {
                                num min = num.tryParse(minPriceController.text
                                    .replaceAll(',', '.'))!;
                                num max = num.tryParse(maxPriceController.text
                                    .replaceAll(',', '.'))!;
                                if (currencyIcon ==
                                    TablerIcons.currency_dollar) {
                                  currencyIcon = TablerIcons.currency_lira;
                                  minPriceController.text =
                                      (min * 20).toString();
                                  maxPriceController.text =
                                      (max * 20).toString();
                                } else {
                                  currencyIcon = TablerIcons.currency_dollar;
                                  minPriceController.text =
                                      (min / 20).toString();
                                  maxPriceController.text =
                                      (max / 20).toString();
                                }
                              });
                            },
                            icon: Icon(currencyIcon))),
                    priceTextField(minPriceController, Strings.minPrice),
                    priceTextField(maxPriceController, Strings.maxPrice),
                    IconButton(
                        onPressed: () {
                          // Checks the min and max price values. If correct sets the new url with the values if it is not then warns the user.
                          try {
                            num min = num.tryParse(
                                minPriceController.text.replaceAll(',', '.'))!;
                            num max = num.tryParse(
                                maxPriceController.text.replaceAll(',', '.'))!;
                            if (min > max ||
                                min < 1 ||
                                (max >
                                    (currencyIcon == TablerIcons.currency_dollar
                                        ? 200
                                        : 4000))) {
                              setState(() {
                                isWarnVisible = true;
                              });
                            } else {
                              int divideValue =
                                  currencyIcon == TablerIcons.currency_dollar
                                      ? 200
                                      : 4000;
                              BlocProvider.of<UrlCubit>(widget.urlCubitContext)
                                  .emitNewUrl(URL.priceRange(
                                      min / divideValue, max / divideValue));
                              Navigator.pop(context);
                            }
                          } catch (e) {
                            setState(() {
                              isWarnVisible = true;
                            });
                          }
                        },
                        icon: const Icon(Icons.check)),
                    Visibility(
                        visible: isWarnVisible,
                        child: Flexible(
                            child: Align(
                                alignment: Alignment.center,
                                child: Text(Strings.incorrectPriceRange))))
                  ],
                )
              else
               Align(
                    alignment: Alignment.center, child: Text(Strings.noFilter))
            ],
          )),
    );
  }

  Align typeDropdownButtonFilter() {
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          DropdownButton<String>(
              value: selectedType,
              underline: Container(),
              items: types
                  .map<DropdownMenuItem<String>>((item) =>
                      DropdownMenuItem<String>(value: item, child: Text(item)))
                  .toList(),
              onChanged: (newvalue) {
                setState(() {
                  selectedType = newvalue!;
                });
              }),
          IconButton(
              onPressed: () {
                BlocProvider.of<UrlCubit>(widget.urlCubitContext)
                    .emitNewUrl(URL.typeFilter(selectedType));
                Navigator.pop(context);
              },
              icon: const Icon(Icons.check)),
        ],
      ),
    );
  }

  Align participantDropdownButtonFilter() {
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          DropdownButton<int>(
              value: selectedParticipant,
              underline: Container(),
              items: participants
                  .map<DropdownMenuItem<int>>((item) => DropdownMenuItem<int>(
                      value: item, child: Text(item.toString())))
                  .toList(),
              onChanged: (newvalue) {
                setState(() {
                  selectedParticipant = newvalue!;
                });
              }),
          IconButton(
              onPressed: () {
                BlocProvider.of<UrlCubit>(widget.urlCubitContext)
                    .emitNewUrl(URL.participantFilter(selectedParticipant));
                Navigator.pop(context);
              },
              icon: const Icon(Icons.check)),
        ],
      ),
    );
  }

  priceTextField(TextEditingController ct, String minmaxtext) {
    return Flexible(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.2),
        child: TextFormField(
          controller: minmaxtext == Strings.minPrice
              ? minPriceController
              : maxPriceController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              prefixIcon: Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.05),
                child: Text(minmaxtext),
              ),
              prefixIconConstraints: const BoxConstraints()),
        ),
      ),
    );
  }

  Flexible myRadioListTile(int value, String title) {
    return Flexible(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
      Text(title),
      Radio<int>(
          value: value,
          groupValue: selectedValue,
          onChanged: (newValue) {
            setState(() {
              selectedValue = newValue!;
            });
          })
    ]));
  }
}
