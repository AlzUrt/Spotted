import 'package:flutter/material.dart';
import 'package:padsou/assets/colors.dart';


class NavigationBarBottom extends StatefulWidget {
  final int initialIndex;
  final List<BottomNavigationBarItem> items;
  final ValueChanged<int> onTap;

  const NavigationBarBottom({
    Key? key,
    this.initialIndex = 0,
    required this.items,
    required this.onTap,
  }) : super(key: key);

  @override
  _NavigationBarBottomState createState() => _NavigationBarBottomState();
}

class _NavigationBarBottomState extends State<NavigationBarBottom> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: CustomColors.red.withOpacity(0.12),
            spreadRadius: 4,
            blurRadius: 22,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: BottomNavigationBar(
          showSelectedLabels: true,
          showUnselectedLabels: true,
          unselectedItemColor: CustomColors.grey,
          selectedItemColor: CustomColors.red,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,

          items: widget.items,
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
            widget.onTap(index);
          },
        ),
    );
  }
}
