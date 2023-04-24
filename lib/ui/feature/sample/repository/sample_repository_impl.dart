import '../../../../app/init/network/api_response.dart';
import '../model/post_model.dart';

abstract class SampleRepositoryImpl {

  Future<ApiResponse<List<PostModel>>> getPosts();
  Future<ApiResponse<PostModel>> getPost({Map<String, dynamic>? data});
}
