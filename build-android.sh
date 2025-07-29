#!/bin/bash

echo "=== AgoraWebViewTest Android 打包脚本 ==="

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# 检查必要的环境
check_environment() {
    echo -e "${YELLOW}检查环境...${NC}"
    
    # 检查 Node.js
    if ! command -v node &> /dev/null; then
        echo -e "${RED}错误: Node.js 未安装${NC}"
        exit 1
    fi
    echo "✓ Node.js: $(node --version)"
    
    # 检查 npm
    if ! command -v npm &> /dev/null; then
        echo -e "${RED}错误: npm 未安装${NC}"
        exit 1
    fi
    echo "✓ npm: $(npm --version)"
    
    # 检查 Java
    if ! command -v java &> /dev/null; then
        echo -e "${RED}错误: Java 未安装${NC}"
        exit 1
    fi
    echo "✓ Java: $(java -version 2>&1 | head -n 1)"
    
    echo -e "${GREEN}环境检查完成${NC}"
}

# 查找生成的 APK
find_apk() {
    echo -e "${YELLOW}查找生成的 APK 文件...${NC}"
    
    APK_PATH=$(find android -name "*.apk" -type f | grep -E "(debug|release)" | head -n 1)
    
    if [ -n "$APK_PATH" ]; then
        echo -e "${GREEN}找到 APK 文件: $APK_PATH${NC}"
        echo -e "${GREEN}APK 大小: $(du -h "$APK_PATH" | cut -f1)${NC}"
        
        # 复制到项目根目录
        APK_NAME="AgoraWebViewTest-$(date +%Y%m%d-%H%M%S).apk"
        cp "$APK_PATH" "$APK_NAME"
        echo -e "${GREEN}APK 已复制到: $APK_NAME${NC}"
        
        return 0
    else
        echo -e "${RED}未找到 APK 文件${NC}"
        return 1
    fi
}

# 主函数
main() {
    echo "开始构建 AgoraWebViewTest Android 应用..."
    
    # 检查环境
    check_environment
    
    echo -e "${YELLOW}尝试构建 APK...${NC}"
    echo "由于网络问题，请手动执行以下步骤："
    echo ""
    echo "1. 使用 Android Studio 打开项目:"
    echo "   - 打开 Android Studio"
    echo "   - 选择 'Open an existing Android Studio project'"
    echo "   - 选择 $(pwd)/android 目录"
    echo ""
    echo "2. 在 Android Studio 中构建:"
    echo "   - 等待项目同步完成"
    echo "   - 点击 Build -> Build Bundle(s) / APK(s) -> Build APK(s)"
    echo ""
    echo "3. 或者尝试以下命令行方法:"
    echo "   cd android && ./gradlew assembleDebug"
    echo ""
    echo "4. APK 文件将生成在:"
    echo "   android/app/build/outputs/apk/debug/app-debug.apk"
}

# 如果直接运行脚本
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
