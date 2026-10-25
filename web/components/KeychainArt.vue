<script setup lang="ts">
// A friendly flat keychain illustration: rounded tag, ring hole, raised name.
withDefaults(defineProps<{
  name?: string
  color?: string
  textColor?: string
  hole?: boolean
  ring?: boolean
  width?: number
}>(), {
  name: 'MIA',
  color: '#ff7a1a',
  textColor: '#ffffff',
  hole: true,
  ring: true,
  width: 420,
})
</script>

<template>
  <svg :width="width" viewBox="0 0 420 200" class="keychain-art" role="img" :aria-label="`Keychain that says ${name}`">
    <!-- shadow -->
    <rect x="34" y="44" width="360" height="140" rx="40" fill="#000" opacity="0.12" />
    <!-- side (thickness) -->
    <rect x="24" y="40" width="360" height="140" rx="40" :fill="color" style="filter: brightness(0.72)" />
    <!-- top face -->
    <rect x="24" y="28" width="360" height="140" rx="40" :fill="color" />
    <!-- hole -->
    <g v-if="hole">
      <circle cx="78" cy="98" r="22" fill="var(--kc-bg, #fff8ef)" />
      <path d="M56 98 a22 22 0 0 1 44 0" fill="none" stroke="#000" stroke-opacity="0.18" stroke-width="5" />
    </g>
    <!-- raised name -->
    <text style="font-size:76px;font-weight:900;font-family:Nunito, sans-serif" x="242" y="126" text-anchor="middle"
      fill="#000" opacity="0.18">{{ name }}</text>
    <text style="font-size:76px;font-weight:900;font-family:Nunito, sans-serif" x="238" y="118" text-anchor="middle"
      :fill="textColor">{{ name }}</text>
    <!-- metal ring -->
    <circle v-if="hole && ring" cx="58" cy="70" r="46" fill="none" stroke="#9aa3ad" stroke-width="9" />
    <circle v-if="hole && ring" cx="58" cy="70" r="46" fill="none" stroke="#e3e8ee" stroke-width="3" />
  </svg>
</template>
