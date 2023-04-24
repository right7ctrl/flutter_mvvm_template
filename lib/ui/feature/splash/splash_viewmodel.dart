import 'package:pttem_flutter_template/app/base/base_viewmodel.dart';

import '../../../app/init/locator.dart';
import '../../../service/dynamic_link_service.dart';

class SplashViewModel extends BaseViewModel {
  final DynamicLinkService _dynamicLinkService = locator<DynamicLinkService>();

  @override
  void init() {
    Future.delayed(const Duration(milliseconds: 1000), () async {
      await _dynamicLinkService.handleDynamicLinks();
    });

    super.init();
  }
}
