import 'package:chef_app/core/errors/failure.dart';
import 'package:chef_app/features/profile/data/models/chef_model.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

abstract class profileRepo {
  Future<Either<Failure, String>> updateProfile({
    String? name,
    String? phone,
    String? brandName,
    String? minCharge,
    XFile? profilePic,
    var location,
    String? disc,
  });

  Future<Either<Failure, chefModel>> getChafData();

  Future<Either<Failure, String>> logout();
}
