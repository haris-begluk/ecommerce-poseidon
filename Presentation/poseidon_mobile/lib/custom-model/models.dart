class Query {
  final int? page;
  final int? pageSize;
  final String? orderBy;
  final String? filter;
  Query({this.page, this.pageSize, this.orderBy, this.filter});
  mapQuery() => {this.page, this.pageSize, this.orderBy, this.filter};
}
