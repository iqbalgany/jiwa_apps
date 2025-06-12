import 'package:dio/dio.dart';
import 'package:jiwa_apps/helpers/dio_client.dart';
import 'package:jiwa_apps/models/category_model.dart';
import 'package:jiwa_apps/services/storage_service.dart';

class ProductService {
  Future<List<CategoryModel>> fetchProducts() async {
    final token = await StorageService.getToken();

    try {
      final response = await DioClient.instance.get(
        '/auth/menus',
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );

      final data = response.data['data'] as List;
      return data.map((json) => CategoryModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Gagal mengambil menu: $e');
    }
  }
}
