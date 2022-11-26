class PlanApi {
  PlanApi._();

  static final PlanApi _singleton = PlanApi._();

  factory PlanApi() => _singleton;

  static PlanApi get instance => _singleton;


}
