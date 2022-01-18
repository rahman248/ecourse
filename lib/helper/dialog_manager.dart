import 'package:ecourse/model/dialog_models.dart';
import 'package:ecourse/shared/dialog_services.dart';
import 'package:flutter/material.dart';

import '../locator.dart';

class DialogManager extends StatefulWidget {
  final Widget child;
  const DialogManager({Key? key, required this.child}) : super(key: key);

  @override
  _DialogManagerState createState() => _DialogManagerState();
}

class _DialogManagerState extends State<DialogManager> {
  final DialogService _dialogService = locator<DialogService>();

  @override
  void initState() {
    super.initState();
    _dialogService.registerDialogListener(_showDialog);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  void _showDialog(DialogRequest request) {
    var isConfirmationDialog = request.cancelTitle != null;
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(request.title),
          content: Text(request.description),
          actions: <Widget>[
            if (isConfirmationDialog)
              ElevatedButton (
                child: Text(request.cancelTitle ?? ''),
                onPressed: () {
                  _dialogService
                      .dialogComplete(DialogResponse(confirmed: false, fieldTwo: '', fieldOne: ''));
                },
              ),
            ElevatedButton (
              child: Text(request.buttonTitle),
              onPressed: () {
                _dialogService
                    .dialogComplete(DialogResponse(confirmed: true, fieldOne: '', fieldTwo: ''));
              },
            ),
          ],
        ));
  }
}