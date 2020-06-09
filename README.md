# teamstommobile

A new Flutter application.

## Getting Started with github

Make sure you are on a desktop or laptop

Step 1: Click on Fork at the top right corner

Step 2: Click on clone or download, copy the url you see after clicking on it

Step 3: Head to your local machine and create a folder, (this step is not necessary but to keep your work organized on your local machine, you can create folder called ‘github repo’ on your desktop).

Step 4: Open your preferred terminal

Here you have arrays of choice, you could use git bash (you have to download it to use it. Download it here -> [GitHub]https://git-scm.com/downloads)), powershell or your default window terminal.

If you want to use git bash:
4.1 Open the ‘github repo’ folder, remember you saved it on your desktop.
Right-click anywhere in the folder and choose ‘git bash here’, automatically git bash will open.

*If you want to use the terminal
4.2 press Window + R on your keyboard

Step 5:git clone pasteTheUrlOfTheLinkYouCopiedInStep2

It should look like this
git clone https://github.com/{yourGithubUsername}/HNG_storm-task.git

Step 6: To start your work, work the directory that contains the project files.
cd teamstorm_mobile

Step 7: git remote add upstream https://github.com/ooluseye16/teamstorm_mobile.git

Step 8: git pull upstream development

Note: you will be on the Master branch automatically.
You need to move out of the Master branch to another branch to start your work.

To move to another branch

We will be following standard git naming branch conventions: which is Feature, Bug and Chore.

#Example of a bug? Probably there is a typo in the homepage. Branch Naming: bug/homepage-typo.

#Example of a feature? You created a user login page. Branch Naming: feat/user-login.

#Example of a chore? Update Read me. Branch Naming: chore/update-readme.


Run: git checkout -b feat/<nameOfBranch>
  If it is a feature you created.
  or
  
  Run: git checkout -b bug/<nameOfBranch>
  If it is a bug you corrected.
  or
  
  Run: git checkout -b chore/<nameOfBranch>
  If it is a chore.
  
  The name of your branch should be what you are working on: An example of branch naming is feat/user-login.
  
IE: <nameOfBranch> should be replaced with your branch name or name of the branch you are working on, use hypen where you will normally use space.
  
  For example,
git checkout -b feat/user-login ✅
git checkout -b feat/user login ❌

After you have added the changes to the file or modified the file. Next,

Run: git add .
Run: git commit -m "feat: implemented user login"

git push origin feat/user-login     (Notice how it ends with the branch you created earlier).

Creating Pull requests

PR === Pull request

Go to github.com, locate the repository you forked in step 1

As soon as you get there, you are going to see a green ‘compare and create a pull request’

Click on it, and type your message, click on create pull request. I will merge as soon as possible
