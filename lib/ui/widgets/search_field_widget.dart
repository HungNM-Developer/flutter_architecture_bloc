import 'package:flutter/material.dart';
import 'package:flutter_architecture_bloc/config/app_colors.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({Key? key, required this.padding}) : super(key: key);

  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        // height: 36,
        decoration: BoxDecoration(
          color: AppColors.kGreyColor.withOpacity(0.12),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 8,
            ),
            const Icon(Icons.search),
            // SvgPicture.asset(
            //   AppColors.kIconSearch,
            // ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: TextField(
                style: TextStyle(
                  color: AppColors.kWhiteColor.withOpacity(0.6),
                  fontSize: 17,
                  letterSpacing: -0.41,
                ),
                decoration: InputDecoration(
                  hintText: 'Search',
                  border: InputBorder.none,
                  isDense: true,
                  hintStyle: TextStyle(
                    color: AppColors.kWhiteColor.withOpacity(0.6),
                    fontSize: 17,
                    letterSpacing: -0.41,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            const Icon(Icons.mic),
            // SvgPicture.asset(
            //   AppColors.kIconMic,
            // ),
            const SizedBox(
              width: 8,
            ),
          ],
        ),
      ),
    );
  }
}
