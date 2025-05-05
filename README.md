# 🌐 Smart Rule Repository | 智能规则库

![Auto Update](https://img.shields.io/badge/dynamic/json?color=blue&label=自动更新&query=status&url=https://api.yourdomain.com/version) 
![Total Rules](https://img.shields.io/badge/规则总数-5K%2B-brightgreen) 
![License](https://img.shields.io/badge/license-Apache%202.0-green)

> 🚀 专为Mihomo/Clash设计的智能规则库，每日自动编译更新  
> 📆 最后更新：![Last Commit](https://img.shields.io/github/last-commit/yourname/yourrepo/main)

<div align="center">
  <img src="https://via.placeholder.com/800x300.png?text=规则拓扑示意图" width="80%">
</div>

## 📦 快速接入

域名示例格式：
payload:
  - "example.com"          # 普通域名
  - "+.google.com"         # 通配域名
  - "facebook.com"         # 根域名
  - "+.fbcdn.net"             # 多子域名通配
  - "api.openai.com"       # 指定子域名

    ip示例格式：
payload:
  - 162.244.34.0/24
  - 178.249.213.0/24

使用示例
# 在Clash配置文件中添加如下内容
rule-providers:
  # 域名规则集
  domain-rules:
    type: http
    behavior: domain
    url: "https://fastly.jsdelivr.net/gh/yourname/yourrepo@master/rules/mrs/domains.mrs"
    interval: 86400  # 24小时更新
  
  # IP-CIDR规则集  
  ipcidr-rules:
    type: http
    behavior: ipcidr
    url: "https://fastly.jsdelivr.net/gh/yourname/yourrepo@master/rules/mrs/ips.mrs"
    interval: 43200  # 12小时更新

rules:
  - RULE-SET,domain-rules,🚀 代理策略
  - RULE-SET,ipcidr-rules,🎯 直连策略
