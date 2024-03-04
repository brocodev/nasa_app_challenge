import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:nasa_app_challenge/features/apod/domain/repositories/apod_repository.dart';
import 'package:ui_common/ui_common.dart';

class APODImageCard extends StatelessWidget {
  const APODImageCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.8,
      child: InkWell(
        onTap: () async {
          await GetIt.I.get<APODRepository>().getAPODsFromDateRange(
                DateTime.now().subtract(
                  const Duration(days: 15),
                ),
                DateTime.now(),
              );
        },
        child: ClipRRect(
          borderRadius: 12.borderRadiusA,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                'https://apod.nasa.gov/apod/image/2403/IM_Odysseus_landing-2048x1118.png',
                fit: BoxFit.cover,
              ),
              const DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black12,
                      Colors.black26,
                      Colors.black38,
                      Colors.black54,
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 12.h,
                left: 16.w,
                right: 16.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'APOD (Astronomic Photo of the Day)',
                      style: context.bodySmall.copyWith(
                        color: Colors.white70,
                      ),
                      maxLines: 1,
                    ),
                    Text(
                      'Description about the photo and new relevant information ...',
                      style: context.labelSmall.copyWith(
                        color: Colors.white54,
                      ),
                      maxLines: 1,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
