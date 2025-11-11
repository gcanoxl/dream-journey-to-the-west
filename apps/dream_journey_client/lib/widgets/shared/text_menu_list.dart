import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextMenuList extends StatefulWidget {
  const TextMenuList({super.key, required this.items});

  final List<Map<String, VoidCallback>> items;

  @override
  State<TextMenuList> createState() => _TextMenuListState();
}

class _TextMenuListState extends State<TextMenuList> {
  _perform() {
    widget.items[currentIndex].values.first.call();
  }

  int currentIndex = 0;
  final _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: _focusNode,
      autofocus: true,
      onKeyEvent: (_, event) {
        if (event is! KeyUpEvent) {
          return KeyEventResult.handled;
        }
        final key = event.logicalKey;
        if (key == LogicalKeyboardKey.keyW ||
            key == LogicalKeyboardKey.arrowUp ||
            key == LogicalKeyboardKey.keyA ||
            key == LogicalKeyboardKey.arrowLeft) {
          setState(() {
            currentIndex = (currentIndex - 1) % widget.items.length;
          });
          return KeyEventResult.handled;
        } else if (key == LogicalKeyboardKey.keyS ||
            key == LogicalKeyboardKey.arrowDown ||
            key == LogicalKeyboardKey.keyD ||
            key == LogicalKeyboardKey.arrowRight) {
          setState(() {
            currentIndex = (currentIndex + 1) % widget.items.length;
          });
          return KeyEventResult.handled;
        } else if (key == LogicalKeyboardKey.enter ||
            key == LogicalKeyboardKey.space) {
          _perform();
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: GestureDetector(
        onTap: _perform,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(widget.items.length, (index) {
            return _MenuListTile(
              title: widget.items[index].keys.first,
              isSelected: currentIndex == index,
              index: index,
              onSelected: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
            );
          }),
        ),
      ),
    );
  }
}

class _MenuListTile extends StatelessWidget {
  const _MenuListTile({
    required this.title,
    required this.isSelected,
    required this.index,
    required this.onSelected,
  });

  final String title;
  final bool isSelected;
  final int index;
  final Function(int index) onSelected;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) => onSelected(index),
      child: Container(
        height: 48,
        width: 240,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.black.withAlpha(200),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Spacer(),
            _buildContent(),
            Spacer(),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    final style = TextStyle(color: Colors.white);
    if (!isSelected) {
      return Text(title, style: style);
    } else {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.arrow_left, color: Colors.white),
          Text(title, style: style),
          Icon(Icons.arrow_right, color: Colors.white),
        ],
      );
    }
  }
}
