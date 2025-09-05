@echo off
echo 正在启动大学信息查询网站本地服务器...
echo.
echo 请在浏览器中访问: http://localhost:8080
echo 按 Ctrl+C 停止服务器
echo.

cd /d "%~dp0"

rem 尝试使用Python启动服务器
python -m http.server 8080 2>nul
if %errorlevel% neq 0 (
    echo Python未找到，正在尝试使用其他方式...
    
    rem 如果有Node.js，尝试使用http-server
    npx http-server -p 8080 2>nul
    if %errorlevel% neq 0 (
        echo 请手动打开 index.html 文件查看网站
        pause
    )
)