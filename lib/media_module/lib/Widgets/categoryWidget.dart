import 'package:flutter/material.dart';
import 'package:media/Models/CategryItem.dart';


class CategoryItem extends StatelessWidget {
  final CategoryModel categoryModel;

  const CategoryItem({Key? key, required this.categoryModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 225, 233, 225),
        borderRadius: BorderRadius.circular(10),
      ),
      width: 100,
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Icon(categoryModel.icon, size: 30, color: Colors.black),
          SizedBox(height: 10),
          Text(
            categoryModel.label,
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
