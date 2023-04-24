import 'package:dio/dio.dart';
import 'package:pttem_flutter_template/app/init/network/api_caller.dart';
import 'package:pttem_flutter_template/app/init/network/api_response.dart';
import 'package:pttem_flutter_template/ui/feature/sample/model/post_model.dart';
import 'package:pttem_flutter_template/ui/feature/sample/repository/sample_repository_impl.dart';

import '../../../../app/init/network/api_exception.dart';

class SampleRepository implements SampleRepositoryImpl {
  @override
  Future<ApiResponse<List<PostModel>>> getPosts() async {
    try {
      final jsonData = await ApiCaller.instance.get('/posts');
      final data = <PostModel>[];

      if (jsonData != null) {
        for (var element in (jsonData as List)) {
          data.add(PostModel.fromJson(element));
        }
        return ApiResponse.success(data);
      }

      throw FetchDataException("Unable to fetch data");
    } catch (e, s) {
      return ApiResponse.error(e.toString(), s.toString(), s);
    }
  }

  @override
  Future<ApiResponse<PostModel>> getPost({Map<String, dynamic>? data}) async {
    try {
      final jsonData = await ApiCaller.instance.post('/posts', data: data);

      return ApiResponse.success(PostModel.fromJson(jsonData));

    } catch (e, s) {
      return ApiResponse.error(e.toString(), s.toString(), s);
    }
  }
}
