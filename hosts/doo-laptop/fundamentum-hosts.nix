{lib, ...}: let
  inherit (lib.strings) concatStringsSep;
  hosts = [
    "business-unit.fundamentum.test"
    "devices-oauth.fundamentum.test"
    "registration.fundamentum.test"
    "devices-gateway.fundamentum.test"
    "hub.fundamentum.test"
    "hub-gateway.fundamentum.test"
    "oauth.fundamentum.test"
    "positioning.fundamentum.test"
    "provisioning.fundamentum.test"
    "states.fundamentum.test"
    "mqtt.fundamentum.test"
    "pubsub-bridge-adapter.fundamentum.test"
    "spatium.fundamentum.test"
    "spatium-gateway.fundamentum.test"
    "spatium-service.fundamentum.test"
    "transactions.fundamentum.test"
    "p-laval-app.fundamentum.test"
    "laval-panel-mock.fundamentum.test"
    "actions.fundamentum.test"
    "panels.fundamentum.test"
    "poseidon-database.fundamentum.test"
  ];
  ipv4 = map (h: "127.0.0.1 ${h}") hosts;
  ipv6 = map (h: "::1 ${h}") hosts;
  all = ipv4 ++ ipv6;
  extraHosts = concatStringsSep "\n" all;
in {
  networking.extraHosts = extraHosts;
}
