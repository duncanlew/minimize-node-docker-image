const esbuild = require('esbuild')

esbuild.build({
  entryPoints: ['./dist/main.js'],
  outfile: './dist/main-full.js',
  bundle: true,
  minify: true,
  platform: 'node',
  sourcemap: true,
  target: 'node14'
}).catch(() => process.exit(1))