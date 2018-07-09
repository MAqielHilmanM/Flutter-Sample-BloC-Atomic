import 'package:flutter/material.dart';
import '../../00_atoms/03_image/image_atom.dart';
import '../../00_atoms/00_text/text_atom.dart';
import '../../00_atoms/02_spaces/spaces_atom.dart';

class MoleculesTile extends StatefulWidget {
  MoleculesTile({this.url, this.title = '', this.subtitle = ''});

  final String url, title, subtitle;

  @override
  _MoleculesTileState createState() => _MoleculesTileState();
}

class _MoleculesTileState extends State<MoleculesTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: AtomImage.localCircle(widget.url),
      title: AtomText(widget.title),
      subtitle: AtomText.description(widget.subtitle),
    );
  }
}

// class MoleculesTile extends StatelessWidget {
//   MoleculesTile({this.url = '', this.title = '', this.subtitle = ''});

//   final String url, title, subtitle;

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       leading: AtomImage.localCircle(url),
//       title: AtomText(title),
//       subtitle: AtomText.description(subtitle),
//     );
//   }
// }
