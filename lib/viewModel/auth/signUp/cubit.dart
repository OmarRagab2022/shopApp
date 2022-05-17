
import 'package:bloc/bloc.dart';
import 'package:e_commrce/services/network/end_point.dart';
import 'package:e_commrce/viewModel/auth/signUp/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/shop_user_model.dart';
import '../../../services/local/cache_helper.dart';
import '../../../services/network/dio_helper.dart';

class ShopRegisterCubit extends Cubit<RegisterStates> {
  ShopRegisterCubit() : super(RegisterInitialState());

  static ShopRegisterCubit get(context) => BlocProvider.of(context);

  late ShopUserModel userModel;
  
  void userCreate({
    required String email,
    required String password,
    required String name,
    required String phone
  }) {
    emit(RegisterLoadingState());

    DioHelper.postData(
      url: REGISTER,
      data: {
        'email': email,
        'password': password,
        'name':name,
        'phone':phone
      },
    ).then((value) {
      userModel = ShopUserModel.fromMap(value.data);

      if(userModel.status)
      {
        print(userModel.status);
        print(userModel.message);
        print(userModel.data?.name);
        print(userModel.data?.id);

        CacheHelper.putData(key: 'userToken', value: userModel.data?.token);

        emit(RegisterSuccessState());
      } else
        {
          print(userModel.status);
          print(userModel.message);
          emit(RegisterSuccessState());
        }
    }).catchError((error) {
      emit(RegisterErrorState());
    });
  }
}