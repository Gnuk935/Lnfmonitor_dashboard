# LnfMonitor Dashboard

<div align="center">

**Monitore CPU, memória, rede e processos em tempo real com um dashboard moderno e simples.**

[![GitHub release](https://img.shields.io/github/v/release/AllonsoHenzo/Lnfmonitor_dashboard?include_prereleases&color=blue&label=release)](https://github.com/AllonsoHenzo/Lnfmonitor_dashboard/releases/tag/v0.1.0)
[![GitHub issues](https://img.shields.io/github/issues/AllonsoHenzo/Lnfmonitor_dashboard)](https://github.com/AllonsoHenzo/Lnfmonitor_dashboard/issues)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](./LICENSE)
[![Debian](https://img.shields.io/badge/Debian-Ubuntu-red?logo=debian)]()
[![Windows](https://img.shields.io/badge/Windows-Coming%20Soon-blue?logo=windows)]()

<p align="right">🌐 <strong>Português (BR)</strong> • <a href="./README_en.md">English</a></p>
</div>

---

## Sobre o projeto

O **LnfMonitor Dashboard** é uma aplicação desktop feita em **Node.js + React** que fornece uma visão clara do uso de recursos do sistema:

-  Uso da **CPU** em tempo real  
-  Consumo de **memória RAM**  
-  Monitoramento de **rede (upload/download)**  
-  Tabela de **processos ativos**  

Atualmente disponível como pacote **.deb** para Debian/Ubuntu, mas em breve também terá suporte para **Windows** e outras distribuições Linux.

---

## Instalação

### Debian/Ubuntu
1. Baixe o último release 👉 [**v0.1.0**](https://github.com/AllonsoHenzo/Lnfmonitor_dashboard/releases/tag/v0.1.0).
2. Instale o pacote `.deb`:

```bash
sudo dpkg -i lnfmonitor-dashboard_0.1.0_amd64.deb
sudo apt-get install -f   # corrige dependências, se necessário
```

3. Execute:

```bash
lnfmonitor
```

> Testado no **Debian 12/13** e **Ubuntu 22.04+** (derivados devem funcionar também).

## Container

Você pode executar o **Lnfmonitor Dashboard** facilmente via **Podman** ou **Docker**.

<details>
<summary>Usando Podman</summary>

1. Inicie o container:

```bash
podman run -it --rm \
  --user root \
  --network host \
  --pid=host \
  --uts=host \
  --ipc=host \
  --volume /:/host-root:rw \
  --volume /proc:/proc:rw \
  --volume /sys:/sys:rw \
  --volume /dev:/dev:rw \
  docker.io/barros935/lnfmonitor:latest
````

2. Acesse a interface em:
   👉 [http://localhost:3000](http://localhost:3000)

> 💡 Para rodar em **background**, adicione a flag `-d`.

</details>

<details>
<summary>Usando Docker</summary>

#### Modo Standalone

1. Inicie o container:

```bash
docker run -it --rm \
  --user root \
  --network host \
  --pid=host \
  --uts=host \
  --ipc=host \
  --volume /:/host-root:rw \
  --volume /proc:/proc:rw \
  --volume /sys:/sys:rw \
  --volume /dev:/dev:rw \
  barros935/lnfmonitor:latest
```

2. Acesse a interface em:
   👉 [http://localhost:3000](http://localhost:3000)

</details>

<details>
<summary>Usando Compose</summary>

Arquivos prontos de **Compose** estão disponíveis em [`./compose`](./compose).

#### Docker Compose

Suba com:

```bash
docker compose -f ./compose/docker-compose.yml up -d
```

#### Podman Compose

Suba com:

```bash
podman-compose -f ./compose/podman-compose.yml up -d
```

</details>

---

📌 Após subir o container (via `run` ou `compose`), a interface estará disponível em:
👉 [http://localhost:3000](http://localhost:3000)

## Configuração

O **frontend** utiliza uma variável de ambiente para definir a URL do servidor de métricas.  
Caso esteja rodando a aplicação clonada do repositório (e não via `.deb`), crie um arquivo `.env` na raiz do projeto com:

```env
VITE_API_URL=http://localhost:3000
```

- `VITE_API_URL` → endereço onde o backend está rodando (padrão: `http://localhost:3000`)  
- Altere para o IP do seu servidor ou hostname, se quiser acessar remotamente (ex.: `http://192.168.0.20:3000`)  

> Se instalar via `.deb`, essa configuração já vem ajustada para rodar localmente sem necessidade de editar o `.env`.

---

## Preview

<div align="center">
  
![LnfMonitor_Screenshot](https://github.com/user-attachments/assets/4d9d7ff6-b5ca-474c-83c5-a2b2a86fc557)

</div>

---

## Stack

- **Frontend:** React + Vite + TailwindCSS  
- **Gráficos & UI:** Customizado 
- **Backend:** Node.js

---

## Contribuindo

Contribuições são super bem-vindas!  
- Abra uma **issue** com bugs/ideias  
- Envie um **PR** (especialmente para empacotamento Windows/AppImage/RPM/Arch)  

Guia rápido:
1. Fork → branch → commit → PR
2. Descreva claramente a mudança e como testar

---

## Licença

Este projeto está sob a licença **MIT** – veja [LICENSE](./LICENSE).

---

<div align="center">



Se curtiu o projeto, deixe uma ⭐ no repositório!  
Dúvidas/ideias? Abra uma [issue](https://github.com/AllonsoHenzo/Lnfmonitor_dashboard/issues).

</div>
