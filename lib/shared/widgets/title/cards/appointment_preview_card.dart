import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppointmentPreviewCard extends StatelessWidget {
  const AppointmentPreviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final ColorScheme = Theme.of(context).colorScheme;
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  ColorScheme.primary,
                  ColorScheme.tertiary,
                ]),
          ),
          child: Column(
            children: [
              Center(
                child: SizedBox(
                  height: 100,
                  child: Text(
                    'No Appoinemnt yet!',
                    style: textTheme.bodyMedium!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          height: 8.0,
          margin: const EdgeInsets.symmetric(horizontal: 12.0),
          decoration: BoxDecoration(
              color: ColorScheme.primary.withOpacity(0.25),
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(8))),
        ),
        Container(
          height: 8.0,
          margin: const EdgeInsets.symmetric(horizontal: 24.0),
          decoration: BoxDecoration(
              color: ColorScheme.primary.withOpacity(0.15),
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(8))),
        ),
      ],
    );
  }
}
