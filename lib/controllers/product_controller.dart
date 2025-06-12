import 'package:get/get.dart';
import 'package:jiwa_apps/models/category_model.dart';
import 'package:jiwa_apps/services/product_service.dart';

class ProductController extends GetxController {
  final ProductService _productService = ProductService();

  bool isLoading = false;
  List<CategoryModel> categories = [];
  int selectedCategoryIndex = 0;

  Future<void> getProducts() async {
    try {
      isLoading = true;
      update();
      categories = await _productService.fetchProducts();
    } catch (e) {
      Get.snackbar('Error', 'Gagal saat mengambil data menu: $e');
    } finally {
      isLoading = false;
      update();
    }
  }

  void selectedCategory(int index) {
    selectedCategoryIndex = index;
    update();
  }
}
