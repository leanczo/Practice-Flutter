enum ActionType {
  inspection,
  assessment,
}

ActionType getActionType(String actionString) {
  int index = 0;
  for (ActionType action in ActionType.values) {
    if (action.toString().split('.').last == actionString) {
      return ActionType.values[index];
    }
    index++;
  }
  return null;
}

String getActionString(ActionType actionType) {
  return actionType.toString().split('.').last;
}
