
import 'package:bloc/bloc.dart';

import '../../features/product/domain/entities/product.dart';
import '../../features/product/domain/usecases/addproduct.dart';
import '../../features/product/domain/usecases/deleteproduct.dart';
import '../../features/product/domain/usecases/getallproduct.dart';
import '../../features/product/domain/usecases/getproductbyid.dart';
import '../../features/product/domain/usecases/updateproduct.dart';
import 'event_classes.dart';
import 'state_classes.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  late Getallproductusecase getallproductusecase;
  late Getproductbyidusecase getproductbyidusecase;
  late Updateproductusecase updateproductusecase;
  late Deleteproductusecase deleteproductusecase;
  late Addproductusecase addproductusecase;

  ProductBloc({
  required this.getallproductusecase,
  required this.getproductbyidusecase,
  required this.updateproductusecase,
  required this.deleteproductusecase,
  required this.addproductusecase,
}) :super(InitialState()) {
    on<LoadAllProductEvent>((event, emit) async {
      emit(LoadingState());
      var products = await getallproductusecase.execute();
      products.fold(
        (l) => emit(ErrorState(l.message)),
        (r) => emit(LoadedAllProductState(r)),
      );
    });

    on<GetSingleProductEvent>((event,emit) async{
      emit(LoadingState());
      var products = await getproductbyidusecase.execute(event.id);
      products.fold(
        (l) => emit(ErrorState(l.message)),
        (r) => emit(LoadedSingleProductState(r)),
      );
    });

    on<UpdateProductEvent>((event,emit) async{
      emit(LoadingState());
      final result = await updateproductusecase.execute(
        id: event.id,
        name: event.name,
        description: event.category,
        price: event.price,
      );
    result.fold(
      (l) => emit(ErrorState(l.message)),
      (r) => emit(const CreatedProductState('Product updated')),
    );
    });

    
  on<DeleteProductEvent>((event, emit) async {
    emit(LoadingState());
    var product = await deleteproductusecase.execute(event.id);
    product.fold(
      (l) => emit(ErrorState(l.message)),
      (r) => emit(InitialState()),
    );
  });

  on<CreateProductEvent>((event, emit) async {
    emit(InitialState());
    // print("Mahlets description: ${event.description}");
    final productData = Product(
        name: event.name,
        category: event.category,
        price: event.price,
        description: event.description, 
        imgurl: event.imgurl, 
        id: '',
      );
    final result = await addproductusecase.call(productData);
    result.fold(
      (l) => emit(ErrorState(l.message)),
      (r) => emit(const CreatedProductState('Product Created')),
    );
  });

    }
}