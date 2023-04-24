import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../functions/app_functions.dart';
import '../init/locator.dart';
import 'base_viewmodel.dart';

class BaseView<T extends BaseViewModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget? child) builder;
  final Function(T model)? onModelReady;
  final Function(T model)? onDispose;

  const BaseView({super.key, required this.builder, this.onModelReady, this.onDispose});

  @override
  State<BaseView<T>> createState() => _BaseViewState();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  T model = locator<T>();

  @override
  void initState() {
    if (widget.onModelReady != null) nextTick(() => widget.onModelReady!(model));
    super.initState();
  }

  @override
  void dispose() {
    if (widget.onDispose != null) widget.onDispose!(model);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: model,
      child: Consumer<T>(builder: widget.builder),
    );
  }
}

