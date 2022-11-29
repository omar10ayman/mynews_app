abstract class NewsStates {}

class intialState extends NewsStates {}

class loadingBussiessData extends NewsStates {}

class scussesgBussiessData extends NewsStates {}

class errorBussiessData extends NewsStates {
  final String error;

  errorBussiessData(this.error);
}

class loadingSportsData extends NewsStates {}

class scussesgSportsData extends NewsStates {}

class errorSportsData extends NewsStates {
  final String error;

  errorSportsData(this.error);
}

class loadingentertainmentData extends NewsStates {}

class scussesgentertainmentData extends NewsStates {}

class errorentertainmentData extends NewsStates {
  final String error;
  errorentertainmentData(this.error);
}

class loadinghealthData extends NewsStates {}

class scussesghealthData extends NewsStates {}

class errorhealthData extends NewsStates {
  final String error;

  errorhealthData(this.error);
}

class loadingenttechnologyData extends NewsStates {}

class scussesgenttechnologyData extends NewsStates {}

class errorenttechnologyData extends NewsStates {
  final String error;

  errorenttechnologyData(this.error);
}

class loadingsearchData extends NewsStates {}

class scussesgsearchData extends NewsStates {}

class errorsearchData extends NewsStates {
  final String error;

  errorsearchData(this.error);
}

class loadingscienceData extends NewsStates {}

class scussesgscienceData extends NewsStates {}

class errorscienceData extends NewsStates {
  final String error;

  errorscienceData(this.error);
}

class darkModeState extends NewsStates {}
