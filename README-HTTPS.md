# 使用 HTTPS 的几种方法

## 方法1：GitHub Pages（推荐）

1. 创建一个GitHub仓库
2. 上传 `agora-webview.html` 到仓库
3. 在仓库设置中启用GitHub Pages
4. 使用URL：`https://your-username.github.io/your-repo/agora-webview.html`

## 方法2：使用 Netlify Drop

1. 访问 https://app.netlify.com/drop
2. 直接拖拽 `agora-webview.html` 文件
3. 获得免费的HTTPS URL

## 方法3：使用 Vercel

1. 安装 Vercel CLI: `npm i -g vercel`
2. 在项目目录运行: `vercel --prod`
3. 获得HTTPS URL

## 方法4：使用 CodePen

1. 访问 https://codepen.io
2. 创建新的Pen，粘贴HTML代码
3. 使用 CodePen 的HTTPS URL

## 方法5：临时使用现有测试页面

修改 App.tsx 使用以下URL之一：

```javascript
// Agora官方示例
uri: 'https://webdemo.agora.io/basicVideoCall/index.html'

// WebRTC测试页面
uri: 'https://webrtc.github.io/samples/src/content/getusermedia/gum/'

// 简单的getUserMedia测试
uri: 'https://jsfiddle.net/your-fiddle-id/embedded/result/'
```

## 当前推荐配置

最简单的方法是使用Netlify Drop：

1. 访问 https://app.netlify.com/drop
2. 拖拽我们创建的 `agora-webview.html` 文件
3. 在30秒内获得免费的HTTPS URL
4. 在App.tsx中使用这个URL

这样可以立即测试HTTPS环境下的MediaDevices API。