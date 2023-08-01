# Visicut settings

Settings for [VisiCut](https://github.com/t-oster/VisiCut) (A user-friendly tool to prepare, save and send Jobs to laser cutters) used by [FabLab Altmühlfranken](https://fablab-altmuehlfranken.de).


## Why store the settings in a Git repository?

Like many other labs, we store our VisiCut settings in a Git repository. This has two main benefits:

1. Like with every version control system, we have access to the change history.
1. We can easily publish the settings for the public, allowing users to load the settings right from within VisiCut.


## How can I use this repository manually?

Back up or delete the VisiCut settings directory (on Linux, it is `~/.visicut` in your home directory), then `git clone` this repository:

```
cd ~
mv .visicut/ .visicut-backup/
git clone https://git.fablab-altmuehlfranken.de/fablab/visicut-settings.git .visicut/
```

Alternatively, you can use VisiCut's import feature.
To do so, first [download the repository's `main` branch as a `.zip` archive](https://git.fablab-altmuehlfranken.de/fablab/visicut-settings/archive/main.zip).
Then, rename the file to change `.zip` for `.vcsettings`.
Finally, inside VisiCut, open the "Options" menu and click on "Import Settings".

**Note: You will have to confirm to VisiCut that all your existing settings may be erased and replaced with the settings from the archive!**


## How to make changes?

There are two ways how to make changes: if you have the Git repository checked out in `~/.visicut`, you can make the changes in VisiCut directly, then use Git to check in your changes and push them to a remote repository.

Alternatively, you can clone the repository separately and import the changes from VisiCut, either by copying the files from your `~/.visicut` directory or by `unzip`ping a `.vcsettings` archive exported from VisiCut in the repository root.

**Note: We have a `.gitignore` file in place to make sure unnecessary files are not checked into the repository. We do not guarantee that it is going to cover all cases in the future, so please check your changes before checking them in!**
