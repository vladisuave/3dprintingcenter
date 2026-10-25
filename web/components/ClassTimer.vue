<script setup lang="ts">
// Big on-screen work timer with color-coded phases. Click Start; it keeps
// running if you flip to a reference slide and back.
import { computed, ref } from 'vue'

interface Phase { label: string, minutes: number, color: string, emoji: string }

const props = withDefaults(defineProps<{ phases?: Phase[] }>(), {
  phases: () => [
    { label: 'Explore', minutes: 5, color: '#4f8cff', emoji: '🔍' },
    { label: 'Build', minutes: 15, color: '#ff7a1a', emoji: '🛠️' },
    { label: 'Finish & name it', minutes: 5, color: '#2bb673', emoji: '💾' },
  ],
})

// state lives at module level so it survives slide changes
const state = (globalThis as any).__classTimer ??= { elapsed: ref(0), running: ref(false), handle: undefined as any }
const elapsed = state.elapsed as typeof state.elapsed
const running = state.running as typeof state.running

const totalSec = computed(() => props.phases.reduce((s, p) => s + p.minutes * 60, 0))
const remaining = computed(() => Math.max(0, totalSec.value - elapsed.value))
const mmss = computed(() => {
  const m = Math.floor(remaining.value / 60)
  const s = remaining.value % 60
  return `${m}:${String(s).padStart(2, '0')}`
})
const current = computed(() => {
  let t = elapsed.value
  for (const p of props.phases) {
    if (t < p.minutes * 60) return p
    t -= p.minutes * 60
  }
  return { label: "Time's up!", minutes: 0, color: '#e0475b', emoji: '🎉' }
})

function tick() {
  if (elapsed.value >= totalSec.value) return pause()
  elapsed.value++
}
function start(e: Event) {
  ;(e.currentTarget as HTMLElement).blur()
  if (running.value) return pause()
  running.value = true
  state.handle = setInterval(tick, 1000)
}
function pause() {
  running.value = false
  clearInterval(state.handle)
}
function reset(e: Event) {
  ;(e.currentTarget as HTMLElement).blur()
  pause()
  elapsed.value = 0
}
</script>

<template>
  <div class="ct">
    <div class="ct-now" :style="{ color: current.color }">
      <span class="ct-emoji">{{ current.emoji }}</span> {{ current.label }}
    </div>
    <div class="ct-clock">{{ mmss }}</div>
    <div class="ct-bar">
      <div
        v-for="p in phases"
        :key="p.label"
        class="ct-seg"
        :style="{ flex: p.minutes, background: p.color }"
      >
        <span>{{ p.emoji }}</span>
      </div>
      <div class="ct-cursor" :style="{ left: `${(elapsed / totalSec) * 100}%` }" />
    </div>
    <div class="ct-legend">
      <span v-for="p in phases" :key="p.label" :class="{ now: current.label === p.label }">
        <i :style="{ background: p.color }" /> {{ p.label }} · {{ p.minutes }} min
      </span>
    </div>
    <div class="ct-buttons">
      <button class="ct-btn go" @click="start">{{ running ? '⏸ Pause' : '▶ Start' }}</button>
      <button class="ct-btn" @click="reset">↺ Reset</button>
    </div>
  </div>
</template>

<style scoped>
.ct {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 0.8rem;
}
.ct-now {
  font-size: 2.6rem;
  font-weight: 900;
  transition: color 0.4s;
}
.ct-clock {
  font: 900 9rem/1 Nunito, sans-serif;
  font-variant-numeric: tabular-nums;
  color: var(--brand-ink);
}
.ct-bar {
  position: relative;
  display: flex;
  width: 100%;
  height: 3.2rem;
  border-radius: 999px;
  overflow: hidden;
  border: 3px solid var(--brand-ink);
}
.ct-seg {
  display: flex;
  align-items: center;
  justify-content: center;
  color: white;
  font-weight: 800;
  font-size: 1rem;
  white-space: nowrap;
  overflow: hidden;
}
.ct-seg span {
  font-size: 1.5rem;
}
.ct-legend {
  display: flex;
  gap: 1.6rem;
  font-size: 1.15rem;
  font-weight: 700;
}
.ct-legend span {
  display: flex;
  align-items: center;
  gap: 0.4rem;
  opacity: 0.55;
}
.ct-legend span.now {
  opacity: 1;
  font-weight: 900;
}
.ct-legend i {
  width: 1rem;
  height: 1rem;
  border-radius: 50%;
}
.ct-cursor {
  position: absolute;
  top: 0;
  bottom: 0;
  width: 6px;
  margin-left: -3px;
  background: var(--brand-ink);
  transition: left 1s linear;
}
.ct-buttons {
  display: flex;
  gap: 0.8rem;
}
.ct-btn {
  font: 800 1.3rem Nunito, sans-serif;
  padding: 0.5rem 1.4rem;
  border-radius: 999px;
  border: 3px solid var(--brand-ink);
  background: white;
  color: var(--brand-ink);
  cursor: pointer;
}
.ct-btn.go {
  background: var(--brand-ink);
  color: white;
}
</style>
