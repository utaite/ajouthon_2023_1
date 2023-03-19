class CheckPageEvent {
  const CheckPageEvent();
}

class CheckPageLoadEvent extends CheckPageEvent {
  const CheckPageLoadEvent({
    required this.departments,
  });

  final Iterable<int> departments;
}
