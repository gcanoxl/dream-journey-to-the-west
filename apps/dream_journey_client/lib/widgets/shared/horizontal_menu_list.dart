import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HorizontalMenuList extends StatefulWidget {
  const HorizontalMenuList({super.key, required this.items});

  final List<Map<Widget, VoidCallback>> items;

  @override
  State<HorizontalMenuList> createState() => _HorizontalMenuListState();
}

class _HorizontalMenuListState extends State<HorizontalMenuList> {
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
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(widget.items.length, (index) {
            return _MenuListTile(
              isSelected: currentIndex == index,
              index: index,
              onSelected: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              child: widget.items[index].keys.first,
            );
          }),
        ),
      ),
    );
  }
}

class _MenuListTile extends StatelessWidget {
  const _MenuListTile({
    required this.child,
    required this.isSelected,
    required this.index,
    required this.onSelected,
  });

  final Widget child;
  final bool isSelected;
  final int index;
  final Function(int index) onSelected;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) => onSelected(index),
      child: Container(
        height: 120,
        width: 120,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.black.withAlpha(200),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(8),
        child: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    if (!isSelected) {
      return child;
    } else {
      return Container(
        decoration: BoxDecoration(
          color: Colors.grey,
        ),
        child: child,
      );
    }
  }
}
