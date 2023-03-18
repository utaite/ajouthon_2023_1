class CourseListPageEvent {
  const CourseListPageEvent();
}

class CourseListPageLoadEvent extends CourseListPageEvent {
  const CourseListPageLoadEvent({
    required this.departments,
  });

  final Iterable<int> departments;
}
