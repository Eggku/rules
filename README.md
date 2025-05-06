

📌 Mihomo/Clash 规则整理

<p align="center">
  <img src="https://img.shields.io/github/repo-size/Eggku/rules?style=flat-square" alt="Repo Size">
  <img src="https://img.shields.io/github/stars/Eggku/rules?style=flat-square" alt="Stars">
  <img src="https://img.shields.io/github/forks/Eggku/rules?style=flat-square" alt="Forks">
  <img src="https://img.shields.io/github/license/Eggku/rules?style=flat-square" alt="License">
</p>

🔍 Mihomo/Clash 征集日常使用未被cn_domain（国内）或 geolocation-!cn（国外）收录的规则集，帮助您更精准地管理代理/直连设置。

🚀 核心规则文件作用

🔥 domain-direct.mrs
国内域名直连

🎨 domain-proxy.mrs
国外域名代理

🚀 ip-direct.mrs
国内 IP 直连

⚡ ip-proxy.mrs
国内 IP 代理

📦 Domain 规则示例
```yaml
payload:
  - "example.com"          # 普通域名
  - "+.google.com"         # 通配域名
  - "facebook.com"         # 根域名
  - "+.fbcdn.net"          # 多子域名通配
  - "api.openai.com"       # 指定子域名
```

💻 IPcidr 规则示例
```yaml
payload:
  - 8.8.8.8/32          # 单个 IP
  - 1.1.1.0/24          # 整个子网
  - 192.168.0.0/16      # 本地内网
  - 10.0.0.1/32         # 内网设备
  - 123.45.67.0/24      # 某地区出口 IP
```
🚀 Mihomo 域名&IP常规配置
  ```yaml
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
```
🚀 Mihomo 域名&IP锚点配置
```yaml
rule-providers: 
  domain-direct: { <<: *DomainMrs, url: "https://raw.githubusercontent.com/Eggku/rules/main/domain-direct.mrs" }
  domain-proxy:  { <<: *DomainMrs, url: "https://raw.githubusercontent.com/Eggku/rules/main/domain-proxy.mrs" }
  ip-direct:     { <<: *ipcidrMrs, url: "https://raw.githubusercontent.com/Eggku/rules/main/ip-direct.mrs" }
  ip-proxy:      { <<: *ipcidrMrs, url: "https://raw.githubusercontent.com/Eggku/rules/main/ip-proxy.mrs" }
```
🤝 规则应用
```yaml
rules:
  - RULE-SET,domain-direct,direct
  - RULE-SET,domain-proxy,proxy
  - RULE-SET,ip-direct,direct,no-resolve
  - RULE-SET,ip-proxy,proxy,no-resolve
```
📜 许可证

该项目采用 MIT 许可证 - 详细信息请查看 LICENSE 文件。

📞 联系

📧 Email: example@example.com  
🌐 项目主页: your-project.com (https://your-project.com/)  
