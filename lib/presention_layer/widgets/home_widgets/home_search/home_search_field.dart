import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workspace/busniess_logic_layer/home_cubit/home_cubit_cubit.dart';

class HomeSearchField extends StatelessWidget {
  const HomeSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    var myCubit = context.read<HomeCubit>();
    return TextField(
      textAlign: TextAlign.right,
      controller: myCubit.searchController,
      onChanged: (value) {
        myCubit.searchWorkspaces(value);
      },
      decoration: buildCustomDoceration(),
    );
  }

  InputDecoration buildCustomDoceration() {
    return InputDecoration(
      suffixIcon: const Icon(
        Icons.search,
        color: Color(0xFF66A185),
      ),
      hintText: "...بحث سريع",
      hintStyle: const TextStyle(
        color: Color(0xFF66A185),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: const BorderSide(
          color: Color(0xFF66A185),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: const BorderSide(
          color: Color(0xFF66A185),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: const BorderSide(
          color: Color(0xFF66A185),
        ),
      ),
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
    );
  }
}
