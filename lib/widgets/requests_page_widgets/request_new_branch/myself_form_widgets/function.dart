import 'dart:async';
import 'package:chottu_link/chottu_link.dart';
import 'package:chottu_link/dynamic_link/cl_dynamic_link_behaviour.dart';
import 'package:chottu_link/dynamic_link/cl_dynamic_link_parameters.dart';

Future<String> buildChottuShareLink({
  required String id,
  String? title,
  String? imageUrl,
}) {
  // await ChottuLink.init(apiKey: 'c_app_fg0NQzHvgQQhknTVNZArbomnAN1GT7bv');

  final parameters = CLDynamicLinkParameters(
    link: Uri.parse('https://oven-admin.moimenwy.workers.dev/external?id=$id'),
    domain: 'ovenapp.chottu.link',
    androidBehaviour: CLDynamicLinkBehaviour.app,
    iosBehaviour: CLDynamicLinkBehaviour.app,
    linkName: 'Oven external $id',
    socialTitle: title,
    socialImageUrl: imageUrl,
  );

  final completer = Completer<String>();
  ChottuLink.createDynamicLink(
    parameters: parameters,
    onSuccess: (link) => completer.complete(link),
    onError: (error) => completer.completeError(error.description!),
  );
  return completer.future;
}
