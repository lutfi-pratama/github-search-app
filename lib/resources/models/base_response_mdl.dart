class BaseResponseMdl<T> {
  int? totalCount;
  bool? incompleteResults;
  T? items;

  BaseResponseMdl({
    this.totalCount,
    this.incompleteResults,
    this.items,
  });
}
