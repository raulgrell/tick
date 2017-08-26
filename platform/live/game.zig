#include <stdlib.h>
#include "game.h"

const State = struct {
};

pub fn init() -> &State {
}

void reload(state: &State) {
}

void unload(state: &State) {
}

void finalize(state: &State) {
}

bool step(state: &State) {
}

var GAME = API {
    .init = init,
    .reload = reload,
    .step = step,
    .unload = unload,
    .finalize = finalize
};
