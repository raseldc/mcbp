abstract class BaseViewModel extends BaseViewModelInputs with BaseViewModelOutputs{
  //shared variables and functions that will be used all view model
}

abstract class BaseViewModelInputs{
  void start(); // will be called while initialization of view model
  void dispose(); // will be called when view model dies
}

abstract class BaseViewModelOutputs{

}