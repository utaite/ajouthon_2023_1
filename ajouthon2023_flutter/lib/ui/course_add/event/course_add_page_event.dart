class CourseAddPageEvent {
  const CourseAddPageEvent();
}

class CourseAddPageLoadEvent extends CourseAddPageEvent {
  const CourseAddPageLoadEvent({
    required this.departments,
  });

  final Iterable<int> departments;
}
