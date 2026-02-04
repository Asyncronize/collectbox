# CollectBox - 智能收藏助手

统一管理你在小红书、知乎、B站等平台的收藏内容，支持 AI 智能分析。

## 功能特性

- 📦 **统一收藏管理** - 集中管理多平台收藏内容
- 🤖 **AI 智能分析** - 自动提取摘要、要点和标签（可选）
- 🔍 **智能搜索** - 快速查找收藏内容
- 🏷️ **平台筛选** - 按来源平台分类查看
- 📱 **响应式设计** - 完美适配手机和桌面

## 快速开始

### 1. 安装依赖

```bash
npm install
```

### 2. 配置环境变量

复制 `.env.example` 为 `.env` 并填入你的配置：

```bash
cp .env.example .env
```

然后编辑 `.env` 文件：

```env
# 必需：Supabase 配置
VITE_SUPABASE_URL=your_supabase_url
VITE_SUPABASE_ANON_KEY=your_supabase_anon_key

# 可选：Gemini AI 配置（用于AI分析功能）
VITE_GEMINI_API_KEY=your_gemini_api_key

# 可选：PostHog 配置（用于数据分析）
VITE_POSTHOG_KEY=your_posthog_key
```

#### 获取 Supabase 配置

1. 访问 [Supabase Dashboard](https://supabase.com/dashboard)
2. 创建新项目或选择现有项目
3. 进入 Settings > API
4. 复制 `Project URL` 和 `anon public` key

#### 获取 Gemini API Key（可选）

1. 访问 [Google AI Studio](https://aistudio.google.com/app/apikey)
2. 点击 "Create API Key"
3. 复制生成的 API Key

### 3. 配置数据库

在 Supabase SQL Editor 中运行 `supabase-setup.sql` 文件中的 SQL 脚本。

### 4. 运行开发服务器

```bash
npm run dev
```

访问 http://localhost:5173 查看应用。

### 5. 构建生产版本

```bash
npm run build
```

构建后的文件在 `dist` 目录。

## 部署到 Vercel

### 方式一：通过 Vercel Dashboard

1. 推送代码到 GitHub
2. 在 [Vercel](https://vercel.com) 导入项目
3. 配置环境变量（在 Settings > Environment Variables）
4. 部署

### 方式二：通过 Vercel CLI

```bash
# 安装 Vercel CLI
npm i -g vercel

# 部署
vercel

# 配置环境变量
vercel env add VITE_SUPABASE_URL
vercel env add VITE_SUPABASE_ANON_KEY
```

## 环境变量说明

| 变量名 | 必需 | 说明 |
|--------|------|------|
| `VITE_SUPABASE_URL` | ✅ | Supabase 项目 URL |
| `VITE_SUPABASE_ANON_KEY` | ✅ | Supabase 匿名访问密钥 |
| `VITE_GEMINI_API_KEY` | ⭕ | Gemini AI API 密钥（用于AI分析功能） |
| `VITE_POSTHOG_KEY` | ⭕ | PostHog 项目密钥（用于数据分析） |
| `VITE_POSTHOG_HOST` | ⭕ | PostHog 服务器地址 |

## 技术栈

- **前端框架**: Vite + Vanilla JavaScript
- **数据库**: Supabase (PostgreSQL)
- **AI 能力**: Google Gemini AI
- **数据分析**: PostHog
- **部署**: Vercel

## 开发

```bash
# 开发模式
npm run dev

# 构建
npm run build

# 预览构建结果
npm run preview
```

## 注意事项

- 环境变量以 `VITE_` 开头才能在前端访问
- `.env` 文件已添加到 `.gitignore`，不会被提交到 Git
- Supabase anon key 是公开的，安全性由 RLS（行级安全）保证
- Gemini API Key 建议使用服务端代理（当前为前端直接调用）

## License

MIT
