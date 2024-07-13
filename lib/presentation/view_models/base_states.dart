abstract class BaseState{}
class BaseInitialState extends BaseState{}
class BaseLoadingState extends BaseState{}
class BaseErrorState extends BaseState{
  String errorMessage;
  BaseErrorState(this.errorMessage);
}
class BaseSuccessState<T> extends BaseState{
  T? data;
  BaseSuccessState({this.data});
}