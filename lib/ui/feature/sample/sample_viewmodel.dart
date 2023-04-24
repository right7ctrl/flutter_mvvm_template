import 'package:pttem_flutter_template/app/base/base_viewmodel.dart';
import 'package:pttem_flutter_template/ui/feature/sample/model/post_model.dart';
import 'package:pttem_flutter_template/ui/feature/sample/repository/sample_repository.dart';
import '../../../app/init/locator.dart';
import '../../../app/init/network/api_response.dart';

const String postKey = 'asda';

class SampleViewModel extends BaseViewModel {
  ApiResponse<List<PostModel>> posts = ApiResponse.idle();
  ApiResponse<PostModel> post = ApiResponse.idle();

  Future getPosts() async {
    posts = await locator<SampleRepository>().getPosts();
    notifyListeners();
  }

  Future getPost() async {
    post = await locator<SampleRepository>().getPost(data: {
      "title": 'foo',
      "body": 'bar',
      "userId": 1,
    });
    notifyListeners();
  }
}
