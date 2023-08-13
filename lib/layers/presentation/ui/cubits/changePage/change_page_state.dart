abstract class ChangePageState{}

class ChangedPageInitialState extends ChangePageState{
  final int pageIndex;

  ChangedPageInitialState({required this.pageIndex});
}

class ChangedPageState extends ChangePageState{
  final int pageIndex;

  ChangedPageState({required this.pageIndex});
}