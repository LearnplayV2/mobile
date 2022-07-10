class CounterState {
  int count;

  CounterState({required this.count});

  CounterState copyWith({
    int? count,
  }) {
    return CounterState(
      count: count ?? this.count,
    );
  }
  
}
