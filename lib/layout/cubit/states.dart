abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsBottomNavState extends NewsStates {}

class GetBusinessLoadingStatae extends NewsStates {}

class GetBusinessSuccessState extends NewsStates {}

class GetBusinessErrorState extends NewsStates {
  final String? error;

  GetBusinessErrorState(this.error);
}

class GetSportsLoadingStatae extends NewsStates {}

class GetSportsSuccessState extends NewsStates {}

class GetSportsErrorState extends NewsStates {
  final String? error;

  GetSportsErrorState(this.error);
}

class GetScienceLoadingStatae extends NewsStates {}

class GetScienceSuccessState extends NewsStates {}

class GetScienceErrorState extends NewsStates {
  final String? error;

  GetScienceErrorState(this.error);
}

class GetSearchLoadingStatae extends NewsStates {}

class GetSearchSuccessState extends NewsStates {}

class GetSearchErrorState extends NewsStates {
  final String? error;

  GetSearchErrorState(this.error);
}
