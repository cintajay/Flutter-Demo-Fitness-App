import 'package:fitness_app/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];

  getCategories() {
    categories = CategoryModel.getCategories();
  }

  @override
  void initState() {
    super.initState();
    getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _searchField(),
          _categoriesText(), //if no comma, use comma and add on
          _categories()
        ],
      ),
    );
  }

  Column _categoriesText() {
    return const Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Category",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),
                textAlign: TextAlign.left,
                
              ),
            ),
          ],
        );
  }

  Container _categories() {
    return Container(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20
          ),
          height: 120,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 20), //=> or use return stmt
            itemBuilder: (context, index) {
              return Container(
                width: 100,
                decoration: BoxDecoration(
                  color: categories[index].boxColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20)                    
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white
                      ),
                      child: SvgPicture.asset(categories[index].iconPath),
                      alignment: Alignment.center,
                    ),
                    Text(
                      categories[index].name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black
                      ),
                    )
                  ],
                )
              );
            }
          ),
        );
  }

  Container _searchField() {
    return Container(
          margin: EdgeInsets.all(20),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.all(15),
                child: SvgPicture.asset('assets/Search.svg'),
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.all(15),
                child: SvgPicture.asset('assets/Filter.svg'),
              ),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10)
              ),
              hintText: "Search Pancakes",
              hintStyle: const TextStyle(
                fontSize: 14,
                color: Color(0xffDDDADA)
              )
            ),
          ),
        );
  }

  AppBar _appBar() {
    return AppBar(
      title: const Text(
        "Breakfast",
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black
        )
      ),
      leading: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: SvgPicture.asset('assets/Arrow - Left 2.svg'),
        ),
      centerTitle: true,
      actions: [
        Container(
        margin: const EdgeInsets.all(8),
        width: 37,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: SvgPicture.asset('assets/dots.svg'),
        )
      ],
    );
  }
}