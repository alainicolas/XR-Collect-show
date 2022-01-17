testbed:
  name: NXOS
  credentials:
    default:
      username: usernameXR
      password: passwordXR

devices:
  vps:
    os: linux
    type: linux
    credentials:
      default:
        username: anicolas
    connections:
      cli:
        protocol: ssh
        ip: Rebound-Server
{% for ip, id in list_ip_id %}
  NXOS_{{id}}:
    type: router
    os: nxos
    connections:
      vty:
        protocol: ssh
        ip: {{ip}}
        settings:
          GRACEFUL_DISCONNECT_WAIT_SEC: 0
          POST_DISCONNECT_WAIT_SEC: 0
          EXEC_TIMEOUT: 120
          CONFIG_TIMEOUT: 120
        port: 22
        proxy:
            - device: vps
{% endfor %}
