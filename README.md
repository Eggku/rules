# 🛡️ Rule Repository | 规则仓库

[![GitHub Actions](https://img.shields.io/github/actions/workflow/status/yourname/yourrepo/convert-rules.yml?label=自动转换)](https://github.com/yourname/yourrepo/actions)
[![License](https://img.shields.io/badge/license-MIT-green)](https://opensource.org/licenses/MIT)
[![Rules Version](https://img.shields.io/badge/version-2024.1.0-blue)](https://github.com/yourname/yourrepo/releases)

本仓库提供高效可靠的网络规则集，支持 ​**Mihomo/Clash**​ 等主流代理工具，每日自动更新维护。

![Rules Demo](https://via.placeholder.com/800x200.png?text=规则可视化展示图) <!-- 可替换为实际示意图 -->

## 🌟 核心特性

- 🚀 ​**双协议支持**​：Domain 与 IP-CIDR 规则分离处理
- ⚡ ​**实时更新**​：GitHub Actions 每日自动校验 & 转换
- 📦 ​**开箱即用**​：预生成 `.mrs` 文件，兼容主流代理客户端
- 🛠️ ​**透明流程**​：[开放转换脚本](https://github.com/yourname/yourrepo/tree/main/scripts)

## 📂 文件结构

```bash
rules/
├── src/                  # 原始规则文件（人工维护）
│   ├── domains.yaml      # 域名规则模板
│   └── ips.yaml          # IP-CIDR规则模板
├── mrs/                  # 自动生成的规则文件
│   ├── domains.mrs
│   └── ips.mrs
└── conversion.log        # 转换日志
