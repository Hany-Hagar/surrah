import 'dart:io';
import '../utils/icon_broken.dart';
import 'package:flutter/material.dart';
import '../services/image_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../features/profile/presentation/manager/profile_cubit.dart';
import '../../features/profile/presentation/manager/profile_states.dart';

class ProfileAvatar extends StatelessWidget {
  final double radius;
  final bool showEditIcon;
  const ProfileAvatar({super.key, this.radius = 50, this.showEditIcon = true});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileStates>(
      builder: (context, state) {
        var image = ProfileCubit.get(context).profile.photo;
        var isLocalPath =
            image != null && image.isNotEmpty && !image.startsWith('http');
        return Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            _Image(radius: radius, image: image, isLocalPath: isLocalPath),
            if (showEditIcon) const _CameraIcon(),
          ],
        );
      },
    );
  }
}

class _Image extends StatelessWidget {
  final double radius;
  final String? image;
  final bool isLocalPath;

  const _Image({required this.radius, this.image, required this.isLocalPath});

  @override
  Widget build(BuildContext context) {
    final hasImage = image != null && image!.isNotEmpty;
    return CircleAvatar(
      radius: radius.sp,
      backgroundColor: Colors.grey[300],
      backgroundImage: hasImage
          ? (isLocalPath ? FileImage(File(image!)) : NetworkImage(image!))
                as ImageProvider
          : null,
      child: !hasImage
          ? Icon(
              Icons.person,
              size: radius.sp,
              color: Theme.of(context).primaryColor,
            )
          : null,
    );
  }
}

class _CameraIcon extends StatelessWidget {
  const _CameraIcon();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var cubit = ProfileCubit.get(context);
    return GestureDetector(
      onTap: () => ImageService.pickImage(
        source: ImageSource.gallery,
      ).then((value) => cubit.updateProfilePhoto(value?.path)),
      child: Container(
        padding: EdgeInsets.all(8.sp),
        decoration: BoxDecoration(
          color: theme.colorScheme.secondary,
          shape: BoxShape.circle,
          border: Border.all(color: theme.scaffoldBackgroundColor, width: 3),
        ),
        child: Icon(
          IconBroken.Camera,
          color: theme.scaffoldBackgroundColor,
          size: 24.sp,
        ),
      ),
    );
  }
}
