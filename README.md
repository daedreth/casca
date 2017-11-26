# casca

Over the time I spent with gentoo I noticed how some software is simply missing from the official repository.

Other ebuilds simply do not work as desired, I'm here to fix that.

So there we go, a new tiny overlay.


## Package list

This is most likely going to grow out of proportion, but I'd like to provide a reasoning for each ebuild.

**grub-customizer**-*4.0.6*: It's simply missing from the official repository, no idea why.


## How do I use this?  

Create the following directory if it doesn't exist yet.
    
    # mkdir -p /etc/portage/repos.conf

Configure the repository:  


    # edit /etc/portage/repos.conf/casca.conf with your favorite editor
    [casca]
    location = /usr/local/casca
    sync-type = git
    sync-uri = https://github.com/daedreth/casca.git
    auto-sync = yes  

Save the file and close it.

## Manual sync

    $ emaint sync -r casca

## Automatic sync

Every time you run `emerge --sync` or something similar in effect, casca will be updated automagically.

    $ emerge --sync

## Troubleshooting

something something no warranty something something, if an ebuild broke simply open an issue, I'll deal with it.

