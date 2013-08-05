chef-repo for CakePHP starters
=========

An experimental chef-repo repository for CakePHP study. This chef-repo includes mimimum chef recipes, composer.json and vagrant file to try CakePHP without any configuration.

To start the tour, install VirtualBox and Vagrant first and then prepare cookbooks with berkshelf:

    bundle install
    berks install
    berks install --path=cookbooks
    
Now you're ready to launch the vm.

    vagrant up

You'd see long output while some magic happens. Take your coffee for a while and once you confirm the process successfully finished, go to:

    http://localhost:8080

with your favorite browser. However this repo is still on develop and you only can see nasty Cake warnings now :P

To forget everything and start a new life, use

    vagrant destroy
    
to reset the world.

To develop the recipes, instead of 'vagrant up',

    knife solo cook -r cakephp vagrant@192.168.33.10

should work to check how your modification affects the VM setup.
