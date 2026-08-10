{
  flake.modules.nixos.work = {
    boot.kernelModules = [ "br_netfilter" ];
    boot.kernel.sysctl."net.bridge.bridge-nf-call-iptables" = 0;
  };
}
