
# Self-hosted Github Actions Runner

更新 `docker-compose.yml` 文件中两个环境变量的值：

- `REPO`: 创建 self-hosted runner 的仓库 URL，如 `https://github.com/tvrcgo/pika-boilerplate`
- `TOKEN`: runner 鉴权用的 token，在 `仓库-Settings-Actions` 下 Add Runner 时会提供

第一次构建镜像并启动容器

```bash
docker-compose up --build -d
```

再次启动容器

```bash
docker start actions-runner
```

如果环境变量有更新，需要重新创建容器运行

```bash
docker-compose up -d
```
