# casca

Over the time I spent with gentoo I noticed how some software is simply missing from the official repository.

Other ebuilds simply do not work as desired, I'm here to fix that.

So there we go, a new tiny overlay.


## Packages

This is most likely going to grow out of proportions, but I'd like to provide a reasoning for each ebuild.

# Package list


## Explanation

* The bold text is the category the ebuild belongs to.
* The regular text is the package name.
* The italic text is the ebuild version. Note that *9999* stands for bleeding edge, mostly referring to latest commits.
* The [STABLE] and [TESTING] labels refer to the state of the software, I apply them to my best knowledge and with your interest in mind.
* What follows is a short description/reasoning for the ebuilds existence.
* Most importantly, the short tags in front of the package name refer to the reasoning for the ebuild in short, it goes as follows:
  * [M] stands for "missing", as in it is not present in the official portage tree.
  * [B] stands for "bump" and mostly indicates a small version bump due to a critical issue/feature being added.
  * [O] stands for "outdated" and is reserved for ebuilds which are big updates over the official repository.
  * [S] stands for "strange" I guess. Mostly less known software.
  * [D] stands for an ebuild that was "deleted", just to make sure you can still use it from here.
  * [WTF] is a tag that will be used to mark ebuilds that work, as opposed to official ones, or fix huge issues, or do something specific, I'll be elaborating on those in the description.

## Packages

* **app-admin**
  * **[M]** grub-customizer-*4.0.6*: [STABLE] It's simply missing from the official repository, no idea why.
  * **[M][B]** grub-customizer-*5.0.6*: [TESTING] Bumped version to newest release.

* **media-sound**
  * **[M]** musikcube-*0.61.0*: [STABLE] A cross-platform, terminal-based music player, audio engine, metadata indexer, and server in c++. Missing from the official repositories.
  * **[M]** cava-*0.6.1*: [STABLE] Console-based Audio Visualizer for Alsa. Missing from the official repositories.

* **net-im**
  * **[B]** discord-bin-*0.0.3*: [STABLE] Previous discord binary.
  * **[B]** discord-bin-*0.0.4*: [STABLE] Previous discord binary.
  * **[B]** discord-bin-*0.0.5*: [STABLE] An up to date discord binary.


  * **[M]** discord-canary-bin-*0.0.31*: [TESTING] An up to date discord-canary binary. Missing from the official repo.

* **x11-libs**
  * **[M]** vte-ng-*0.44.1.9999*: [STABLE] It's a patched version that works with termite, has to be here.

* **x11-misc**
  * **[B]** sxhkd-*9999*: [TESTING] Bleeding edge sxhkd ebuild.
  * **[M]** lemonbar-*1.3*: [STABLE] Missing from the official repository.

* **x11-plugins**
  * **[M][S]** purple-discord-*9999*: [TESTING] A nifty plugin for pidgin, not in the main repo.

* **x11-terms**
  * **[B]** st-*9999*: [TESTING] Latest commit of the suckless terminal.

  * **[M][WTF]** termite-*12*: [STABLE] Getting termite to compile is a pain, but not anymore. I understand why it's not in the tree.

  * **[O]** tilda-*1.3.3*: [STABLE] The version from the gentoo repo is very outdated and lacks a lot of options.

* **x11-wm**
  * **[B]** bspwm-*9999*: [TESTING] Bleeding edge bspwm ebuild.


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

If this behaviour is for some reason undesireable, you can always change the `auto-sync` property to `no` in the /etc/portage/repos.conf/casca.conf file


## FAQ

*Are overlays dangerous?*

Generally, no. If one of the packages breaks you won't find support on the official irc channel, thats about it.

*Why should I add and use this one over the others?*

You tell me. In general more well known overlays are meant to have specific uses and packages out of a single "family", if you will.
For instance, the qt overlay, providing the latest versions of the framework. The aim of this is to gradually add ebuilds for whatever the default gentoo portage tree lacks, the moment it's up to date, I'll be deleting the ebuild from here as to not unnecessarily interfere with the portage ecosystem.

*Can you add ${PACKAGE}?*

Sure, open an issue if you noticed that something is missing from the official tree or that it's outdated. I'll handle that.

*Every emerge I do portage complains about wrong filesize, what do?*

Open an issue, or find me on freenode and tell me which file is the culprit, I'll fix the manifests.

*Why are you doing this?*

I hate compiling Tilda from source every time they release an update.


## Troubleshooting

something something no warranty something something, if an ebuild broke simply open an issue, I'll deal with it.


