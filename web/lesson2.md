---
theme: default
title: "Lesson 2: Make Your Own Keychain"
info: 3D Printing Center · Village School · Grades 3–5
colorSchema: light
routerMode: hash
twoslash: false
transition: slide-left
fonts:
  sans: Nunito
  weights: '400,700,800,900'
drawings:
  persist: false
favicon: data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>🔑</text></svg>
layout: center
class: text-center
---

<div class="bob" style="display:inline-block">
  <KeychainArt name="YOU" :width="520" />
</div>

# Make Your Own Keychain!

<div class="caption"><small>3D Printing Center · Lesson 2</small></div>

<!--
Welcome back. Today: log in to Tinkercad, learn to move around, design a name keychain.
Keychains get printed between lessons and come back next time.
-->

---
layout: center
class: text-center
clicks: 1
---

# How does a 3D printer build things?

<div style="font-size:7rem; margin: 1rem 0">🖨️ ➜ ❓</div>

<div v-click class="answer">🥞 Layer by layer!</div>

<!--
Quick recall from Lesson 1. Let a few kids answer before clicking to reveal.
Other good answers: melts plastic, the computer tells it what to do.
-->

---
layout: center
class: text-center
---

# Today you design <span style="color:var(--brand-orange)">this</span>

<div style="display:flex; gap:1.5rem; justify-content:center; margin:1.2rem 0">
  <KeychainArt name="MIA" color="#ff7a1a" :width="300" />
  <KeychainArt name="LEO" color="#4f8cff" :width="300" />
  <KeychainArt name="AVA" color="#2bb673" :width="300" />
</div>

<div class="caption">Your name. Your style. Your keychain.<small>…and you get to keep it! 🎒</small></div>

<!--
Show real printed keychain examples from last rotation here — pass them around.
-->

---
layout: default
---

# Log in to Tinkercad

<div class="cards" style="--n:4; margin-top:1.6rem">
  <div class="card blue">
    <div class="big">🌐</div>
    <b>tinkercad.com</b>
    <small>Click <b>Log In</b></small>
  </div>
  <div class="card orange">
    <div class="big">🎒</div>
    <b>Students, join your class</b>
    <small>Type the <b>class code</b></small>
  </div>
  <div class="card green">
    <div class="big">🪪</div>
    <b>Your nickname</b>
    <small>It's on your <b>slip</b></small>
  </div>
  <div class="card pink">
    <div class="big wiggle">✋</div>
    <b>Wait!</b>
    <small>Hands up when you're in</small>
  </div>
</div>

<!--
Hand out login slips before this slide.
Check the button names against the current Tinkercad login screen before class — Autodesk renames them now and then.
Don't move on until everyone is in.
-->

---
layout: default
---

# The 3 moves

<div class="cards" style="--n:3; margin-top:1.4rem">
  <div class="card orange">
    <div class="cube-stage"><div class="cube spin"><i></i><i></i><i></i><i></i><i></i><i></i></div></div>
    <b>🔄 Spin around</b>
    <small>Right-click + drag<br>or drag the <b>View Cube</b></small>
  </div>
  <div class="card blue">
    <div class="cube-stage"><div class="zoom-wrap"><div class="cube"><i></i><i></i><i></i><i></i><i></i><i></i></div></div></div>
    <b>🔍 Zoom</b>
    <small>Scroll<br>or the <b>+ / −</b> buttons</small>
  </div>
  <div class="card green">
    <div class="cube-stage"><div class="slide-wrap"><div class="cube"><i></i><i></i><i></i><i></i><i></i><i></i></div></div></div>
    <b>✋ Slide over</b>
    <small>Shift + right-click + drag</small>
  </div>
</div>

<div class="caption" style="margin-top:1.4rem">Lost? Press the 🏠 <b>Home</b> button</div>

<!--
Follow along with the built-in "Learning the Moves" lesson, abbreviated (10 min).
On Chromebook touchpads, right-click = two-finger click. The View Cube and +/− buttons are easier for many kids.
-->

---
layout: default
---

# Keychain rules

<div class="cards" style="--n:4; margin-top:1.6rem">
  <div class="card orange">
    <div class="big">⭕</div>
    <b>A hole for the ring</b>
    <small>All the way through</small>
  </div>
  <div class="card blue">
    <div class="big">📏</div>
    <b>50 mm or smaller</b>
    <small>About as big as a cookie</small>
  </div>
  <div class="card green">
    <div class="big">🧱</div>
    <b>3 mm thick or more</b>
    <small>Thin ones snap!</small>
  </div>
  <div class="card pink">
    <div class="big">🧩</div>
    <b>2 or more shapes</b>
    <small>Base + your name</small>
  </div>
</div>

<!--
Hole should be at least 5 mm wide.
The one rule that really matters for printing: hole goes all the way through.
-->

