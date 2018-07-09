import 'package:flutter/material.dart';

class AtomForm extends StatefulWidget {
  AtomForm.search({this.onChanged = null,this.placeHolder = 'Search',this.isBorder = true,this.textInputType = TextInputType.text});

  final ValueChanged<String> onChanged;
  final String placeHolder;
  final bool isBorder;
  final TextInputType textInputType;

  @override
  _AtomFormState createState() => _AtomFormState();
}

class _AtomFormState extends State<AtomForm> {
  @override
  Widget build(BuildContext context) {
    return TextField(      
      autofocus: false,
      keyboardType: widget.textInputType,
      onChanged: widget.onChanged != null ? widget.onChanged : (){},
      decoration: InputDecoration(
        border: widget.isBorder ? OutlineInputBorder() : InputBorder.none,
        hintText: widget.placeHolder
      ),
    );
  }
}