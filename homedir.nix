{
  environment.etc.fablab = {
    source = ./home;
  };
  system.activationScripts.script.text = ''
    cp -r /etc/fablab/ /home
    chown -R fablab:users /home/fablab
    chmod -R u+w /home/fablab
  '';
}
