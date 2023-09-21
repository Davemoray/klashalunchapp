import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../model/ingredient_model.dart';

part 'data_service.g.dart';


String baseUrl = "https://lb7u7svcm5.execute-api.ap-southeast-1.amazonaws.com/dev";
@RestApi()
abstract class GetDataService{
  factory GetDataService(Dio dio, {String baseUrl}) = _GetDataService;

  @GET("/ingredients")
  Future<List<IngredientModel>> getIngredients();
}