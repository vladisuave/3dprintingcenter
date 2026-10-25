<script setup lang="ts">
// Four-step keychain build, one step per click. Set `clicks: 4` on the slide.
import { computed } from 'vue'
import { useSlideContext } from '@slidev/client'

const { $clicks } = useSlideContext()
const step = computed(() => Math.min(4, $clicks.value))

const steps = [
  { emoji: '🟧', title: 'Drag in a shape', tip: 'Box or cylinder' },
  { emoji: '🔤', title: 'Add your name', tip: 'Text shape — put it on top' },
  { emoji: '⚪', title: 'Add a Hole', tip: 'Cylinder → click “Hole”' },
  { emoji: '🧩', title: 'Group it!', tip: 'Select all → Group' },
]
</script>

<template>
  <div class="bs">
    <ol class="bs-list">
      <li
        v-for="(s, i) in steps"
        :key="s.title"
        :class="{ now: step === i + 1, done: step > i + 1, later: step < i + 1 }"
      >
        <span class="bs-num">{{ i + 1 }}</span>
        <span class="bs-text">
          <b>{{ s.emoji }} {{ s.title }}</b>
          <small>{{ s.tip }}</small>
        </span>
      </li>
    </ol>

    <svg class="bs-scene" viewBox="0 0 520 360">
      <!-- Tinkercad-style blue workplane -->
      <defs>
        <pattern id="bs-grid" width="24" height="24" patternUnits="userSpaceOnUse">
          <path d="M24 0H0V24" fill="none" stroke="#9cc3ea" stroke-width="1.2" />
        </pattern>
        <pattern id="bs-stripes" width="12" height="12" patternUnits="userSpaceOnUse" patternTransform="rotate(45)">
          <rect width="12" height="12" fill="#c9ced6" />
          <rect width="6" height="12" fill="#8e96a3" />
        </pattern>
        <mask id="bs-holecut">
          <rect x="0" y="0" width="520" height="360" fill="white" />
          <circle cx="132" cy="176" r="26" fill="black" />
        </mask>
      </defs>
      <rect x="10" y="20" width="500" height="320" rx="12" fill="#dcecfb" />
      <rect x="10" y="20" width="500" height="320" rx="12" fill="url(#bs-grid)" />

      <!-- 1: base shape -->
      <g class="bs-pop" :class="{ show: step >= 1 }" :mask="step >= 4 ? 'url(#bs-holecut)' : undefined">
        <rect x="90" y="122" width="340" height="134" rx="40" fill="#ff7a1a" style="filter:brightness(.72)" />
        <rect x="90" y="110" width="340" height="134" rx="40" fill="#ff7a1a" />
      </g>

      <!-- 2: name text -->
      <g class="bs-drop" :class="{ show: step >= 2 }">
        <text style="font-size:70px;font-weight:900;font-family:Nunito, sans-serif" x="290" y="200" text-anchor="middle" fill="#000" opacity=".18">MIA</text>
        <text style="font-size:70px;font-weight:900;font-family:Nunito, sans-serif" x="286" y="192" text-anchor="middle" fill="#fff">MIA</text>
      </g>

      <!-- 3: striped hole cylinder (disappears when grouped) -->
      <g class="bs-pop" :class="{ show: step === 3 }">
        <circle cx="132" cy="182" r="26" fill="#6b7380" />
        <circle cx="132" cy="176" r="26" fill="url(#bs-stripes)" stroke="#6b7380" stroke-width="2" />
      </g>

      <!-- 4: celebration -->
      <g class="bs-pop" :class="{ show: step >= 4 }">
        <circle cx="132" cy="176" r="26" fill="none" stroke="#000" stroke-opacity=".15" stroke-width="5" />
        <text style="font-size:44px" x="440" y="80">✨</text>
        <text style="font-size:38px" x="62" y="300">🎉</text>
      </g>

      <text style="font-size:26px;font-weight:800;font-family:Nunito, sans-serif" v-if="step === 0" x="260" y="190" text-anchor="middle" fill="#5b7fa6">Your workplane</text>
    </svg>
  </div>
</template>

<style scoped>
.bs {
  display: grid;
  grid-template-columns: 1fr 1.25fr;
  gap: 1.5rem;
  align-items: center;
}
.bs-list {
  list-style: none;
  padding: 0;
  margin: 0;
  display: flex;
  flex-direction: column;
  gap: 0.7rem;
}
.bs-list li {
  display: flex;
  align-items: center;
  gap: 0.9rem;
  padding: 0.55rem 0.9rem;
  border-radius: 18px;
  transition: all 0.35s;
}
.bs-list li.now {
  background: var(--brand-ink);
  color: white;
  transform: scale(1.06);
}
.bs-list li.later {
  opacity: 0.35;
}
.bs-num {
  flex: none;
  width: 2.6rem;
  height: 2.6rem;
  border-radius: 50%;
  display: grid;
  place-items: center;
  font-weight: 900;
  font-size: 1.4rem;
  background: var(--brand-orange);
  color: white;
}
.bs-list li.done .bs-num {
  background: #2bb673;
}
.bs-text {
  display: flex;
  flex-direction: column;
  line-height: 1.15;
}
.bs-text b {
  font-size: 1.45rem;
}
.bs-text small {
  font-size: 1.05rem;
  opacity: 0.75;
}
.bs-scene {
  width: 100%;
}
.bs-pop {
  opacity: 0;
  transform: scale(0.6);
  transform-origin: 260px 180px;
  transform-box: view-box;
  transition: opacity 0.35s, transform 0.5s cubic-bezier(.3,1.6,.5,1);
}
.bs-pop.show {
  opacity: 1;
  transform: scale(1);
}
.bs-drop {
  opacity: 0;
  transform: translateY(-120px);
  transition: opacity 0.3s, transform 0.6s cubic-bezier(.3,1.5,.5,1);
}
.bs-drop.show {
  opacity: 1;
  transform: translateY(0);
}
</style>
