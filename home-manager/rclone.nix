{ pkgs,  ... }: 

{
	systemd.user = {
		services.rclone = {
			Unit.Description = "Backup and sync daemon";
			Install.WantedBy = [ "default.target" ];
			Install.Requires = [ "NetworkManager" ];
			Service = {
				Type = "simple";
				ExecStart = ''
${pkgs.rclone}/bin/rclone mount drive-app: /mnt/remote/ \
      --allow-non-empty \
      --allow-other \
      --umask 2 \
      --vfs-cache-mode full \
      --buffer-size 128M \
      --dir-cache-time 72h \
      --timeout 1h \
      --vfs-read-chunk-size 128M \
      --vfs-read-chunk-size-limit off \
      --cache-chunk-no-memory \
      --no-modtime \
      --use-mmap \
      --log-level NOTICE \
      --log-file /home/anon/.config/rclone/logs/rclone.log
''
;
				Environment = "PATH=/run/wrappers/bin/:$PATH";
				Restart = "always";
				RestartSec = 1;
			};
		};
	};
}



