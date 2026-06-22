#include "jq_migemo.h"
#include "migemo.h"

static migemo* m;

migemo* get_migemo() {
  if (m == NULL) {
    char *migemo_dict = getenv("MIGEMO_DICT");
    m = migemo_open(migemo_dict);
  }
  return m;
}

void close_migemo() {
  if (m == NULL) {
    return;
  }

  migemo_close(get_migemo());
}
