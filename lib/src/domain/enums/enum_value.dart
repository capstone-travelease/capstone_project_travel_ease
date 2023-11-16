enum Environment {
  staging,
  development,
  production,
}

enum MyBookingTabType {
  onGoing('Ongoing'),
  completed('Completed'),
  cancelled('Cancelled');

  final String title;

  const MyBookingTabType(this.title);
}
