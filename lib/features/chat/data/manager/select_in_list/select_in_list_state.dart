abstract class SelectInListState {}

class SelectInListInitial extends SelectInListState {}

class StartSelectState extends SelectInListState {}

class EndSelectState extends SelectInListState {}

class StartDeleting extends SelectInListInitial {}

class EndDeleting extends SelectInListInitial {}
