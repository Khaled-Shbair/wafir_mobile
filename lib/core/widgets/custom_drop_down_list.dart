import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:wafir_mobile/core/resource/manager_colors.dart';
import 'package:wafir_mobile/core/resource/manager_sizes.dart';

class CustomDropDownList extends StatelessWidget {
  const CustomDropDownList({
    required this.selectedItem,
    required this.items,
    required this.onChangedFunction,
    this.labelText,
    this.hintText,
    this.textStyle,
    this.validator,
    this.enabled = true,
    super.key,
  });

  final String? selectedItem;
  final String? labelText;
  final String? hintText;
  final List<String> items;
  final Function(String? v) onChangedFunction;
  final String? Function(String?)? validator;
  final TextStyle? textStyle;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    return DropdownSearch<String>(
      validator: validator,
      enabled: enabled,
      autoValidateMode: AutovalidateMode.onUserInteraction,
      items: (filter, loadProps) => items,
      itemAsString: (item) => item,
      compareFn: (item, selectedItem) => item == selectedItem,
      selectedItem: selectedItem,
      onSelected: (String? selectedReason) {
        FocusManager.instance.primaryFocus?.unfocus();
        ScaffoldMessenger.of(context).clearSnackBars();
        onChangedFunction(selectedReason);
      },

      suffixProps: DropdownSuffixProps(
        dropdownButtonProps: DropdownButtonProps(
          splashColor: Theme.of(context).disabledColor,
          padding: EdgeInsetsDirectional.zero,
          iconClosed: Icon(
            Icons.keyboard_arrow_down_sharp,
            color: ManagerColors.primaryColor,
          ),
          iconOpened: Icon(
            Icons.keyboard_arrow_up_sharp,
            color: ManagerColors.primaryColor,
          ),
          iconSize: ManagerIconsSizes.i24,
        ),
      ),
      popupProps: PopupProps.menu(
        itemBuilder: (context, item, isDisabled, isSelected) {
          return Container(
            height: ManagerHeights.h30,
            alignment: AlignmentDirectional.centerStart,
            padding: EdgeInsetsDirectional.only(
              start: ManagerWidths.w10,
              end: ManagerWidths.w10,
            ),
            child: Text(
              item,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          );
        },
        fit: FlexFit.loose,
        menuProps: MenuProps(
          align: MenuAlign.bottomCenter,
          backgroundColor: Theme.of(context).colorScheme.surface,
          margin: EdgeInsets.only(
            bottom: ManagerHeights.h20,
          ),
        ),
        cacheItems: true,
      ),
      dropdownBuilder: (context, selectedItem) {
        return Text(
          selectedItem ?? '',
          style: Theme.of(context).textTheme.labelLarge,
        );
      },
      decoratorProps: DropDownDecoratorProps(
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          enabledBorder:
              Theme.of(context).inputDecorationTheme.enabledBorder?.copyWith(
                    borderSide: BorderSide(
                      width: 1.2,
                      color:  selectedItem != null
                          ? ManagerColors.primaryColor
                          : ManagerColors.unFocusBorderColor,
                    ),
                  ),
          labelText: labelText,

          isDense: true,
          hintText: hintText,
          hintStyle: Theme.of(context).inputDecorationTheme.hintStyle?.copyWith(
                color:  selectedItem != null
                    ? ManagerColors.primaryColor
                    : ManagerColors.unFocusIconColor,
              ),
          labelStyle:
              textStyle ?? Theme.of(context).inputDecorationTheme.labelStyle,
        ),
      ),
    );
  }
}
