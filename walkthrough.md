![](octocat_32px.png)
# Remote (version) control 
###### Mitch Negus 

_All the things we cover are in the walkthrough.md file on my GitHub page_  
_Feel free to follow along there if you get lost (though its probably better if you just let me know if you get stuck since those notes are a bit wordy and I can probably help you get caught up faster)_
_You will clone that repo as part of the lesson, so you will have the notes for all of eternity_

### *Highlights*

* Keep stuff in "the cloud" _(class notes)_
* Cool, aesthetically pleasing READMEs _(see example)_
* Organize the madness of a group making changes to a single document _(you will be eternally frustrated by people who don't use git from now on... sorry not sorry)_
* Copy other people's cool things and give them your own flair _(my NE250 notes, forked from Rachels Repo)_



## Attack of the Clones

To start, you need a repository. One way to begin is to make one on your own machine and connect it, but I find it's often easiest to just start on the GitHub website.

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
	$ git clone <copied-URL>
	```

You're all set! Now you have a GitHub repo and a local clone. Let's put some stuff in it so we can actually start playing around. 

_add your name and a one-to-three sentence bio or phrase to your README_  
_make a shell script (find and replace... once)_


Some ideas:

* add to your README
* find a license
* make a shell script
	(feel free to copy this one liner for a find-and-replace algorithm; run it by supplying the word to find, the word to replace and the file to act on–all in order–after calling the program)
	
	```
	sed s/"$1"/"$2"/ "$3" > "new_$3"
	```

_add and commit everything_

Once you have some files in that repo, we can use the same version control procedures that were set up for local repositories. First, you have to stage your changes with `git add` (use the `-A` option to add everything) and then commit.


```
$ git add <file-to-commit>
$ git commit -m "a message briefly stating what you've done"
```



## Push, don't shove.

_explain nickname origin, branch master_

At this point, you have a GitHub repo on the server and a local copy of it. You put some things in your local repo and made a commit. Now is where you get to start learning the GitHub magic.

To reflect the new changes in your local repository on GitHub you need to make a push. This requires two things–a nickname and a branch. Without going into too much detail just yet (more to come later), your GitHub repository could eventually be a derivative of some other repository or have a number of different branches. By convention, the remote repository (often just called "the remote") for your local git repo is nicknamed *origin* and the most basic branch is the *master* branch.

_push your repo back onto origin, master_ 

Now, push your repo onto the remote by entering

```
$ git push origin master
```

Check out your GitHub page and voila! There are your commits!

This is the process you will repeat over and over. Make changes. Add and commit. Push to remote.

You can keep trying if you want. For instance, try updating the find-and-replace shell script you made before. That one only replaced the first word on every line, but if you change the single line of code to

```
sed s/"$1"/"$2"/g "$3" > "new_$3"
```
it will change all occurrences of the word in your document. 

_make some changes to your files (find and replace-global)_  
_add and commit the changed files_  
_obviously these aren't up on github yet; push the changes to github_

Add and commit those changes, push to the remote using the same steps as before, and then let's move on.



## When you come to a fork in the road, take both.

I mentioned earlier that you might want to have a repo that is a derivative of another. You can accomplish this by *forking* the repository. 

_Fork my example repository (have all materials for this lesson)_

1. Navigate to the repository containing these notes, [here](https://github.com/mnegus01/remote-control). 
2. Click the "Fork" button in the top right corner, and select your profile if it gives you a choice.

You have now forked the repo, and it is a part of your GitHub. The coolest part is that everything you could do with your own repo from before, you can do with this one too! And, even better, any changes you make to yours don't affect mine at all! (We *can* change that last bit though if you come up with something good, just hang on a little longer.)

Let's try it out. Clone the fork (you probably want it nearby the repo you made earlier) and make some changes. You could create the (nearly) pointless shell script `yup.sh` with this line of code:

```
yes "$1"
```

Test it out (just call `sh yup.sh` followed by a word of your choice). 

\* Note: sometimes you might want to kill a program that is running.  If you didn't already know, `ctrl`+`c` does this in a Unix environment.

Add, commit, and push the changes again.



## Pull yourself together now...

The beauty of GitHub is that it is remote, and so you can access it from anywhere. All you have to do is clone your repo to whatever computer you are on, and you can do your work. It's like having a super-powered Dropbox.

But, if you make changes on one computer and push to the remote, and then make changes on a different computer and push to the same remote, it is pretty helpful to also be able to update your local copy. This requires you to pull from the remote. 

Just like it's opposite, push, the pull command requires both the remote nickname and branch. Enter

```
$ git pull origin master
```

_practice pull command (nothing should happen; your local repo is up to date with the remote)_

What happened? Hopefully nothing, if there haven't been any changes to your remote, pulling it shouldn't change anything on your local. 

Still, its good practice to pull a repo before you start making changes. This way your local copy will stay up to date with the latest changes. (This is especially important when working on large collaborative projects, where many people may be accessing a repo.)



## Fight the current.

_I make changes to my repository, and you don't have them. But you've already forked my repository, and maybe you've even made changes of your own. You don't want to (aka can't) refork. You can label my fork with the handy nicknames we mentioned earlier. Yours is origin. We will call mine upstream._

If you're repeating this after the workshop, you probably already got the attendance sheet (`attendance.md`) when you forked the repo. Sorry, about that. You'll have to use your imagination for this section.

Say that I just added the attendance list document to my repo after you forked it. You don't want to fork again, but you want to get that markdown file as part of your repo. Wouldn't it be great if you could also pull from my repo? You can!

I mentioned before that the nickname of your forked repo was *origin*. Well, you can also nickname my repo, with the conventional name being *upstream*. This way, instead of just having your one remote, you'll have two: mine and yours!

_call git remote_

First, lets see what remotes we already have. Type 

```
$ git remote -v
```
and you should see the output list two remotes labeled `origin` (exactly the same, except one is fetch and the other is push). 

_use git remote add_

Adding an upstream is as simple as entering

```
$ git remote add upstream <upstream-URL>
```
where you again use the remote nickname and the branch. The URL is the same one you would use to clone the upstream repo. 

Use `git remote -v` again and now you should have four remotes. Two labeled origin and two labeled upstream.

_pull upstream_

Now, pull from upstream using the same syntax as for pulling from your own remote, just swap *origin* for *upstream*:

```
$ git pull upstream master
```
_you have my changes locally, but again, they're not on github; push the changes to github_

Now, if you check your directory, you have my changes (the attendance list, `attendance.md`) in your local. You can push these to remote using all the same steps as before.

Add your name, and year to `attendance.md` and push it to your remote.


## No such thing as bad PR
(the OSS gurus will hunt me down for that one)

_make attendance list. have everyone edit it with their name and year, issue pull request_

_demo how to merge documents_

## Let's branch out a little.

Article: [Do not issue pull requests from your master branch](http://blog.jasonmeridth.com/posts/do-not-issue-pull-requests-from-your-master-branch/)


![](octocat_32px.png)

---
Inspired by Software Carpentry. For more practice, see their [Version Control with Git](https://swcarpentry.github.io/git-novice/) lesson.

Last updated: August, 2017.