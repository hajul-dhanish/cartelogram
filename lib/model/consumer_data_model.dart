class ConsumerDataModel {
  final String usedDrug;
  final String usedTime;
  final String usedDate;
  final bool isCutOff;
  final double drugCost;
  const ConsumerDataModel(
    this.usedDrug,
    this.usedTime,
    this.usedDate,
    this.isCutOff,
    this.drugCost,
  );
}
