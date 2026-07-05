# serve.ps1
# 一键在本地启动 Jekyll 开发服务器，用于本地预览 / 调试这个学术主页。
# 用法（在项目根目录打开 PowerShell 后）：
#     .\serve.ps1
# 停止服务器：在运行窗口按 Ctrl+C
#
# 可选参数：
#     .\serve.ps1 -Port 4002   # 指定其它端口（默认 4001）

param(
    [int]$Port = 4001
)

$ErrorActionPreference = "Stop"

# 切换到脚本所在目录（即项目根目录），保证从任何位置运行都正确
Set-Location -Path $PSScriptRoot

# 如果当前会话找不到 ruby，则把 RubyInstaller 的默认安装路径加进 PATH
if (-not (Get-Command ruby -ErrorAction SilentlyContinue)) {
    $rubyBin = "C:\Ruby40-x64\bin"
    if (Test-Path $rubyBin) {
        $env:PATH = "$rubyBin;$env:PATH"
    } else {
        Write-Error "找不到 ruby，请确认 Ruby 已安装，或修改脚本里的 rubyBin 路径。"
        exit 1
    }
}

# 预加载兼容补丁：补回 Ruby 3.2+ 移除的 tainted?/taint/untaint，供老 Liquid 使用
$shim = Join-Path $PSScriptRoot ".taint_shim.rb"
$env:RUBYOPT = "-r$shim"

Write-Host "启动 Jekyll 本地服务器，端口 $Port ..." -ForegroundColor Cyan
Write-Host "浏览器打开: http://localhost:$Port/" -ForegroundColor Green
Write-Host "按 Ctrl+C 停止。" -ForegroundColor DarkGray

# --livereload   保存文件后自动刷新浏览器
# --force_polling 用轮询方式监听文件变化（替代未安装的 wdm）
bundle exec jekyll serve --livereload --force_polling --port $Port
