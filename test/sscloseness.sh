curl -X POST -H "Content-Type: application/json" -d '{
  "algorithm": "SSCloseness",
  "local": true,
  "instances": 1,
  "bulk": "singlet",
  "vars": ["ProfileofeliacervantesCommunity10545"],
  "engines": [
    {"server-ip": "127.0.0.1", "server-port": 9000}
  ],
  "graph": {
    "tag": "Profile",
    "host": "http://spribo2.sb01.stations.graphenedb.com/",
    "port": 24789,
    "user": "spribo2",
    "password": "6e0mtjm8OEgoSRpjNhii"
  }
}' http://localhost:9595/control/compute
