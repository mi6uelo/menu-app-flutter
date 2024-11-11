import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_final/features/navigation/cubit/drawer.cubit.dart';
import 'package:proyecto_final/features/navigation/entities/drawer-state.entity.dart';

class MenuItemTile extends StatelessWidget {
  final int index;
  final IconData icon;
  final String title;
  final String route;

  const MenuItemTile({
    Key? key,
    required this.index,
    required this.icon,
    required this.title,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrawerCubit, DrawerState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.blueGrey, // Color del borde
                width: 1.0, // Ancho del borde
              ),
            ),
          ),
          child: ListTile(
            leading: Icon(
              icon,
              color: state.selectedIndex == index
                  ? Colors.lightBlue
                  : Colors.blueGrey,
            ),
            title: Text(
              title,
              style: TextStyle(
                color: state.selectedIndex == index
                    ? Colors.lightBlue
                    : Colors.blueGrey,
              ),
            ),
            onTap: () {
              context.read<DrawerCubit>().selectItem(index);
              Navigator.pushReplacementNamed(context, route);
            },
          ),
        );
      },
    );
  }
}
