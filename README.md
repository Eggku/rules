# 🚀 Mihomo规则集转换工具指南

![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/yourname/repo/convert.yml?label=自动转换)
![License](https://img.shields.io/badge/license-MIT-blue)
![Latest Version](https://img.shields.io/badge/版本-v1.2.0-green)

本仓库提供高效的规则集转换方案，可将YAML/TXT规则文件转换为Mihomo专用的.mrs格式。

📌 ​**​[立即下载最新规则集](https://github.com/yourname/repo/releases/latest)​**​

## 📖 目录

- [工具特性](#-工具特性)
- [快速开始](#-快速开始)
- [文件结构](#-文件结构)
- [配置示例](#-配置示例)
- [注意事项](#⚠️-注意事项)
- [贡献指南](#-贡献指南)
- [许可证](#-许可证)

## 🌟 工具特性

- 双模式转换支持：​**Domain规则**与**IP-CIDR规则**​
- 多格式输入：YAML结构化配置 / TXT文本清单
- 自动化集成：GitHub Actions原生支持
- 开箱即用：预生成规则文件即刻部署

## 🚦 快速开始

### 基础命令

```bash
# 转换域名规则
mihomo convert-ruleset domain yaml 输入文件.yaml 输出文件.mrs

# 转换IP-CIDR规则
mihomo convert-ruleset ipcidr text 输入文件.txt 输出文件.mrs
