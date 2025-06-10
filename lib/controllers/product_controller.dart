import 'package:get/get.dart';
import 'package:jiwa_apps/models/category_model.dart';
import 'package:jiwa_apps/services/product_service.dart';

class ProductController extends GetxController {
  final ProductService _productService = ProductService();

  List<CategoryModel> categories = [];
  bool isLoading = false;

  Future<void> getMenus() async {
    try {
      isLoading = true;
      update();
      categories = await _productService.fetchMenus();
    } catch (e) {
      Get.snackbar('Error', 'Gagal saat mengambil data menu: $e');
    } finally {
      isLoading = false;
      update();
    }
  }
}
