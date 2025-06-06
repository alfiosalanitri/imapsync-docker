# imapsync-docker

🛠️ A minimal Docker image to synchronize emails between two IMAP mailboxes using `imapsync`.

Published on GitHub Container Registry:  
👉 `ghcr.io/alfiosalanitri/imapsync-docker`

---

## 🚀 Features

- Based on Alpine for a lightweight image
- Includes imapsync and required dependencies
- Simple `.env`-based configuration
- Ready for CI/CD with versioned tags

---

## 📦 Usage

```bash
cp .env.example .env
```

2. **Edit `.env` with your mailbox credentials**:

```ini
USER_1=user@host1.it
PASSWORD_1=yourpassword
HOST_1=imap.host1.it
SSL_1=yes

USER_2=user@host2.it
PASSWORD_2=yourpassword
HOST_2=imap.host2.it
SSL_2=yes
```

| Variable     | Required | Description                           |
| ------------ | -------- | ------------------------------------- |
| `HOST_1`     | ✅        | Source IMAP server hostname or IP     |
| `USER_1`     | ✅        | Source mailbox login                  |
| `PASSWORD_1` | ✅        | Source mailbox password               |
| `SSL_1`      | ❌        | Set to `yes` to enable SSL for source |
| `HOST_2`     | ✅        | Target IMAP server hostname or IP     |
| `USER_2`     | ✅        | Target mailbox login                  |
| `PASSWORD_2` | ✅        | Target mailbox password               |
| `SSL_2`      | ❌        | Set to `yes` to enable SSL for target |


3. **Run**:

```bash
docker run --rm --env-file .env ghcr.io/alfiosalanitri/imapsync-docker:latest
```

### 📝 Usage Notes

When running on Arch Linux with rootless Docker, hostname resolution (e.g. mail.example.com) may not work due to systemd-resolved or DNS configuration in the user namespace.

✅ As a workaround, use the server’s IP address instead of its DNS name in HOST_1 and HOST_2.

---

## 🛠️ Build Locally 

```bash
docker build -t imapsync-docker .
docker run --rm --env-file .env imapsync-docker
```

---

> Recommended for production use.

---

## 🧬 Release Workflow

1. Commit your changes.
2. Run the release script with a semver tag:

```bash
./release.sh v1.0.0
```

This will:
- Commit (if needed)
- Tag the commit
- Push the tag
- Trigger GitHub Actions to publish the image as:
  - `ghcr.io/alfiosalanitri/imapsync-docker:v1.0.0`
  - `...:latest`

---

## 📁 Files

- `Dockerfile`: Builds the imapsync container.
- `entrypoint.sh`: Sync logic.
- `.env.example`: Example env file.
- `release.sh`: Automates release & tagging.
- `.github/workflows/publish.yml`: Publishes images to GHCR.

---

## 🔐 Security Notes

Never commit your .env file.

For production use, consider using Docker secrets or environment injection tools.

---

## 🛠 Built With

[imapsync](https://imapsync.lamiral.info/) – IMAP synchronization utility

[Alpine Linux](https://alpinelinux.org/) – small base image

[Docker Compose](https://docs.docker.com/compose/) – simple orchestration

---

## 📜 License

This project is licensed under the MIT License — see the [LICENSE](./LICENSE) file for details.

---

## 🤝 Contributing

Feel free to open issues or submit pull requests to improve functionality, automation, or performance.

---

## 💡 Inspiration

Originally created to simplify email migrations and backups for developers and sysadmins using Docker.