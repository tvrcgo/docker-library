# v2ray VMess

- 默认开放 8899 端口，如果在容器实例中运行，注意映射端口
- alterId = 0，否则会报 io timeout 错误
- 域名证书支持泛域名
- 域名验证是调用阿里云的 API，其它要修改 acme.sh 中的 --dns 参数和环境变量名
