![](octocat_32px.png)
# Remote (version) control 
###### Mitch Negus 

### *Highlights*

* Keep stuff in "the cloud" 
* Cool, aesthetically pleasing READMEs (or other markdown docs)
* Organize the madness of a group making changes to a single document 
* Copy other people's cool things and give them your own flair



## Attack of the Clones

To start, you need a repository. One way to begin is to make one on your own machine and connect it, but I find it's often easiest to just start on the GitHub website.

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

Some ideas:

* add to your README
* find a license
* make a shell script
	(feel free to copy this one liner for a find-and-replace algorithm; run it by supplying the word to find, the word to replace and the file to act on–all in order–after calling the program)
	
	```
	sed s/"$1"/"$2"/ "$3" > "new_$3"
	```

Once you have some files in that repo, we can use the same version control procedures that were set up for local repositories. First, you have to stage your changes with `git add` (use the `-A` option to add everything) and then commit.

```
$ git add <file-to-commit>
$ git commit -m "a message briefly stating what you've done"
```



## Push, don't shove.

At this point, you have a GitHub repo on the server and a local copy of it. You put some things in your local repo and made a commit. Now is where you get to start learning the GitHub magic.

To reflect the new changes in your local repository on GitHub you need to make a push. This requires two things–a nickname and a branch. Without going into too much detail just yet (more to come later), your GitHub repository could eventually be a derivative of some other repository or have a number of different branches. By convention, the remote repository (often just called "the remote") for your local git repo is nicknamed *origin* and the most basic branch is the *master* branch.

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

Add and commit those changes, push to the remote using the same steps as before, and then let's move on.



## When you come to a fork in the road, take both.

I mentioned earlier that you might want to have a repo that is a derivative of another. You can accomplish this by *forking* the repository. 

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

What happened? Hopefully nothing, if there haven't been any changes to your remote, pulling it shouldn't change anything on your local. 

Still, its good practice to pull a repo before you start making changes. This way your local copy will stay up to date with the latest changes. (This is especially important when working on large collaborative projects, where many people may be accessing a repo.)



## Fight the current.

If you're repeating this after the workshop, you probably already got the attendance sheet (`attendance.md`) when you forked the repo. Sorry, about that. You'll have to use your imagination for this section.

Say that I just added the attendance list document to my repo after you forked it. You don't want to fork again, but you want to get that markdown file as part of your repo. Wouldn't it be great if you could also pull from my repo? You can!

I mentioned before that the nickname of your forked repo was *origin*. Well, you can also nickname my repo, with the conventional name being *upstream*. This way, instead of just having your one remote, you'll have two: mine and yours!

First, lets see what remotes we already have. Type 

```
$ git remote -v
```
and you should see the output list two remotes labeled `origin` (exactly the same, except one is fetch and the other is push). 

Adding an upstream is as simple as entering

```
$ git remote add upstream <upstream-URL>
```
where you again use the remote nickname and the branch. The URL is the same one you would use to clone the upstream repo. 

Use `git remote -v` again and now you should have four remotes. Two labeled origin and two labeled upstream.

Now, pull from upstream using the same syntax as for pulling from your own remote, just swap *origin* for *upstream*:

```
$ git pull upstream master
```

Now, if you check your directory, you have my changes (the attendance list, `attendance.md`) in your local. You can push these to remote using all the same steps as before.

Add your name and year to `attendance.md` and push it to your remote.



## No such thing as bad PR
(Don't tell the OSS gurus I said that.)

Earlier, I mentioned that GitHub is nice because your changes won't affect the upstream repo. It gives you the freedom to mess around without being able to break anything permanently. Still, what if you have something really good. Well, then you can issue a pull request. Pull requests (PRs) let the owner of an upstream repository pull your repo fork into theirs if they like what they see. 

To issue a pull request, go to the pull requests tab in your repo and click the link to "Create a pull request." GitHub will then give you a status report of how well the current fork and the upstream fork match up. If it looks like they play nice, do what you always do and hit the green button. 

At that point, I also have the ability to see a comparison of the two. If everything checks out, I'll merge your changes into my repo, and everybody's happy!



## Let's branch out a little.

Finally, I mentioned earlier that you might eventually want more branches in your repo than just the master branch. To illustrate, here's a scenario (adapted from a true story):

> You are contributing to matplotlib, a large open source project. You've forked the master branch of the project, cloned the repo spent a couple days fixing a bug in the code. You finally get it solved, you commit your changes to your master branch, and issue a pull request, feeling super proud that you contributed to a body of code that is used by people all over the globe. You're so excited, you go back to fix another issue on the seemingly endless list of bugs. 
> 
> You work on it for a while, and again think you find a solution. You make a change and commit it. This time though, when you test the solution, something else throws an error in the code. You're stumped. 
> 
> Meanwhile, at headquarters, a veteran matplotlib contributor is looking at your code. They think "Wow, that's a great fix!" As they get ready to merge it into the whole project, they notice that your latest commit introduced a new error. Unbeknownst to you, that commit was also included in the pull request, *even though you committed after issuing the pull request.* Despite your sweet fix, they can't merge your changes into the project.

To get around this, you can checkout a separate branch of the project. Name it anything you want, make your changes and commits in that branch, and when you go to issue the pull request, issue it for the new branch. Now, if you go on to make more changes, make those in a another new branch. Your commits to the first new branch will remain clean, and anything you do to the second new branch will be kept in isolation.

Once the pull request goes through, you can either go back to using the branch again, or delete it completely.

For more explicit instructions on how and why to use branches, read this article: [Do not issue pull requests from your master branch](http://blog.jasonmeridth.com/posts/do-not-issue-pull-requests-from-your-master-branch/)



![](octocat_32px.png)

---
Inspired by Software Carpentry. For more practice, see their [Version Control with Git](https://swcarpentry.github.io/git-novice/) lesson.

Last updated: August, 2017.