import 'package:doctor_booking_system/packages/models/lib/models.dart';
import 'package:doctor_booking_system/shared/widgets/list_titiles/doctor_list_title.dart';
import 'package:doctor_booking_system/shared/widgets/title/avatars/circle_avatar_with_text_label.dart';
import 'package:doctor_booking_system/shared/widgets/title/cards/appointment_preview_card.dart';
import 'package:doctor_booking_system/shared/widgets/title/section_title.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../shared/widgets/bottom_nav_bar/main_nav_bar.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({super.key});

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome', style: textTheme.bodyMedium),
            const SizedBox(
              height: 4.0,
            ),
            Text(
              "Majharul Islam",
              style: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Icon(Icons.location_on, color: colorScheme.secondary),
                Text(
                  'Dubai, UAE',
                  style: textTheme.bodySmall!.copyWith(
                    color: colorScheme.secondary,
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                Icon(Icons.expand_more, color: colorScheme.secondary),
              ],
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined),
          ),
          const SizedBox(
            width: 8,
          )
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(64.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Search for doctors...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: Container(
                  margin: const EdgeInsets.all(4.0),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: colorScheme.onSurfaceVariant,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Icon(
                    Icons.filter_alt_outlined,
                    color: colorScheme.surfaceContainerHighest,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                _DoctorCategories(),
                SizedBox(
                  height: 16,
                ),
                _MySchedule(),
                SizedBox(
                  height: 16,
                ),
                _NearbyDoctors(),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const MainNavBar(),
    );
  }
}

class _NearbyDoctors extends StatelessWidget {
  const _NearbyDoctors({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final ColorScheme = Theme.of(context).colorScheme;
    return Column(
      children: [
        SectionTitle(
          title: 'Nearby Doctors',
          action: 'See all',
          onPressed: () {},
        ),
        const SizedBox(
          height: 8,
        ),
        ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final doctor = Doctor.sampleDoctors[index];
              return DoctorListTitle(doctor: doctor);
            },
            separatorBuilder: (context, index) {
              return Divider(
                height: 24.0,
                color: ColorScheme.surfaceContainerHighest,
              );
            },
            itemCount: Doctor.sampleDoctors.length)
      ],
    );
  }
}

class _MySchedule extends StatelessWidget {
  const _MySchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          title: 'My Schedule',
          action: 'See all',
          onPressed: () {},
        ),
        const AppointmentPreviewCard(),
      ],
    );
  }
}

class _DoctorCategories extends StatelessWidget {
  const _DoctorCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          title: 'Categories',
          action: 'See all',
          onPressed: () {},
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: DoctorCategory.values
              .take(5)
              .map((Category) => Expanded(
                    child: CircleAvatarWithTextLabel(
                        icon: Category.icon, label: Category.name),
                  ))
              .toList(),
        ),

        //icons
      ],
    );
  }
}
