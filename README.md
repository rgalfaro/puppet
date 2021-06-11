# Puppet repository for _Puppet for beginngers_ Book
## Issues with synching with local repo in Vagrant VM:
Github changed the _master_ default branch to _main_, but in git command line, the _master_ branch is the defaul
so a rename was needed in order to be able to sync between local repo and origin (github remote repo)

### First thing first:
#### Creating a local repository:
1. Create a directory for your code, in this case _/home/vagrant/puppet/_  ``` mkdir ~/home/vagrant/puppet ```
2. Move to that directory, ``cd /home/vagrant/puppet`` and run ``git init`` so a local repository will be created within that directory
3. You can configure global paramtes for your local git using: 
`` git config --global user.name "Your user name"
git config --global user.email youremail@your.email.com``

Then you can create files in that directory. 

4. To make _git_ keep track of all files within the directory, run ``git add .`` or ``git add  filename`` to keep track of a specific file.
5. When making changes, to the file, you can check the status using ``git status`` and it will show you if there are changes that need to be commited.
6. Use ``git commit [-m "Comment of this change/commit] filename"`` to commit your changes, check with ``git stauts`` for the commit to be OK and for the HEAD and main branches to be in Sync
7. To add your remove repository as _origin_, run ``git remote add origin URL_OF_YOUR_GIT_REPO``
8. Then you can push your files to the _remote origin_ (your repo), issuing: ``git push -u origin master``

#### Here comes the issue...
As local _git_ uses _master_ as the main branch, and the _remote origin_ AKA your github.com repo uses _main_, you will get some errors, so you will need to change your local repo _master_ to _main_:
``git branch -m master main`` to merge the master branch into main.

Here, if you have files already in your github _main_ branch, you will get errors when trying to *pull* back from _remote origin_ to the _local repo_
So you will need set the branch upstream to the _origin_ branch: ``git branch --set-upstream-to=origin main`` *THIS SEEMS TO WORK...

Then you are good to go, with no issue, to pull from _origin main_ branch to the local repo, using ``git pull origin main`` (maybe you can use  ``git pull --rebase`` just in case...)

## From now on, lets say we get no issues... :smiley:

# Adding SSH keys for not getting prompete every single time for user and password... 

1. You need to create public on the Vagrant server or whenever you are using your local repo with ``ssh-keygen``, check [Github - SSH Auth](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#about-ssh-key-generation) for more information...
2. Then, add the public key to your github account under your profile...
3. Make sure your remote origin is poiting to the SSH and not to the HTTPs link from your github repo: ``git remote show origin``, that should show something like 

```
Warning: Permanently added the RSA host key for IP address '140.82.113.3' to the list of known hosts.``
 * remote origin
  Fetch URL: git+ssh://git@github.com/your_git_user/your_repo.git
  Push  URL: git+ssh://git@github.com/your_git_user/your_repo.git
  HEAD branch: main
  Remote branch:
    main tracked
  Local branch configured for 'git pull':
    main merges with remote main
  Local ref configured for 'git push':
    main pushes to main (fast-forwardable)
```
If it shows the HTTP, then change it, using the command:
``` 
git remote set-url origin git+ssh://git@github.com/your_git_user/your_repo.git
```
Getting the SSH link from you Github repo under:
<img src=/images/githubssh.png>


