import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workspace/busniess_logic_layer/booking_cubit/booking_cubit.dart';
import 'package:workspace/presention_layer/widgets/booking_widget/price_widgets/price_card.dart';

class PriceDisplayCard extends StatelessWidget {
  const PriceDisplayCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingCubit, BookingState>(
      builder: (context, state) {
        if (state is BookingChangePrice) {
          return PriceCard(text: state.price, isPrice: true);
        }
        return PriceCard(text: context.read<BookingCubit>().totalBookingPrice.toString(), isPrice: false);
      },
    );
  }
} 