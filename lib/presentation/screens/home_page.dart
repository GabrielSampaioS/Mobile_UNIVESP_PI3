import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,

        leading: Tooltip(
          message: 'Configurações',
          child: SvgPicture.asset(
            'assets/icons/gear.svg',
            height: 38,

            colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
          ),
        ),

        title: Text('Ola'),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/registerDialysis'),

        backgroundColor: Colors.black,
        elevation: 2,
        child: const Icon(Icons.add),
      ),
    );
  }
}
