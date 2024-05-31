import { defineConfig } from 'vite'
import RubyPlugin from 'vite-plugin-ruby'
import FullReload from 'vite-plugin-full-reload'
import inject from "@rollup/plugin-inject";
import Vue from '@vitejs/plugin-vue'
import AutoImport from 'unplugin-auto-import/vite'

export default defineConfig({
  plugins: [
    inject({   // => that should be first under plugins array
  $: 'jquery',
  jQuery: 'jquery',
}),
    RubyPlugin(),
    FullReload([
       'app/views/**/*',
    ], { delay: 0 }),
    AutoImport({
      // targets to transform
      include: [
        /\.[tj]sx?$/, // .ts, .tsx, .js, .jsx
        /\.vue$/,
        /\.vue\?vue/, // .vue
        /\.md$/, // .md
      ],
      imports: [
        'vue',
        'vue-router',
        'vue-i18n'
      ]
    }),
    Vue()
  ],
})
