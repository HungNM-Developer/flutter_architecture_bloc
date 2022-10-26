import 'package:flutter/material.dart';
import 'package:flutter_architecture_bloc/config/app_images.dart';
import 'package:flutter_architecture_bloc/core/utils/ui_utility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'default_icon_button.dart';

class SearchBar extends StatefulWidget {
  final void Function(bool)? onShow;
  final ValueChanged<String>? onChanged;
  final bool isShowBack;
  final TextInputAction? textInputAction;
  final Function(String)? onSubmitted;
  final TextInputType? textInputType;
  final TextEditingController? textEditingController;
  final bool? allowEdit;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final VoidCallback? suffixIconTap;
  final Color? fillColor;
  final VoidCallback? onClear;

  const SearchBar({
    Key? key,
    this.onShow,
    this.isShowBack = true,
    this.onChanged,
    this.textInputAction,
    this.onSubmitted,
    this.onClear,
    this.textInputType,
    this.textEditingController,
    this.allowEdit,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixIconTap,
    this.fillColor,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar>
    with SingleTickerProviderStateMixin {
  bool _isShowBack = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AnimatedSize(
          duration: const Duration(milliseconds: 250),
          child: Container(
            width: _isShowBack ? 40.r : 0,
            height: _isShowBack ? 40.r : 0,
            margin: _isShowBack ? REdgeInsets.only(left: 20) : EdgeInsets.zero,
            child: DefaultIconButton(
              onPressed: () {
                setState(() {
                  _isShowBack = false;
                });
                widget.onShow?.call(true);
                UIUtility.removeFocus(context);
                context.pop();
              },
              icon: SvgPicture.asset(AppSvgIcon.kIconBack),
            ),
          ),
        ),
        _SearchInput(
          fillColor: widget.fillColor,
          onChanged: widget.onChanged,
          allowEdit: widget.allowEdit,
          onShow: (isShow) {
            if (!isShow) {
              setState(() {
                _isShowBack = true;
              });
            }
            widget.onShow?.call(isShow);
          },
          onClear: widget.onClear,
          onSubmitted: widget.onSubmitted,
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
          suffixIconTap: widget.suffixIconTap,
          textEditingController: widget.textEditingController,
          textInputAction: widget.textInputAction,
          textInputType: widget.textInputType,
          isTappable: () => widget.isShowBack && !_isShowBack,
        ),
      ],
    );
  }
}

class _SearchInput extends StatelessWidget {
  static const styleActive = TextStyle(
    color: Color(0xFFFFFFFF),
  );
  static const styleHint = TextStyle(
    color: Color(0xFF7F7F7F),
  );
  final void Function(bool)? onShow;
  final ValueChanged<String>? onChanged;
  final TextInputAction? textInputAction;
  final Function(String)? onSubmitted;
  final TextInputType? textInputType;
  final TextEditingController? textEditingController;
  final bool? allowEdit;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final VoidCallback? suffixIconTap;
  final Color? fillColor;
  final VoidCallback? onClear;
  final bool Function()? isTappable;
  const _SearchInput({
    Key? key,
    this.onShow,
    this.onChanged,
    this.textInputAction,
    this.onSubmitted,
    this.onClear,
    this.textInputType,
    this.textEditingController,
    this.allowEdit,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixIconTap,
    this.fillColor,
    this.isTappable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 50.h,
        alignment: Alignment.center,
        padding: REdgeInsets.symmetric(horizontal: 20),
        margin: REdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: const Color(0x0DFFFFFF),
        ),
        child: Row(
          children: [
            const Icon(Icons.search),
            15.horizontalSpace,
            Expanded(
              child: TextFormField(
                onTap: () {
                  if (isTappable?.call() == false) return;
                  onShow?.call(false);
                },
                style: styleActive,
                onChanged: onChanged,
                maxLines: 1,
                textInputAction: textInputAction,
                //onSubmitted: onSubmitted,
                keyboardType: textInputType,
                textAlignVertical: TextAlignVertical.center,
                controller: textEditingController,
                cursorColor: const Color(0xFF34CBCC),
                enabled: allowEdit,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search',
                  prefixIcon: prefixIcon,
                  suffixIcon: (suffixIcon != null)
                      ? GestureDetector(
                          onTap: suffixIconTap ?? () {},
                          child: suffixIcon ?? const SizedBox.shrink(),
                        )
                      : null,
                  hintStyle: styleHint,
                  focusColor: const Color(0xFF34CBCC),
                  hoverColor: const Color(0xFF34CBCC),
                  fillColor: fillColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
