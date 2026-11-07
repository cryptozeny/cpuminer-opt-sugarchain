/* pthread_barrier for platforms that lack it, such as macOS. Only the three calls that the algorithms of this tree use
 * are provided: init, wait and destroy. wait returns 0 for every thread, which is allowed by POSIX (only one thread
 * must receive PTHREAD_BARRIER_SERIAL_THREAD). */
#ifndef NEB_PTHREAD_BARRIER_H
#define NEB_PTHREAD_BARRIER_H

#include <pthread.h>

typedef struct {
    pthread_mutex_t mutex;
    pthread_cond_t cond;
    unsigned threshold;
    unsigned waiting;
    unsigned round;
} pthread_barrier_t;

#define PTHREAD_BARRIER_SERIAL_THREAD 0

static inline int pthread_barrier_init(pthread_barrier_t *b, const void *attr, unsigned count) {
    (void)attr;
    if (count == 0) return 22; /* EINVAL */
    pthread_mutex_init(&b->mutex, NULL);
    pthread_cond_init(&b->cond, NULL);
    b->threshold = count;
    b->waiting = 0;
    b->round = 0;
    return 0;
}

static inline int pthread_barrier_destroy(pthread_barrier_t *b) {
    pthread_cond_destroy(&b->cond);
    pthread_mutex_destroy(&b->mutex);
    return 0;
}

static inline int pthread_barrier_wait(pthread_barrier_t *b) {
    pthread_mutex_lock(&b->mutex);
    unsigned round = b->round;
    if (++b->waiting == b->threshold) {
        b->waiting = 0;
        b->round = round + 1;
        pthread_cond_broadcast(&b->cond);
    } else {
        while (round == b->round) pthread_cond_wait(&b->cond, &b->mutex);
    }
    pthread_mutex_unlock(&b->mutex);
    return 0;
}

#endif
