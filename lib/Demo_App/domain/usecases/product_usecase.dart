import 'package:demo_application/Demo_App/core/usecase.dart';

import '../../data/remote/modals/response/product_Response_Modal.dart';
import '../../data/repository/app_repository.dart';

class ProductsUseCase extends UseCase<List<ProductResponseModal>, NoParams> {
  final AppRepoSitory appRepository;

  ProductsUseCase(this.appRepository);

  @override
  Future<List<ProductResponseModal>> call(NoParams params) {
    return appRepository.getProductS();
  }
}
