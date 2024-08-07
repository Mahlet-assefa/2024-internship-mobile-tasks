import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:product_site/features/product/domain/repositories/product_repositories.dart';

@GenerateMocks(
  [ProductRepositories],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {}
