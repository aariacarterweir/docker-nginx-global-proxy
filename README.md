# docker-nginx-global-proxy
Easy way to keep your system-wide jwilder/nginx-proxy up and running

## Installation
- Run `yarn add docker-nginx-global-proxy`
- And files will be added to your node_modules/.bin path

## Commands
- `yarn docker-nginx-global-proxy-up`
- `yarn docker-nginx-global-proxy-down`

## Notes
- Creates a network called nginx-proxy
- And a container named nginx-proxy

### Todo
- Make it work using docker-compose.yml instead of cmd line docker run
