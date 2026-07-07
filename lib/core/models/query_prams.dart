class QueryParams {
  final QueryCondition? condition;
  final QueryOrder? order;

  QueryParams({ this.condition,  this.order});
}

class QueryCondition {
  final String field;
  final dynamic isEqualTo;
  final dynamic arrayContains;
  final dynamic whereIn;

  QueryCondition({
    required this.field,
    this.isEqualTo,
    this.arrayContains,
    this.whereIn,
  });
}

class QueryOrder {
  final String field;
  final bool descending;

  QueryOrder({required this.field, this.descending = false});
}
