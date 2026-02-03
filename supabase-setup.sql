-- CollectBox 数据库设置脚本
-- 在 Supabase Dashboard > SQL Editor 中运行此脚本

-- 1. 创建 bookmarks 表
CREATE TABLE IF NOT EXISTS bookmarks (
    id BIGSERIAL PRIMARY KEY,
    url TEXT NOT NULL,
    title TEXT NOT NULL,
    platform TEXT NOT NULL CHECK (platform IN ('xiaohongshu', 'zhihu', 'bilibili', 'other')),
    status TEXT NOT NULL DEFAULT 'active' CHECK (status IN ('active', 'deleted')),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 2. 创建索引以提高查询性能
CREATE INDEX IF NOT EXISTS idx_bookmarks_status ON bookmarks(status);
CREATE INDEX IF NOT EXISTS idx_bookmarks_platform ON bookmarks(platform);
CREATE INDEX IF NOT EXISTS idx_bookmarks_created_at ON bookmarks(created_at DESC);

-- 3. 启用 RLS (Row Level Security)
ALTER TABLE bookmarks ENABLE ROW LEVEL SECURITY;

-- 4. 创建允许所有操作的策略（用于开发/测试）
-- 注意：生产环境应该设置更严格的权限策略
CREATE POLICY "允许所有用户读取" ON bookmarks
    FOR SELECT USING (true);

CREATE POLICY "允许所有用户插入" ON bookmarks
    FOR INSERT WITH CHECK (true);

CREATE POLICY "允许所有用户更新" ON bookmarks
    FOR UPDATE USING (true);

CREATE POLICY "允许所有用户删除" ON bookmarks
    FOR DELETE USING (true);

-- 5. 创建更新时间戳的触发器
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ language 'plpgsql';

CREATE TRIGGER update_bookmarks_updated_at
    BEFORE UPDATE ON bookmarks
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

-- 6. 插入一些测试数据（可选）
INSERT INTO bookmarks (url, title, platform, status) VALUES
    ('https://www.xiaohongshu.com/explore/123', '测试小红书收藏', 'xiaohongshu', 'active'),
    ('https://www.zhihu.com/question/456', '测试知乎问题', 'zhihu', 'active'),
    ('https://www.bilibili.com/video/BV789', '测试B站视频', 'bilibili', 'active');

-- 完成！现在可以在应用中使用了
