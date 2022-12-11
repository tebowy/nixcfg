{
  config,
  pkgs,
  ...
}: {
  services.resolved.enable = true;
  services.resolved.fallbackDns = ["76.76.2.107"];
  services.resolved.extraConfig = ''
    DNS=76.76.2.22#1w0hc3rgti3-sapporo.dns.controld.com
    DNSOverTLS=yes
  '';

  #MulticastDNS=true
}
