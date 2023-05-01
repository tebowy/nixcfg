{pkgs, ...}: {
  systemd.user = {
    services.rclone = {
      Unit.Description = "Backup and sync daemon";
      Install.WantedBy = ["default.target"];
      Install.Requires = ["NetworkManager"];
      Service = {
        Type = "simple";
        ExecStart = ''
          ${pkgs.rclone}/bin/rclone mount drive-app: /mnt/remote/ \
                --allow-non-empty \
                --allow-other \
                --drive-skip-gdocs \
                --umask 2 \
                --vfs-cache-mode full \
                --buffer-size 128M \
                --vfs-read-chunk-size 128M \
                --vfs-read-chunk-size-limit off \
                --vfs-cache-max-size 50Gi \
                --drive-chunk-size=64M \
                --drive-pacer-min-sleep=10ms \
                --drive-pacer-burst=1000 \
                --cache-chunk-no-memory \
                --no-modtime \
                --use-mmap \
                --cache-dir "/mnt/data/.rclone-cache" \
                --log-level NOTICE \
                --log-file /home/anon/.config/rclone/logs/rclone.log
        '';
        Environment = "PATH=/run/wrappers/bin/:$PATH";
        Restart = "always";
        RestartSec = 1;
      };
    };
  };
}
