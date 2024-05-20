version: '2.1'
networks:
  iopex_network:
    external: true
services: 
   opexwiseui:     
   image: balasubramaniyan/opexwiseui_dev.17
    restart: on-failure:5
    networks:
      - iopex_network
    hostname: opexwiseui
    healthcheck:
      test: pgrep -f nginx || exit 1
      interval: 10m
      timeout: 10s
      retries: 3
