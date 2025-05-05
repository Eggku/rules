<h1 align="center">
  <br>
  <img src="https://raw.githubusercontent.com/yourname/repo/main/assets/logo.png" alt="Mihomo Rules" width="200">
  <br>
  Mihomo 规则集转换工具
  <br>
</h1>

<div align="center">

[![GitHub release](https://img.shields.io/github/v/release/yourname/repo?style=flat-square)](https://github.com/yourname/repo/releases)
[![Build Status](https://img.shields.io/github/actions/workflow/status/yourname/repo/convert.yml?logo=github&style=flat-square)](https://github.com/yourname/repo/actions)
[![License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)](LICENSE)

</div>

<div align="center">
  <img src="https://raw.githubusercontent.com/yourname/repo/main/assets/demo.gif" alt="Demo" width="600">
</div>

## 📚 目录

- [✨ 功能特性](#-功能特性)
- [⚡ 快速开始](#-快速开始)
- [📁 文件结构](#-文件结构)
- [🎯 使用示例](#-使用示例)
- [⚙️ 配置说明](#️-配置说明)
- [🚨 注意事项](#-注意事项)
- [🤖 自动化](#-自动化)
- [💡 贡献指南](#-贡献指南)
- [📜 许可证](#-许可证)

## ✨ 功能特性

<div class="feature-grid">

| ​**多格式支持**​          | ​**智能转换**​              | ​**生产就绪**​          |
|-------------------------|--------------------------|-----------------------|
| ![YAML](https://img.shields.io/badge/YAML-FF6F00?logo=yaml) 域名规则 | 自动检测规则类型          | 开箱即用的.mrs文件    |
| ![TXT](https://img.shields.io/badge/Text-000000?logo=text) IP-CIDR规则 | 自动清理无效条目          | 无缝对接Mihomo配置    |

</div>

## ⚡ 快速开始

### 基础转换命令

```bash
# 转换域名规则
mihomo convert-ruleset domain yaml input.yaml output.mrs

# 转换IP-CIDR规则
mihomo convert-ruleset ipcidr text input.txt output.mrs
