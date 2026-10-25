// Builds every lesson*.md deck into dist/<deck>/ and copies the landing page.
// BASE is the URL path the site is served from (GitHub Pages: /<repo-name>).
import { execFileSync } from 'node:child_process'
import { copyFileSync, mkdirSync, readdirSync, rmSync } from 'node:fs'

const base = (process.env.BASE ?? '/3dprintingcenter').replace(/\/$/, '')
const decks = readdirSync('.').filter(f => /^lesson\d+\.md$/.test(f)).sort()

rmSync('dist', { recursive: true, force: true })
mkdirSync('dist', { recursive: true })

for (const file of decks) {
  const name = file.replace(/\.md$/, '')
  console.log(`\n▶ Building ${file} → dist/${name}/`)
  execFileSync('npx', ['slidev', 'build', file, '--base', `${base}/${name}/`, '--out', `dist/${name}`], { stdio: 'inherit' })
}

copyFileSync('site/index.html', 'dist/index.html')
console.log(`\n✔ Built ${decks.length} deck(s) into dist/`)
