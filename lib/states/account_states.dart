enum AccountStates { unregistered, unregistering, registering, registered, uninitialized, uninitializing, fetching, loaded, refreshing }

int state_(AccountStates state) {
  return state.index;
}
