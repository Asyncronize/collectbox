import { defineConfig } from 'vite'

export default defineConfig({
  // Vercel 部署配置
  build: {
    outDir: 'dist',
    assetsDir: 'assets'
  }
})
