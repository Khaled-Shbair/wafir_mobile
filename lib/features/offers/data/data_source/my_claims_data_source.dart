import 'dart:convert';
import 'package:wafir_mobile/features/offers/data/response/my_claims_response.dart';

abstract class MyClaimsDataSource {
  Future<MyClaimsResponse> getMyClaimsRequests();
}

class MyClaimsDataSourceImpl implements MyClaimsDataSource {
  final dynamic _dio; // Dio instance

  MyClaimsDataSourceImpl(this._dio);

  @override
  Future<MyClaimsResponse> getMyClaimsRequests() async {
    try {
      final response = await _dio.get(
        'https://discount-platform.onrender.com/api/offer-claims/my',
      );

      if (response.statusCode == 200) {
        final data = response.data is String
            ? jsonDecode(response.data) as Map<String, dynamic>
            : response.data as Map<String, dynamic>;
        return MyClaimsResponse.fromJson(data);
      } else {
        throw Exception('Failed to load my claims');
      }
    } catch (e) {
      rethrow;
    }
  }
}

