import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DescriptionField extends StatefulWidget {
  final bool _isGenerating;
  final void Function(String prompt) _onSubmitted;
  const DescriptionField(
      {super.key,
      required bool isGenerating,
      required Function(String value) onSubmitted})
      : _isGenerating = isGenerating,
        _onSubmitted = onSubmitted;

  @override
  State<DescriptionField> createState() => _DescriptionFieldState();
}

class _DescriptionFieldState extends State<DescriptionField> {
  final _descController = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void dispose() {
    _descController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      height: 128,
      child: TextField(
        controller: _descController,
        focusNode: _focusNode,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(
                 color: Colors.white,
                ),
          ),
          hintText: 'Enter Prompt here...',
          prefixIcon:Container(
            margin: const EdgeInsets.all(10),
            child: SvgPicture.asset(
              'assets/images/auto-generate.svg',
              color: Theme.of(context).primaryColor,
              height: 15,
            ),
          ) ,
          suffixIcon: Container(
            width: 48,
            height: 48,
            margin: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Theme.of(context).secondaryHeaderColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: IconButton(
              onPressed: widget._isGenerating
                  ? null
                  : () {
                      _focusNode.unfocus();
                      final desc = _descController.text;
                      _descController.clear();
                      widget._onSubmitted(desc);
                    },
              icon: SvgPicture.asset(
                'assets/images/send.svg',
                color: Theme.of(context).primaryColor,
                //height: 24,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
