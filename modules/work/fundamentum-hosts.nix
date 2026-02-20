{
  flake.modules.nixos.work =
    { lib, ... }:
    let
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
        "resfab-cloud.fundamentum.test"
        "parknet-adapter.fundamentum.test"
        "scms-api-gateway.fundamentum.test"
        "otel-collector.fundamentum.test"
        "prometheus.fundamentum.test"
        "grafana.fundamentum.test"
      ];
      ipv4 = map (h: "127.0.0.1 ${h}") hosts;
      ipv6 = map (h: "::1 ${h}") hosts;
      all = ipv4 ++ ipv6;
      extraHosts = concatStringsSep "\n" all;
    in
    {
      networking.extraHosts = extraHosts;
      security.pki.certificates = [
        ''
          mqtt.fundamentum.test
          =========
          -----BEGIN CERTIFICATE-----
          MIIF9TCCA92gAwIBAgIUKtbwPTbhhU2BolWwJ9RHNI6ZwuYwDQYJKoZIhvcNAQEL
          BQAwgYkxCzAJBgNVBAYTAkNBMQ8wDQYDVQQIDAZRdWViZWMxDzANBgNVBAcMBlF1
          ZWJlYzEMMAoGA1UECgwDZG9vMQwwCgYDVQQLDANkb28xHjAcBgNVBAMMFW1xdHQu
          ZnVuZGFtZW50dW0udGVzdDEcMBoGCSqGSIb3DQEJARYNZG9vQGdtYWlsLmNvbTAe
          Fw0yMzEyMTUxOTU5MDdaFw0zMzEyMTIxOTU5MDdaMIGJMQswCQYDVQQGEwJDQTEP
          MA0GA1UECAwGUXVlYmVjMQ8wDQYDVQQHDAZRdWViZWMxDDAKBgNVBAoMA2RvbzEM
          MAoGA1UECwwDZG9vMR4wHAYDVQQDDBVtcXR0LmZ1bmRhbWVudHVtLnRlc3QxHDAa
          BgkqhkiG9w0BCQEWDWRvb0BnbWFpbC5jb20wggIiMA0GCSqGSIb3DQEBAQUAA4IC
          DwAwggIKAoICAQDp4UWMeEI5b7JiArSdl+zau+zZzcKj+DldbXDHafFzKAYMwzHk
          KO9E+dZCjjKyrMY/icgMLxBXg7/clTquip3omS2AKDX0dVAGNKnDbFA1WC12kueS
          3dSuhVdgZJwD3yhVmor/eQL10WvdLVrB0r0HecKkIlHGZ7VaX34yZDQu/151GWM7
          JT9pp5Zr6VoAd4oArekfKni+akaeNjiBWj/yzoJPAWxj+K84icJBi+4FhyT6Okw2
          kBWGCsc2Ne4mPLcHed1oOOWQqIpU4P4h5o7X+U5VDtleLQn/8RusuF5E7E6NNybW
          C8C1wPrF9a1vE7fCbYHpYxgyTe5JZ8dtQnrELDVKb0yABoxUChOjkgIozfMe6PcH
          DkNnRsRHSTB02IWINpwGDKEHrLHjuKWN9HyO6ksMLoOWMf6fpxMwekPCSGU1lGUL
          0JJtAlSbH3LvgfMcjwTaSbvVLQ6cMCc0KprYp97nhXnk+31ak3URfiz9Gd38d/57
          2YdLfirYeeDQU9n1BKGw1ujq54WNi7+SNCLnuc2B78pYyBsKaqBlyeyA34kepQ2X
          +agstnLMzjiEHr3mqOEnnrbOA90iLKBLRZJmg+rOBsysSYWrLZspWfSg8Ldco30O
          5RxT4Hl9aGWsQF2Zjkn6uo0YAylJxatPVYIYX8pQgfzQlFdBqi2gs3V/FQIDAQAB
          o1MwUTAdBgNVHQ4EFgQU7S4Y/1fh1Em4CqT+5DLRhIP+khYwHwYDVR0jBBgwFoAU
          7S4Y/1fh1Em4CqT+5DLRhIP+khYwDwYDVR0TAQH/BAUwAwEB/zANBgkqhkiG9w0B
          AQsFAAOCAgEA59fx6+lO7T38S+oFWmDRmOdcgEAVO1leumoluBg7oFF8L7saN0CJ
          6ozqfBqzqOYpLVALCVMAW5cQLirccJjwNpXVYmlQV9O21wM4nGuRMvEUHCmdbDdW
          bIsFo1pCTw/4YMvV/T8KA/99iY/8y1nYrsCs7xoPSsP37Twsk62hqcRbbcyWlv7O
          eCrcrnfV1dhMPVgMa8pDliHY2pdqnVTqaESzbcC/KX1fN+LzmiwMv9GrDo3yXo/l
          pPlmYSTUXbap5wmZa+y7SKyOdsG+iQuMjLw7B6dNAfOGeEpgEs5awdrYSd49q0Wt
          /TWWdNy+Wuu7KFYBNxWpz2bpjw5g6yZ3qhRUMIJqCh1ZpEfrjgtWN/DGiM6+VQ61
          4izqaX7N024YGaaSYz/qpyvz654bhR9UqmipxkHlOs3/YsT60/clf1w8ES2Jswmw
          OHpW8Hv4aLjHTCcf95URu6QRQB12Buio36UK0OowmOQgGUxKKPgWJA1gB9quJrn+
          ThhE4slbxwK/n57U5WPfYJg0TaKdnKYnasErTKhYSMjpxZcwn4lZZSpfmGzKtPXR
          jsgxRkhjcFtkqzlJQZKuU9iEw56jIelQ5x2MSes+tQ8LnIThqt2X/zp7MZXoLkZv
          ZWNH6tAyCqo/SSxPL5Lmm1bdYBi0UD1ILy5FPV/SNMt+1MT1zld1zP0=
          -----END CERTIFICATE-----
        ''
      ];
    };
}
