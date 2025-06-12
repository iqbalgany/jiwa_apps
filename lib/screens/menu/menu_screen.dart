import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jiwa_apps/controllers/product_controller.dart';
import 'package:jiwa_apps/models/product_model.dart';
import 'package:jiwa_apps/screens/menu/detail_menu_screen.dart';
import 'package:jiwa_apps/utils/colors.dart';

class MenuScreen extends StatelessWidget {
  MenuScreen({super.key});

  final ProductController productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: GetBuilder<ProductController>(
        initState: (_) {
          productController.getProducts();
        },
        builder: (_) {
          if (productController.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return SafeArea(
            child: Stack(
              children: [
                NestedScrollView(
                  headerSliverBuilder: (context, innerBoxIsScrolled) {
                    return [
                      SliverAppBar(
                        backgroundColor: AppColors.white,
                        automaticallyImplyLeading: false,
                        toolbarHeight: 85,
                        title: Container(
                          width: MediaQuery.sizeOf(context).width,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            children: [
                              distributionItem(
                                context,
                                icon: Icons.directions_walk_rounded,
                                text: 'Take Away',
                                index: 0,
                              ),
                              SizedBox(width: 10),
                              distributionItem(
                                context,
                                icon: Icons.delivery_dining_rounded,
                                text: 'Delivery',
                                index: 1,
                              )
                            ],
                          ),
                        ),
                      ),
                      SliverAppBar(
                        automaticallyImplyLeading: false,
                        backgroundColor: AppColors.white,
                        toolbarHeight: 60,
                        title: Container(
                          width: MediaQuery.sizeOf(context).width,
                          padding: EdgeInsets.fromLTRB(20, 5, 5, 5),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.store_mall_directory_outlined,
                                color: AppColors.secondary,
                                size: 28,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'KANNA HOMESTAY',
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                              Spacer(),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Ubah',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SliverAppBar(
                        automaticallyImplyLeading: false,
                        backgroundColor: AppColors.white,
                        pinned: true,
                        toolbarHeight: 80,
                        title: Container(
                          width: MediaQuery.sizeOf(context).width,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 20),
                              Icon(
                                Icons.search_rounded,
                                color: AppColors.secondary,
                                size: 28,
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.fromLTRB(0, 15, 5, 15),
                                    hintText: 'Search menu',
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ];
                  },
                  body: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          border: Border(
                            top: BorderSide(
                              color: Colors.grey[200]!,
                              width: 3,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              padding: EdgeInsets.only(bottom: 80),
                              itemCount: productController.categories.length,
                              itemBuilder: (context, index) {
                                final category =
                                    productController.categories[index];
                                return GestureDetector(
                                  onTap: () {
                                    productController.selectedCategory(index);
                                  },
                                  child: Container(
                                    margin:
                                        EdgeInsets.only(bottom: 10, right: 10),
                                    padding: EdgeInsets.fromLTRB(0, 8, 8, 8),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 100,
                                          width: 7,
                                          color: productController
                                                      .selectedCategoryIndex ==
                                                  index
                                              ? AppColors.primary
                                              : Colors.grey[300],
                                        ),
                                        SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                            category.name ?? '-',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13,
                                              color: productController
                                                          .selectedCategoryIndex ==
                                                      index
                                                  ? AppColors.primary
                                                  : Colors.grey[300],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 20),
                                Text(
                                  productController
                                      .categories[productController
                                          .selectedCategoryIndex]
                                      .name!,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Expanded(
                                  child: GridView.builder(
                                    padding: EdgeInsets.only(
                                        right: 10, bottom: 100, top: 40),
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio: 0.7,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 50,
                                      crossAxisCount: 2,
                                    ),
                                    itemCount: productController
                                        .categories[productController
                                            .selectedCategoryIndex]
                                        .products!
                                        .length,
                                    itemBuilder: (context, index) {
                                      final product = productController
                                          .categories[productController
                                              .selectedCategoryIndex]
                                          .products![index];
                                      return productCard(context, product);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget productCard(BuildContext context, ProductModel product) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailMenuScreen(
            product: product,
          ),
        ),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: Offset(3, 5),
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 100, 8, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    product.name!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            NumberFormat.currency(
                              locale: 'id_ID',
                              symbol: 'Rp',
                              decimalDigits: 0,
                            ).format(
                                double.tryParse(product.price ?? '0') ?? 0),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            NumberFormat.currency(
                              locale: 'id_ID',
                              symbol: 'Rp',
                              decimalDigits: 0,
                            ).format(
                                double.tryParse(product.originalPrice ?? '0') ??
                                    0),
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: product.categoryId == 1
                                  ? AppColors.primary
                                  : Colors.transparent,
                              decoration: TextDecoration.lineThrough,
                              decorationColor: product.categoryId == 1
                                  ? AppColors.primary
                                  : Colors.transparent,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            color: AppColors.primary, shape: BoxShape.circle),
                        child: Icon(
                          Icons.add,
                          color: AppColors.white,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 10,
            bottom: 110,
            child: Image.network(
              product.imageUrlText!,
              height: 130,
            ),
          ),
        ],
      ),
    );
  }

  Widget distributionItem(
    BuildContext context, {
    String? text,
    IconData? icon,
    int? index,
  }) {
    return Expanded(
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColors.primary,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: AppColors.white,
              ),
            ),
            SizedBox(height: 5),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary,
              ),
              child: Icon(
                icon,
                color: AppColors.white,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
