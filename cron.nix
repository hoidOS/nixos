{ config, pkgs, ... }:
{
  services = {
    # Enable cron service
    cron = {
      enable = true;
      systemCronJobs = [
        # "SHELL=/bin/sh"
        # "*/1 * * * *      oedon    date >> /home/oedon/test"
        # "*/15 * * * *       oedon    rclone copy /home/oedon/Documents linode:oedon/Documents"
        # "0 19 * * *         oedon    /home/oedon/go/bin/ctb"
      ];
    };
  };
}
