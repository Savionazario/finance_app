import 'package:finance_app/layers/presentation/ui/cubits/changePage/change_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePageCubit extends Cubit<ChangePageState>{
  ChangePageCubit() : super(ChangedPageInitialState(pageIndex: 0));

  void changePage({required int pageIndex}){
    emit(ChangedPageState(pageIndex: pageIndex));
  }
}