# Remote (version) control

### *Highlights*

* Keep stuff in "the cloud" _(class notes)_
* Cool, aesthetically pleasing READMEs _(see example)_
* Organize the madness of a group making changes to a single document _(you will be eternally frustrated by people who don't use git from now on... sorry not sorry)_
* Copy other people's cool things and give them your own flair _(my NE250 notes, forked from Rachels Repo)_


## Attack of the Clones

To start, you need a repository. One way to begin is to make one on your own machine and connect it, but I find it's often easiest to just start on the GitHub website.

### Make and clone a repo
_make and clone a github repo, name it whatever you want "test\_<name>" or whatever_

1. Click the `+` dropdown next to your profile picture on the top right of any GitHub page and select "New Repository"
2. Follow the instructions. This time you should...
	* give it a name (no spaces! We're not noobs and/or we ascribe to the philosophy of fake it 'til you make it)
	* keep your repo public
	* initialize it with a readme

	Once you've got all that, hit the green button at the bottom. Now you have a GitHub repo.
3. Go to the repository and click the green button saying "Clone or download" on the right side of the page. Copy the URL shown beneath the title "Clone with HTTPS"
4. Return to the command line on your computer, go wherever you think makes the most sense to clone (copy) the repo, and type

	```
	git clone <copied-URL>
	```

You're all set! Now you have a GitHub repo and a local clone. Let's put some stuff in it so we can actually start playing around. 

Some ideas:

* add to your README
* find a license
* make a shell script
	(feel free to copy this one liner for a find-and-replace algorithm)
	
	```
	sed blah blah blah
	```
_add your name and a one-to-three sentence bio or phrase to your README_

_make a shell script (find and replace-once)_

_add and commit everything_

## Push, don't shove.

_explain nickname origin, branch master_

_push your repo back onto origin, master_ 

_make some changes to your files (find and replace-global)_

_add and commit the changed files_

_obviously these aren't up on github yet; push the changes to github_


## Pull yourself together now...

_explain why to pull_
_practice pull command (nothing should happen; your local repo is up to date with the remote)_

## When you come to a fork in the road, take both.

_Fork my example repository (have all materials for this lesson)_

_now pull your fork of my repository_


## Fight the current.

_I make changes to my repository, and you don't have them. But you've already forked my repository, and maybe you've even made changes of your own. You don't want to (aka can't) refork. You can label my fork with the handy nicknames we mentioned earlier. Yours is origin. We will call mine upstream._

_call git remote_

_use git remote add_

_pull upstream_

_you have my changes locally, but again, they're not on github; push the changes to github_


## No such thing as bad PR
(the OSS gurus will hunt me down for that one)

_make attendance list. have everyone edit it with their name and year, issue pull request_

_demo how to merge documents_

## Let's branch out a little.

Article: [Do not issue pull requests from your master branch](http://blog.jasonmeridth.com/posts/do-not-issue-pull-requests-from-your-master-branch/)

---
Inspired by Software Carpentry. For more detailed guidance see their [Version Control with Git](https://swcarpentry.github.io/git-novice/) lesson.

Last updated: August, 2017