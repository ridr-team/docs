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


# Tools helpful
**[SourceTree](https://www.sourcetreeapp.com/)** Helps to check the difference between your branch and master files. Good for easy comparison before committing and visual representation of the development.
