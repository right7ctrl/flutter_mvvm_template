import '../app/init/locator.dart';
import '../app/init/navigation/navigation_service.dart';

class DynamicLinkService {

    final NavigationService _navigationService = locator<NavigationService>();


  Future handleDynamicLinks() async {
    /* 
    // 1. Get the initial dynamic link if the app is opened with a dynamic link
    final PendingDynamicLinkData data = await FirebaseDynamicLinks.instance.getInitialLink();

    // 2. handle link that has been retrieved
    _handleDeepLink(data);

    // 3. Register a link callback to fire if the app is opened up from the background
    // using a dynamic link.
    FirebaseDynamicLinks.instance.onLink(onSuccess: (PendingDynamicLinkData dynamicLink) async {
      // 3a. handle link that has been retrieved
      _handleDeepLink(dynamicLink);
    }, onError: (OnLinkErrorException e) async {
      print('Link Failed: ${e.message}');
    });

  }

  void _handleDeepLink(PendingDynamicLinkData data) {
    final Uri deepLink = data?.link;
    if (deepLink != null) {
      print('_handleDeepLink | deeplink: $deepLink');

      // Check if we want to make a post
      var isPost = deepLink.pathSegments.contains('post');

      if (isPost) {
        // get the title of the post
        var title = deepLink.queryParameters['title'];

        if (title != null) {
          // if we have a post navigate to the CreatePostViewRoute and pass in the title as the arguments.
          _navigationService.navigateTo(CreatePostViewRoute, arguments: title);
        }
      }
    }   */
  }
  
}
