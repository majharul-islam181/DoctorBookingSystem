import 'package:doctor_booking_system/packages/models/lib/models.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DoctorListTitle extends StatelessWidget {
  final Doctor doctor;
  const DoctorListTitle({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return ListTile(
      onTap: () {},
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        radius: 30,
        backgroundColor: colorScheme.surface,
        backgroundImage: NetworkImage(doctor.profileImageUrl),
      ),
      title: Text(
        doctor.name,
        style: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 4,
          ),
          Text(
            doctor.category.name,
            style: textTheme.bodyMedium!.copyWith(
              color: colorScheme.secondary,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              const Icon(
                Icons.star,
                color: Color.fromRGBO(255, 294, 128, 1),
                size: 16,
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                doctor.rating.toString(),
                style: textTheme.bodySmall!.copyWith(
                  color: colorScheme.onSurface.withOpacity(.5),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Icon(
                Icons.work,
                color: colorScheme.tertiary,
                size: 16,
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                '3 years',
                style: textTheme.bodySmall!.copyWith(
                    color: colorScheme.onSurface.withOpacity(.5),
                    fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
      trailing: FilledButton(
        onPressed: () {},
        child: const Text('Book now'),
      ),
    );
  }
}