---
layout: default
---

# Will it print? 👍 or 👎

<WillItPrint />

<div class="caption" style="margin-top:1rem"><small>Vote with your thumbs, then tap a card to find out</small></div>

<!--
Kids vote thumbs up/down for each card, then tap to flip.
Answers: LEO no hole; AVA good; JAYDEN 90 mm too big; ZOE too thin (side view).
-->

---
layout: default
clicks: 4
---

# Build it in 4 steps

<BuildSteps />

<!--
Click through each step while demonstrating live in Tinkercad.
Step 3 detail: drag a cylinder, click "Hole" in the shape panel, make it at least 5 mm wide.
Step 4: drag a box around everything (or Ctrl+A), then Group (Ctrl+G). The striped hole turns into a real hole.
-->

---
layout: center
class: text-center
---

# Make it yours!

<div class="emoji-wall" style="margin:1.4rem 0">
  <span>⚽</span><span>🐱</span><span>🦋</span><span>🎮</span><span>🦖</span><span>🌈</span>
  <span>🏀</span><span>🐶</span><span>⭐</span><span>🎨</span><span>🚀</span><span>❤️</span>
</div>

<div class="caption">Add a picture from the Shapes panel<small>…just keep it touching your keychain!</small></div>

<!--
This is where the "clip art" urge goes — let them. The learning constraint:
everything must touch / overlap the base so it prints as one piece.
-->

---
layout: default
---

# Stuck? Try this

<div class="cards" style="--n:4; margin-top:1.6rem">
  <div class="card blue">
    <div class="big">🙈</div>
    <b>Can't see it?</b>
    <small>Press 🏠 Home</small>
  </div>
  <div class="card orange">
    <div class="big">🧩</div>
    <b>Hole not cutting?</b>
    <small>Select all → <b>Group</b></small>
  </div>
  <div class="card green">
    <div class="big">↩️</div>
    <b>Oops?</b>
    <small><b>Undo!</b> (Ctrl + Z)</small>
  </div>
  <div class="card pink">
    <div class="big">🙋</div>
    <b>Still stuck?</b>
    <small>Ask a neighbor, then a teacher</small>
  </div>
</div>

<!--
Leave this slide or the timer up during work time.
-->

---
layout: center
class: text-center
---

# Build time!

<ClassTimer />

<!--
Click Start when kids begin. The timer keeps running if you jump to another slide and back.
Phases: 5 min explore, 15 min build, 5 min finish & name it.
-->

---
layout: default
---

# Name your design

<div style="display:grid; grid-template-columns: 1.1fr 1fr; gap:2rem; align-items:center; margin-top:1rem">
  <div style="background:white; border:4px solid var(--brand-ink); border-radius:18px; padding:1rem 1.2rem; box-shadow:0 6px 0 var(--brand-ink)">
    <div style="font-size:1rem; opacity:.6">top left of the screen</div>
    <div style="font-size:1.9rem; font-weight:900; text-decoration: line-through; opacity:.45">Brave Jaagub-Bruticus</div>
    <div style="font-size:2.3rem; font-weight:900; color:var(--brand-orange)" v-click>Mia Keychain ✏️</div>
  </div>
  <div class="caption">Tinkercad saves by itself 💾<small>Click the silly name and type yours</small></div>
</div>

<!--
Tinkercad autosaves, but random design names make it impossible to find the right file to print.
Ask for "FirstName Keychain".
-->

---
layout: center
class: text-center
---

# Gallery walk

<div class="cards" style="--n:3; margin-top:1.4rem">
  <div class="card blue"><div class="big">👀</div><b>Look</b></div>
  <div class="card orange"><div class="big">💬</div><b>Say one nice thing</b></div>
  <div class="card green"><div class="big">🙌</div><b>Hands off screens</b></div>
</div>

<!--
3 minutes. Kids leave their screen up and walk around.
-->

---
layout: default
---

# Tonight, the printer makes yours!

<LayerStack name="MIA" />

<!--
Drag the slider or press "Print it!". Point out: each layer is 0.2 mm, the base takes 15 layers (3 mm), the name adds 5 more.
Next lesson: see your printed keychains + design a container.
-->

---
layout: center
class: text-center
---

# Clean up

<div class="cards" style="--n:3; margin-top:1.4rem">
  <div class="card green"><div class="big">✏️</div><b>Named it?</b></div>
  <div class="card blue"><div class="big">🗂️</div><b>Close your tabs</b></div>
  <div class="card orange"><div class="big">🔌</div><b>Chromebook away</b></div>
</div>

<div class="caption" style="margin-top:1.6rem">Next time: your keychains are here! 🔑</div>

<!--
Quick share while packing up: what was easy, what was tricky in Tinkercad?
-->
