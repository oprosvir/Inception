# Inception
```
FINAL GRADE: ---/100
```
## 📖 Overview

**Inception** implements a Dockerized **LEMP stack** (Linux, NGINX, MariaDB, PHP‑FPM) with WordPress as the main application. Each service runs in its own container, connected through a dedicated Docker network, with persistent volumes for data. Optional bonus services extend the stack with tools for database management, caching and file transfer. 

*This project was developed and tested on **Manjaro (Arch Linux) with the Xfce desktop environment**. It is compatible with Linux-based virtual machines and WSL environments.*

### ⚙️ Mandatory Services

The core infrastructure includes:

- **NGINX** configured with TLS as the single entrypoint
- **WordPress (php‑fpm)** connected to MariaDB
- **MariaDB** database backend with persistent volume

All containers are based on **Debian Bookworm**, the penultimate stable release at the time of development, and are configured to automatically restart on failure.
 
### ✨ Bonus Services

- ✅**Adminer** – web UI for managing the MariaDB database
- **Redis** – caching layer to optimize WordPress performance
- **FTP server** – for direct access to WordPress volume
- ✅**Static website** – a lightweight personal webpage served through Python’s built-in HTTP server
- **Custom service** – personal choice with Dockerfile and integration

## 📂 Project Structure

```
Inception/
├── Makefile
└── srcs/
    ├── docker-compose.yml
    ├── .env
    └── requirements/
        ├── bonus/
        ├── mariadb/
        ├── nginx/
        └── wordpress/
```

⚠️ The `.env` file should be stored locally on the virtual machine. During the `make setup` process, it will be automatically copied from the system path (`/var/inception/.env`).

## 📦 Usage

```bash
# Build and run all containers
git clone https://github.com/oprosvir/Inception.git
cd Inception
make

# Stop and remove everything
make fclean
```

The site will be available at:

```
https://oprosvir.42.fr
```

---

**Note:** This project is fully self-contained and built without using prebuilt DockerHub images (except for Debian Bookworm).


