import 'package:flutter/material.dart';
import 'home_search_field.dart';

class HomeSearchBar extends StatelessWidget {
  final VoidCallback? onCouponTap;
  final VoidCallback? onSearchTap;

  const HomeSearchBar({
    super.key,
    this.onCouponTap,
    this.onSearchTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: onSearchTap,
            child: const HomeSearchField(),
          ),
        ),
        // IconButton(
        //   onPressed: onCouponTap,
        //   icon: Icon(
        //     Icons.fireplace_rounded,
        //     size: 36,
        //     color: MyColors.bottomColor,
        //   ),
        // ),
        const SizedBox(width: 10),
        //  Icon(Icons.filter_list_alt,size: 36,color: MyColors.bottomColor,),
        //   const SizedBox(width: 10),
      ],
    );
  }
}
