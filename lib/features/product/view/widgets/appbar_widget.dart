import 'package:coffee_zone/features/product/view/pages/product_list_page.dart';
import 'package:flutter/material.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: 40,
      child: InkWell(
        onTap: () {
          ProductListPage.routePath;
        },
        child: const Row(
          children: [
            Icon(
              Icons.keyboard_arrow_left_outlined,
              size: 25,
            ),
            Text(
              "Add New Products",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),  
        
      ),
    );
  }
}
