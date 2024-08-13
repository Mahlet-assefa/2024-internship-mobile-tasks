import 'package:http/http.dart' as http;
// import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:product_site/core/network/network_info.dart';
import 'package:product_site/features/product/Data/data_sources/remote_data_source.dart';
import 'package:product_site/features/product/domain/repositories/product_repositories.dart';

@GenerateMocks(
  [ProductRepositories,ProductRemoteDataSources,NetworkInfo],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
  
)
void main() {}
