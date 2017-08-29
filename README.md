# smart-home-manager
CMPE 295 project

# Steps for development

**Start by cloning the repository in your local machine**

**Verify that your local is updated**

1. Check if you are 'master' repo by using command 'git branch'
2. Branch name with * at start is you current branch.
3. Pull latest changes on master using, 'git pull origin master'

**Create new branch for development**

4. Then create a new branch using, 'git branch <branch-name>' 
5. <branch-name> should be the JIRA task ID (or if using other tool that task ID)
6. Changes for the task ID will be made to the new branch created.

**Commit and push the changes**

7. When ready commit your changes using either 'git commit -m <message>' or SourceTree.
8. Then push you changes using, 'git push origin <branch-name>'. This will push changes to your branch.

**Generate pull request and merge the changes to master**

9. To merge changes with master, generate pull request from Github. New branch pushed should appear on Github for pull request.
10. Other team members will approve the request and then merge the changes with master.

**Delete the branch once the changes are merged to master**

11. Run 'git checkout master' to take back your local to master.
12. Delete the branch by using, 'git branch -D <branch-name>'

**Conflict with master**

May see the conflict in 2 scenarios:

1. You need to get latest from master, so you fetch latest changes from master. OR
2. You create a pull request and github shows conflict with master.

Use below steps to merge master and your branch.

1. On your branch run command 'git fetch origin master' (this will fetch master)
2. Then merge using 'git merge FETCH_HEAD' (this will try to auto merge and show conflict if any)
3. Check for conflicted files using 'git status' (if using Webstorm the conflicted files will be in red)
4. Manually resolve the conflicts (pro-tip: manually see the file on master by browsing on github so that you don't by mistake delete the code of master)
5. Once all the merging is done and you are sure, commit the changes in your branch and push them in your branch.
6. Merged changes will appear in the pull request. Done.

# Tools helpful
**[SourceTree](https://www.sourcetreeapp.com/)** Helps to check the difference between your branch and master files. Good for easy comparison before committing and visual representation of the development.
