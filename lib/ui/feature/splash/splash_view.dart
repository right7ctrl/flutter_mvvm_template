import 'package:flutter/material.dart';
import 'package:pttem_flutter_template/app/base/base_view.dart';
import 'package:pttem_flutter_template/app/init/locator.dart';
import 'package:pttem_flutter_template/app/init/theme/app_theme_provider.dart';
import 'package:pttem_flutter_template/ui/feature/sample/sample_viewmodel.dart';

class SampleView extends StatelessWidget {
  const SampleView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<SampleViewModel>(
      onModelReady: (model) {
        model.getPosts();
      },
      builder: (context, model, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Sample View"),
            actions: [IconButton(onPressed: () {
              locator<AppThemeProvider>().toggleTheme();
            }, icon: const Icon(Icons.dark_mode))],
          ),
          body: _buildList(model),
        );
      },
    );
  }

  Widget _buildList(SampleViewModel model) {
    if (model.posts.isLoading) return const Center(child: CircularProgressIndicator());
    if (model.posts.isError) return Center(child: Text(model.posts.message.toString()));

    return ListView.builder(
      itemCount: model.posts.data?.length ?? 0,
      itemBuilder: ((context, index) {
        var i = model.posts!.data!.elementAt(index);
        return ListTile(title: Text(i.title.toString()));
      }),
    );
  }
}
