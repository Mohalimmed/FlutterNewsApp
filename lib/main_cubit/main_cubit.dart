import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/main_cubit/main_states.dart';
import 'package:news/networks/local/cashe_helper.dart';

class MainCubit extends Cubit<MainStates> {
  MainCubit() : super(MainInstiateStates());

  MainCubit get(context) => BlocProvider.of(context);

  bool appmode = false;

  void ChangeBrightnessButtom({bool? fromShare}) {
    if (fromShare != null) {
      appmode = fromShare;
      emit(NewsBrightnessButtonState());
    } else {
      appmode = !appmode;
      Cashe_helper.putBool(key: 'isDark', value: appmode).then((value) {
        emit(NewsBrightnessButtonState());
      });
    }
  }
}
