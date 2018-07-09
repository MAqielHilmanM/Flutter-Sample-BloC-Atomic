import 'package:flutter/material.dart';

class AtomImage extends StatefulWidget {
  AtomImage.localCircle(this.url, {this.size = 24.0})
      : isCircle = true,
        isNetwork = false;
  AtomImage.localBox(this.url, {this.size = 24.0})
      : isCircle = false,
        isNetwork = false;
  AtomImage.remoteCircle(this.url, {this.size = 24.0})
      : isCircle = true,
        isNetwork = true;
  AtomImage.remoteBox(this.url, {this.size = 24.0})
      : isCircle = false,
        isNetwork = true;

  String url;
  double size;
  bool isCircle;
  bool isNetwork;

  @override
  _AtomImageState createState() => _AtomImageState();
}

class _AtomImageState extends State<AtomImage> {
  @override
  Widget build(BuildContext context) {
    if (widget.url == null) {
      widget.url = 'assets/images/google-plus.png';
      widget.isNetwork = false;
    }

    return widget.isCircle
        ? CircleAvatar(
            child: widget.isNetwork
                ? Image.network(widget.url)
                : Image.asset(widget.url))
        : widget.isNetwork ? NetworkImage(widget.url) : AssetImage(widget.url);
  }
}
