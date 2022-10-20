import { defineConfig } from 'vite'
import RubyPlugin from 'vite-plugin-ruby'
import FullReload from 'vite-plugin-full-reload';
import vue from '@vitejs/plugin-vue';
import WindiCSS from 'vite-plugin-windicss'

export default defineConfig({
  plugins: [
    RubyPlugin(),
    FullReload(['config/routes.rb', 'app/views/**/*', 'app/controllers/**/*'], { delay: 200 }),
    vue({
      template: {
        compilerOptions: {
          isCustomElement: (tag) => ['md-linedivider'].includes(tag),
        }
      }
    }),
    WindiCSS({
      root: __dirname,
      scan: {
        fileExtensions: ['erb', 'haml', 'html', 'vue', 'js', 'ts', 'jsx', 'tsx'],
        dirs: ['app/views', 'app/javascript'],
      },
    }),
  ],
})
