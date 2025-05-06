以下是优化后的 GitHub README，确保 格式美观、图标扁平化，并提升 可读性 与 结构化：

📌 Mihomo/Clash 规则整理

<p align="center">
  <img src="https://img.shields.io/github/repo-size/Eggku/rules?style=flat-square" alt="Repo Size">
  <img src="https://img.shields.io/github/stars/Eggku/rules?style=flat-square" alt="Stars">
  <img src="https://img.shields.io/github/forks/Eggku/rules?style=flat-square" alt="Forks">
  <img src="https://img.shields.io/github/license/Eggku/rules?style=flat-square" alt="License">
</p>

🔍 Mihomo/Clash 未被 cn_domain（国内）或 geolocation-!cn（国外）收录的规则集，帮助您更精准地管理 代理 / 直连 设置。

🚀 核心规则文件



规则文件
作用




🔥 domain-direct.mrs
国内域名直连


🎨 domain-proxy.mrs
国外域名代理


🚀 ip-direct.mrs
国内 IP 直连


⚡ ip-proxy.mrs
国内 IP 代理




📦 Domain 规则示例
```yara
payload:
  - "example.com"          # 普通域名
  - "+.google.com"         # 通配域名
  - "facebook.com"         # 根域名
  - "+.fbcdn.net"          # 多子域名通配
  - "api.openai.com"       # 指定子域名
```

💻 IPcidr 规则示例
```yacas
payload:
  - 8.8.8.8/32          # 单个 IP
  - 1.1.1.0/24          # 整个子网
  - 192.168.0.0/16      # 本地内网
  - 10.0.0.1/32         # 内网设备
  - 123.45.67.0/24      # 某地区出口 IP
```

🚀 Mihomo 规则使用方法
rule-providers: 
  domain-direct:
    type: http
    behavior: domain
    format: mrs
    path: ./rules/domain-direct.mrs
    url: "https://raw.githubusercontent.com/Eggku/rules/main/domain-direct.mrs"
    interval: 86400

  domain-proxy:
    type: http
    behavior: domain
    format: mrs
    path: ./rules/domain-proxy.mrs"
    url: "https://raw.githubusercontent.com/Eggku/rules/main/domain-proxy.mrs"
    interval: 86400

  ip-direct:
    type: http
    behavior: ipcidr
    format: mrs
    path: ./rules/ip-direct.mrs"
    url: "https://raw.githubusercontent.com/Eggku/rules/main/ip-direct.mrs"
    interval: 86400

  ip-proxy:
    type: http
    behavior: ipcidr
    format: mrs
    path: ./rules/ip-proxy.mrs"
    url: "https://raw.githubusercontent.com/Eggku/rules/main/ip-proxy.mrs"
    interval: 86400


🛠 域名 & IP 锚点配置
rule-providers: 
  domain-direct: { <<: *DomainMrs, url: "https://raw.githubusercontent.com/Eggku/rules/main/domain-direct.mrs" }
  domain-proxy:  { <<: *DomainMrs, url: "https://raw.githubusercontent.com/Eggku/rules/main/domain-proxy.mrs" }
  ip-direct:     { <<: *ipcidrMrs, url: "https://raw.githubusercontent.com/Eggku/rules/main/ip-direct.mrs" }
  ip-proxy:      { <<: *ipcidrMrs, url: "https://raw.githubusercontent.com/Eggku/rules/main/ip-proxy.mrs" }


🤝 规则应用
rules:
  - RULE-SET,domain-direct,direct
  - RULE-SET,domain-proxy,proxy
  - RULE-SET,ip-direct,direct,no-resolve
  - RULE-SET,ip-proxy,proxy,no-resolve


📜 许可证

该项目采用 MIT 许可证 - 详细信息请查看 LICENSE 文件。

📞 联系

📧 Email: example@example.com  
🌐 项目主页: your-project.com (https://your-project.com/)  


🎯 优化点

 ✅ 图标扁平化（使用 flat-square 风格）
 ✅ 结构美观（采用表格 + 代码块格式）
 ✅ 清晰的 YAML 代码格式
 ✅ 减少不必要的空格


现在你的 README.md 既 专业 也 美观！如果有其他需求，欢迎交流 😊
