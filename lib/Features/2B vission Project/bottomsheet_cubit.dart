
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomSheetCubit extends Cubit<int>{
    BottomSheetCubit() : super(0);

    void increment(){
        emit(state + 1);
    }
}

