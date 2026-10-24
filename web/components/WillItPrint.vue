<script setup lang="ts">
// "You try it" game: kids vote thumbs up / down, teacher taps a card to reveal.
import { ref } from 'vue'

interface Card {
  id: string
  ok: boolean
  answer: string
}

const cards: Card[] = [
  { id: 'nohole', ok: false, answer: 'No hole — where does the ring go?' },
  { id: 'good', ok: true, answer: 'Yes! Hole, thick, small enough.' },
  { id: 'huge', ok: false, answer: 'Too big! Max 50 mm.' },
  { id: 'thin', ok: false, answer: 'Too thin — it will snap! 3 mm or more.' },
]

const flipped = ref<Record<string, boolean>>({})
function flip(id: string, e: Event) {
  ;(e.currentTarget as HTMLElement).blur()
  flipped.value[id] = !flipped.value[id]
}
</script>

<template>
  <div class="wip">
    <button
      v-for="c in cards"
      :key="c.id"
      class="wip-card"
      :class="{ flipped: flipped[c.id], ok: c.ok }"
      @click="flip(c.id, $event)"
    >
      <div class="wip-inner">
        <div class="wip-front">
          <!-- No hole -->
          <svg v-if="c.id === 'nohole'" viewBox="0 18 200 140">
            <rect x="20" y="40" width="160" height="70" rx="22" fill="#4f8cff" />
            <text style="font-size:34px;font-weight:900;font-family:Nunito, sans-serif" x="100" y="88" text-anchor="middle" fill="#fff">LEO</text>
            <rect x="20" y="122" width="160" height="14" rx="3" fill="#4f8cff" style="filter:brightness(.7)" />
            <text style="font-size:15px;font-weight:700" x="100" y="148" text-anchor="middle" fill="currentColor" opacity=".6">side view</text>
          </svg>
          <!-- Good -->
          <svg v-else-if="c.id === 'good'" viewBox="0 18 200 140">
            <rect x="20" y="40" width="160" height="70" rx="22" fill="#2bb673" />
            <circle cx="46" cy="75" r="11" fill="var(--wip-bg)" />
            <text style="font-size:32px;font-weight:900;font-family:Nunito, sans-serif" x="114" y="88" text-anchor="middle" fill="#fff">AVA</text>
            <rect x="20" y="122" width="160" height="14" rx="3" fill="#2bb673" style="filter:brightness(.7)" />
            <text style="font-size:15px;font-weight:700" x="100" y="148" text-anchor="middle" fill="currentColor" opacity=".6">side view</text>
          </svg>
          <!-- Huge -->
          <svg v-else-if="c.id === 'huge'" viewBox="0 18 200 140">
            <rect x="4" y="22" width="192" height="96" rx="26" fill="#a259ff" />
            <circle cx="30" cy="70" r="11" fill="var(--wip-bg)" />
            <text style="font-size:30px;font-weight:900;font-family:Nunito, sans-serif" x="112" y="84" text-anchor="middle" fill="#fff">JAYDEN</text>
            <line x1="4" y1="132" x2="196" y2="132" stroke="currentColor" stroke-width="2" />
            <line x1="4" y1="126" x2="4" y2="138" stroke="currentColor" stroke-width="2" />
            <line x1="196" y1="126" x2="196" y2="138" stroke="currentColor" stroke-width="2" />
            <text style="font-size:16px;font-weight:800" x="100" y="148" text-anchor="middle" fill="currentColor">90 mm</text>
          </svg>
          <!-- Thin -->
          <svg v-else viewBox="0 18 200 140">
            <rect x="20" y="40" width="160" height="70" rx="22" fill="#ff5c8a" />
            <circle cx="46" cy="75" r="11" fill="var(--wip-bg)" />
            <text style="font-size:32px;font-weight:900;font-family:Nunito, sans-serif" x="114" y="88" text-anchor="middle" fill="#fff">ZOE</text>
            <rect x="20" y="127" width="160" height="3" rx="1" fill="#ff5c8a" style="filter:brightness(.7)" />
            <text style="font-size:15px;font-weight:700" x="100" y="148" text-anchor="middle" fill="currentColor" opacity=".6">side view</text>
          </svg>
        </div>
        <div class="wip-back">
          <div class="wip-verdict">{{ c.ok ? '✅' : '❌' }}</div>
          <div class="wip-answer">{{ c.answer }}</div>
        </div>
      </div>
    </button>
  </div>
</template>

<style scoped>
.wip {
  --wip-bg: #fff8ef;
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 1.1rem;
  margin-top: 1.2rem;
}
.wip-card {
  perspective: 900px;
  height: 290px;
  border: none;
  background: none;
  padding: 0;
  cursor: pointer;
  font-family: Nunito, sans-serif;
  color: var(--brand-ink);
}
.wip-inner {
  position: relative;
  width: 100%;
  height: 100%;
  transition: transform 0.6s cubic-bezier(.3,1.4,.5,1);
  transform-style: preserve-3d;
}
.wip-card.flipped .wip-inner {
  transform: rotateY(180deg);
}
.wip-front,
.wip-back {
  position: absolute;
  inset: 0;
  backface-visibility: hidden;
  border-radius: 22px;
  border: 4px solid var(--brand-ink);
  background: var(--wip-bg);
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 0.7rem;
}
.wip-front svg {
  width: 100%;
}
.wip-back {
  transform: rotateY(180deg);
  flex-direction: column;
  gap: 0.6rem;
  background: #ffe1e1;
  border-color: #e0475b;
}
.wip-card.ok .wip-back {
  background: #dcf7e8;
  border-color: #2bb673;
}
.wip-verdict {
  font-size: 4rem;
  line-height: 1;
}
.wip-answer {
  font-size: 1.25rem;
  font-weight: 800;
  line-height: 1.2;
  text-align: center;
}
</style>
