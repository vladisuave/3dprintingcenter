<script setup lang="ts">
// Interactive: drag the slider (or press Play) to "print" a keychain layer by layer.
import { computed, onBeforeUnmount, ref } from 'vue'

const props = withDefaults(defineProps<{
  name?: string
  baseLayers?: number
  textLayers?: number
  layerMm?: number
}>(), {
  name: 'MIA',
  baseLayers: 15,
  textLayers: 5,
  layerMm: 0.2,
})

const total = computed(() => props.baseLayers + props.textLayers)
const shown = ref(0)
const playing = ref(false)
let timer: ReturnType<typeof setInterval> | undefined

const heightMm = computed(() => (shown.value * props.layerMm).toFixed(1))
const phase = computed(() => {
  if (shown.value === 0) return 'Empty build plate'
  if (shown.value <= props.baseLayers) return 'Printing the base'
  if (shown.value < total.value) return 'Printing your name'
  return 'Done! Let it cool…'
})

function stop() {
  playing.value = false
  if (timer) clearInterval(timer)
  timer = undefined
}
function play(e?: Event) {
  ;(e?.currentTarget as HTMLElement | undefined)?.blur()
  if (playing.value) return stop()
  if (shown.value >= total.value) shown.value = 0
  playing.value = true
  timer = setInterval(() => {
    if (shown.value >= total.value) return stop()
    shown.value++
  }, 380)
}
function reset(e?: Event) {
  ;(e?.currentTarget as HTMLElement | undefined)?.blur()
  stop()
  shown.value = 0
}
onBeforeUnmount(stop)

const SPACING = 2.2 // px between layers on screen (roughly to scale)
</script>

<template>
  <div class="ls">
    <div class="ls-scene">
      <div class="ls-plate" />
      <div class="ls-stack">
        <template v-for="i in total" :key="i">
          <div
            v-if="i <= shown"
            class="ls-layer"
            :class="[i <= baseLayers ? 'base' : 'text', { hot: i === shown && shown < total, odd: i % 2 === 1, topbase: i === baseLayers }]"
            :style="{ transform: `translateZ(${i * SPACING}px)` }"
          >
            <span v-if="i > baseLayers" :class="{ top: i === shown }">{{ name }}</span>
          </div>
        </template>
      </div>
    </div>

    <div class="ls-panel">
      <div class="ls-phase">{{ phase }}</div>
      <div class="ls-count">
        Layer <b>{{ shown }}</b> of {{ total }}
      </div>
      <div class="ls-height">{{ heightMm }} mm tall</div>
      <input
        v-model.number="shown"
        class="ls-slider"
        type="range"
        min="0"
        :max="total"
        @input="stop"
        @keydown.stop
        @mouseup="($event.target as HTMLElement).blur()"
      >
      <div class="ls-buttons">
        <button class="ls-btn play" @click="play">{{ playing ? '⏸ Pause' : '▶ Print it!' }}</button>
        <button class="ls-btn" @click="reset">↺ Start over</button>
      </div>
    </div>
  </div>
</template>

<style scoped>
.ls {
  display: grid;
  grid-template-columns: 1.35fr 1fr;
  gap: 1.5rem;
  align-items: center;
}
.ls-scene {
  position: relative;
  height: 330px;
  perspective: 1400px;
  display: flex;
  align-items: center;
  justify-content: center;
}
.ls-plate,
.ls-stack {
  position: absolute;
  width: 330px;
  height: 130px;
  transform-style: preserve-3d;
  transform: rotateX(60deg) rotateZ(-28deg) translateY(30px);
}
.ls-plate {
  width: 420px;
  height: 220px;
  background:
    repeating-linear-gradient(0deg, transparent 0 19px, rgba(255, 255, 255, 0.18) 19px 20px),
    repeating-linear-gradient(90deg, transparent 0 19px, rgba(255, 255, 255, 0.18) 19px 20px),
    #38404a;
  border-radius: 10px;
  box-shadow: 0 30px 50px rgba(0, 0, 0, 0.25);
}
.ls-layer {
  position: absolute;
  inset: 0;
  border-radius: 34px;
  transition: background-color 0.3s;
}
.ls-layer.base {
  background: #ff7a1a;
  /* ring hole on the left */
  -webkit-mask: radial-gradient(circle at 48px 50%, transparent 20px, #000 21px);
  mask: radial-gradient(circle at 48px 50%, transparent 20px, #000 21px);
  outline: 1px solid rgba(0, 0, 0, 0.12);
}
.ls-layer.text {
  display: flex;
  align-items: center;
  justify-content: center;
  padding-left: 70px;
  background: transparent;
}
.ls-layer.text span {
  font: 900 80px/1 Nunito, sans-serif;
  color: #d8dde4;
}
.ls-layer.text span.top {
  color: #ffffff;
}
.ls-layer.base.odd {
  background: #e0620c;
}
.ls-layer.base.topbase {
  background: #ff8a33;
}
.ls-layer.hot.base {
  background: #ffd23f;
  box-shadow: 0 0 24px #ffd23f;
}
.ls-layer.hot.text span {
  color: #ffd23f;
  text-shadow: 0 0 14px #ffd23f;
}
.ls-panel {
  display: flex;
  flex-direction: column;
  gap: 0.6rem;
}
.ls-phase {
  font-size: 1.9rem;
  font-weight: 900;
  color: var(--brand-ink);
  line-height: 1.1;
  min-height: 2.2em;
}
.ls-count {
  font-size: 1.6rem;
}
.ls-count b {
  font-size: 2.6rem;
  color: var(--brand-orange);
}
.ls-height {
  font-size: 1.2rem;
  opacity: 0.7;
}
.ls-slider {
  width: 100%;
  height: 2.4rem;
  accent-color: var(--brand-orange);
  cursor: pointer;
}
.ls-buttons {
  display: flex;
  gap: 0.6rem;
}
.ls-btn {
  font: 800 1.15rem Nunito, sans-serif;
  padding: 0.55rem 1rem;
  border-radius: 999px;
  border: 3px solid var(--brand-ink);
  background: white;
  color: var(--brand-ink);
  cursor: pointer;
}
.ls-btn.play {
  background: var(--brand-orange);
  border-color: var(--brand-orange);
  color: white;
}
</style>
