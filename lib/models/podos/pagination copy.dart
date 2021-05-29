class PaginatedData<T> {
  int page;
  int pageCount;
  List<T> data;

  PaginatedData({this.page = 0, this.pageCount = 0, this.data = const []});

  bool get hasNext {
    return page < pageCount;
  }

  int get next {
    return page + 1;
  }

  toString() {
    return "page => $page, pageCount => $pageCount, data => ${data.length}, next => $next, hasNext => $hasNext";
  }

  PaginatedData<T> addData(PaginatedData<T> pageData) {
    if (pageData.page == 0) {
      return pageData;
    }
    if (this == pageData) return this;
    return PaginatedData(
      page: pageData.page,
      pageCount: pageData.pageCount,
      data: [...data, ...pageData.data],
    );
  }

  PaginatedData<T> addSingleItem(T item, {bool unshift = true}) {
    final _data = this;
    final items = unshift ? [item, ...data] : [...data, item];
    print(items);
    return PaginatedData(
      page: _data.page,
      pageCount: _data.pageCount,
      data: items,
    );
  }

  bool operator ==(other) {
    return (other is PaginatedData<T>) &&
        (page == other.page &&
            pageCount == other.pageCount &&
            data == other.data);
  }

  @override
  int get hashCode => super.hashCode;
}
